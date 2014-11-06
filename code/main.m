close all;
clear all;
clc;

%% Initializing the Map (Array of Structures)

% Definition of the Default Structure:
default_struct = struct('type',0,'H',0,'L',[0 0 0],'v',0,'T',0,'R',0,'state',0,'age',0,'life_exp',0,'sentenced',0,'served',0);

% Properties of the Map:
N = 10; % size
rho_tot = 0.8; % desity of the population
pop_frac = [1/2 1/2 0]; % population fractions of the three ethnic groups
soldier_to_civ = 0.05; % soldiers to civilians ratio
P = 0.01; % probability of the civilians to clone themselves in one iteration

% Properties of the Civilians:
v_civ = 2; % vision
k = 2; % parameter to estimate arrest probability P

% Properties of the Soldiers:
v_soldier = 3; % vision

map = fun_init_map(default_struct,N,rho_tot,soldier_to_civ,v_civ,v_soldier,pop_frac);

%% Initialization Of The Jail

J_min = 100;
J_max = 200;

jail = fun_init_jail(default_struct,J_max);

%% Preallocation Storage Variables

nIter = 20;

n_1 = zeros(1,nIter+1);
n_2 = zeros(1,nIter+1);
n_3 = zeros(1,nIter+1);

sum_kills = zeros(nIter,1);
sum_arrests = zeros(nIter,1);

n_civ = N^2*rho_tot*(1-soldier_to_civ); % total number of civilians
n_1(1) = n_civ*pop_frac(1); % number of civilians 1
n_2(1) = n_civ*pop_frac(2); % number of civilians 2
n_3(1) = n_civ*pop_frac(3); % number of civilians 3

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

    if map(i,j).type == 4
        [map,jail,arrest] = fun_action_soldier(i,j,map,jail,J_min,J_max,default_struct);
    else
        [map,kill] = fun_action_civ(map,i,j,default_struct);
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

    %% Update Of The Jail

    [jail,map] = fun_update_jail(jail,map,default_struct);

    %% Update Of The Map

    map = fun_update_map(map,default_struct);
    
    %% Graphical Representation

    % Extract the Hardship Values From the Map:
    H = fun_visualization_hardship(map);

    % Draw The Scatter Plot:
    figure(1)
    scatter(H(:,1), H(:,2),100,H(:,3),'filled','s');

    xlabel('X');
    ylabel('Y');
    str = num2str(n);
    str = sprintf('%s %s', 'Map In Turn', str);
    title(str,'FontSize',14);
    grid on;
    xlim([1 N])
    ylim([1 N])

    caxis([0 1]);
    colormap(jet);
    ch = colorbar;
    set(ch, 'YTick', [0:0.1:1]);
    set(get(ch, 'ylabel'), 'string', 'Hardship','FontSize',14);
    
    M_1(n) =getframe(gcf);
    
    % Extract The Information About The Individuals From The Map:
    [C1_active,C1_quiet,C2_active,C2_quiet,C3_active,C3_quiet,Cops] = fun_visualization_agents(map);
    
    f2 = figure(2);
    hold all
    scatter(C1_quiet(:,1), C1_quiet(:,2),100,'filled','s','MarkerFaceColor','y');
    scatter(C1_active(:,1), C1_active(:,2),100,'filled','s','MarkerFaceColor','y','MarkerEdgeColor','r');
    scatter(C2_quiet(:,1), C2_quiet(:,2),100,'filled','s','MarkerFaceColor','g');
    scatter(C2_active(:,1), C2_active(:,2),100,'filled','s','MarkerFaceColor','g','MarkerEdgeColor','r');
    scatter(C3_quiet(:,1), C3_quiet(:,2),100,'filled','s','MarkerFaceColor','b');
    scatter(C3_active(:,1), C3_active(:,2),100,'filled','s','MarkerFaceColor','b','MarkerEdgeColor','r');
    scatter(Cops(:,1), Cops(:,2),100,'filled','s','MarkerFaceColor','k');
    grid on;
    title(str,'FontSize',14);
    xlim([0 10])
    ylim([0 10])
    hold off
    
    M_2(n) = getframe(gcf);
    delete(f2) % deleting figure to have correct results
    
    %% Updating The Count Of The Civilians
    
    n_1(n+1) = length(C1_quiet(:,1))+length(C1_active(:,1));
    n_2(n+1) = length(C2_quiet(:,1))+length(C2_active(:,1));
    n_3(n+1) = length(C3_quiet(:,1))+length(C3_active(:,1));

end

f3 = figure(3);
subplot(1,2,1)
hold on
plot(1:nIter,sum_kills,1:nIter,sum_arrests)
xlim([1 nIter])
xlabel('Turn','FontSize',14)
ylabel('Cumulative Number','FontSize',14)
legend({'Killings','Arrests'},'FontSize',14,'location','NorthWest')
hold off

subplot(1,2,2)
hold on
plot(0:nIter,n_1,0:nIter,n_2,0:nIter,n_3)
xlabel('Turn','FontSize',14)
ylabel('Population','FontSize',14)
legend({'Ethnicity 1','Ethnicity 2','Ethnicity 3'},'FontSize',14,'location','SouthEast')
hold off

% movie(gcf,M,2,1);