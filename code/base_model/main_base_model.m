close all;
clear all;
clc;

%% Initializing the Map (Array of Structures)

% Definition of the Default Structure:
default_struct = struct('type',0,'H',0,'L',[0 0],'v',0,'T',0,'R',0,'state',0,'age',0,'life_exp',0,'sentenced',0,'served',0);

% Properties of the Map:
N = 40; % size
rho_tot = 0.7; % initial desity of the population
pop_frac = 0.5; % initial fraction of ethnicity 1 of the total population
LEO_to_civ = 0.05; % soldiers to civilians ratio

% Properties of the Civilians:
L = 0.4;
T = 0.1;
v_civ = 2; % vision
max_age = 200;
k_P = 2.3; % parameter to estimate arrest probability P
P = 0.025; % probability of the civilians to clone themselves in one iteration

% Properties of the LEOs:
v_LEO = 3; % vision

map = fun_init_map(default_struct,N,rho_tot,LEO_to_civ,v_civ,v_LEO,pop_frac,L,T,max_age);

%% Initialization Of The Jail

J_max = 30;

jail = fun_init_jail(default_struct,J_max);

%% Preallocation Storage Variables

nIter = 15*max_age;

n_1 = zeros(1,nIter+1);
n_2 = zeros(1,nIter+1);
n1_active = zeros(1,nIter);
n2_active = zeros(1,nIter);
n_jail = zeros(1,nIter);

sum_kills = zeros(nIter,1);
sum_arrests = zeros(nIter,1);

n_civ = N^2*rho_tot*(1-LEO_to_civ); % total number of civilians
n_1(1) = n_civ*pop_frac; % number of civilians 1
n_2(1) = n_civ*(1-pop_frac); % number of civilians 2

for n=1:nIter
    %% Movement

    % Choose Random Agent on the Map:
    i = unidrnd(N);
    j = unidrnd(N);

    % Repeat Selection if no Agent at this Position:
    while map(i,j).type == 0
        i = unidrnd(N);
        j = unidrnd(N);
    end

    [map,i,j] = fun_movement(map,i,j,default_struct,N);


    %% Action
    
    arrest = 0;
    kill = 0;

    if map(i,j).type == 3
        [map,jail,arrest] = fun_action_LEO(i,j,map,jail,J_max,default_struct);
    else
        [map,kill] = fun_action_civ(map,i,j,default_struct,k_P);
    end
    
    %% Recording The Results Of The Action
    
    if n == 1
        sum_arrests(n) = arrest;
        sum_kills(n) = kill;
    else
        sum_arrests(n) = sum_arrests(n-1) + arrest;
        sum_kills(n) = sum_kills(n-1) + kill;
    end
    
    %% Cloning
    
    map = fun_clone(map,P);
    
    %% Update Of The Map

    map = fun_update_map(map,default_struct);
    
    %% Update Of The Jail

    [jail,map] = fun_update_jail(jail,map,default_struct);
    
    %% Graphical Representation

    % Extract the Grievance Values From the Map:
    G = fun_visualization_grievance(map);

    % Draw The Scatter Plot:
%     figure(1)
%     scatter(G(:,1), G(:,2),100,G(:,3),'filled','s');
%     
%     str = num2str(n);
%     str = sprintf('%s %s', 'Map In Turn', str);
%     title(str,'FontSize',14);
%     xlim([1 N])
%     ylim([1 N])
% 
%     caxis([0 1]);
%     colormap(cool);
%     ch = colorbar;
%     set(ch, 'YTick', [0:0.1:1]);
%     set(get(ch, 'ylabel'), 'string', 'Grievance','FontSize',14);
%     set(gca,'XTickLabel',[],'YTickLabel',[]);
%     
%     M_1(n) =getframe(gcf);
%     
%     % Extract The Information About The Individuals From The Map:
    [C1_active,C1_quiet,C2_active,C2_quiet,Cops] = fun_visualization_agents(map);
