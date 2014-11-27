function y = fun_model(N,rho_tot,pop_frac,LEO_to_civ,P,v_civ,v_LEO,k,J_max,nIter,L,T)

%% Initializing the Map (Array of Structures)

% Definition of the Default Structure:
default_struct = struct('type',0,'H',0,'L',[0 0],'v',0,'T',0,'R',0,'state',0,'age',0,'life_exp',0,'sentenced',0,'served',0);

% Properties of the Map:
N = 20; % size
rho_tot = 0.7; % desity of the population
pop_frac = [1/2 1/2]; % population fractions of the three ethnic groups
LEO_to_civ = 0.01; % soldiers to civilians ratio
P = 0.01; % probability of the civilians to clone themselves in one iteration

% Properties of the Civilians:
v_civ = 2; % vision
k = 2.3; % parameter to estimate arrest probability P

% Properties of the Soldiers:
v_LEO = 3; % vision

map = fun_init_map(default_struct,N,rho_tot,LEO_to_civ,v_civ,v_LEO,pop_frac);

%% Initialization Of The Jail

J_max = 30;

jail = fun_init_jail(default_struct,J_max);

%% Preallocation Storage Variables

nIter = 3e2;

sum_kills = zeros(nIter,1);
sum_arrests = zeros(nIter,1);

n_civ = N^2*rho_tot*(1-LEO_to_civ); % total number of civilians
n_1(1) = n_civ*pop_frac(1); % number of civilians 1
n_2(1) = n_civ*pop_frac(2); % number of civilians 2

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
    

end

end