%     
%     f2 = figure(2);
%     hold all
%     scatter(C1_quiet(:,1), C1_quiet(:,2),100,'filled','s','MarkerFaceColor','y');
%     scatter(C1_active(:,1), C1_active(:,2),100,'filled','s','MarkerFaceColor','y','MarkerEdgeColor','r');
%     scatter(C2_quiet(:,1), C2_quiet(:,2),100,'filled','s','MarkerFaceColor','g');
%     scatter(C2_active(:,1), C2_active(:,2),100,'filled','s','MarkerFaceColor','g','MarkerEdgeColor','r');
%     scatter(Cops(:,1), Cops(:,2),100,'filled','s','MarkerFaceColor','k');
%     title(str,'FontSize',14);
%     xlim([1 N])
%     ylim([1 N])
%     
%     set(gca,'XTickLabel',[],'YTickLabel',[]);
%     
%     hold off
%     
%     M_2(n) = getframe(gcf);
%     if n < nIter
%         delete(f2) % deleting figure to have correct results
%     end
    
    %% Updating The Count Of The Civilians
    
    n_1(n+1) = length(C1_quiet(:,1))+length(C1_active(:,1));
    n_2(n+1) = length(C2_quiet(:,1))+length(C2_active(:,1));
    
    n1_active(n) = length(C1_active(:,1));
    n2_active(n) = length(C2_active(:,1));
    
    for l = 1:size(jail,2)
        if jail(l).type ~= 0
            n_jail(n) = n_jail(n)+1;
        end
    end
    

end

f3 = figure(3);
subplot(1,2,1)
hold on
plot(1:nIter,sum_kills,1:nIter,sum_arrests)
xlim([1 nIter])
ylim([0 nIter])
xlabel('Turn','FontSize',14)
ylabel('Cumulative Number','FontSize',14)
legend({'Killings','Arrests'},'FontSize',14,'location','NorthWest')
hold off

subplot(1,2,2)
hold on
plot(0:nIter,n_1,0:nIter,n_2)
xlim([0 nIter])
ylim([0 N^2])
xlabel('Turn','FontSize',14)
ylabel('Population','FontSize',14)
legend({'Ethnicity 1','Ethnicity 2'},'FontSize',14,'location','SouthEast')
hold off

saveas(f3,'kills_arrests_L_04.png')

f4 = figure(4);
plot(1:nIter,n1_active,1:nIter,n2_active,1:nIter,n_jail)
xlim([0 nIter])
ylim([0 nIter])
xlabel('Turn','FontSize',14)
ylabel('Number [-]','FontSize',14)
legend({'Actives Ethnicity 1','Actives Ethnicity 2','Civilians in Jail'},'FontSize',14,'location','best')

saveas(f4,'active_jail_L_04.png')

f5 = figure(5);
hold on
scatter(C1_quiet(:,1), C1_quiet(:,2),100,'filled','s','MarkerFaceColor','y');
scatter(C1_active(:,1), C1_active(:,2),100,'filled','s','MarkerFaceColor','y','MarkerEdgeColor','r','LineWidth',2);
scatter(C2_quiet(:,1), C2_quiet(:,2),100,'filled','s','MarkerFaceColor','g');
scatter(C2_active(:,1), C2_active(:,2),100,'filled','s','MarkerFaceColor','g','MarkerEdgeColor','r','LineWidth',2);
scatter(Cops(:,1), Cops(:,2),100,'filled','s','MarkerFaceColor','k');
xlim([1 N])
ylim([1 N])
grid on

set(gca,'XTickLabel',[],'YTickLabel',[],'XTick',1:N,'YTick',1:N);

hold off

saveas(f5,'map_end_L_04.png')

f6 = figure(6);
scatter(G(:,1), G(:,2),100,G(:,3),'filled','s');
xlim([1 N])
ylim([1 N])

caxis([0 1]);
colormap(cool);
ch = colorbar;
set(ch, 'YTick', [0:0.1:1]);
set(get(ch, 'ylabel'), 'string', 'Grievance','FontSize',14);
set(gca,'XTickLabel',[],'YTickLabel',[],'XTick',1:N,'YTick',1:N);
grid on

saveas(f6,'grevance_end_L_04.png')

% movie(gcf,M,2,1);
