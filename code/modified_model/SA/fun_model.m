function y = fun_model(N,rho_tot,pop_frac,LEO_to_civ,P,v_civ,v_LEO,k_P,J_max,L_mean,L_std,T_mean,T_std,k_L,max_age,nIter)

%% Interval Transformation Input Parameters

rho_tot_a = 0.1;
rho_tot_b = 0.9;

rho_tot = rho_tot*(rho_tot_b-rho_tot_a)+rho_tot_a;

pop_frac_a = 0.1;
pop_frac_b = 0.9;

pop_frac = pop_frac*(pop_frac_b-pop_frac_a)+pop_frac_a;

LEO_to_civ_a = 0;
LEO_to_civ_b = 0.1;

LEO_to_civ = LEO_to_civ*(LEO_to_civ_b-LEO_to_civ_a)+LEO_to_civ_a;

P_a = 0.001;
P_b = 0.05;

P = P*(P_b-P_a)+P_a;

v_civ_a = 0.5;
v_civ_b = 5.4999999;

v_civ = v_civ*(v_civ_b-v_civ_a)+v_civ_a;
v_civ = round(v_civ);

v_LEO_a = 0.5;
v_LEO_b = 5.4999999;

v_LEO = v_LEO*(v_LEO_b-v_LEO_a)+v_LEO_a;
v_LEO = round(v_LEO);

k_a = 1;
k_b = 3;

k_P = k_P*(k_b-k_a)+k_a;

J_max_a = 9.5;
J_max_b = 200.4999999;

J_max = J_max*(J_max_b-J_max_a)+J_max_a;
J_max = round(J_max);

L_mean_a = 0.1;
L_mean_b = 0.9;

L_mean = L_mean*(L_mean_b-L_mean_a)+L_mean_a;

L_std_a = 0.05;
L_std_b = 1;

L_std = L_std*(L_std_b-L_std_a)+L_std_a;

T_mean_a = -0.9;
T_mean_b = 0.9;

T_mean = T_mean*(T_mean_b-T_mean_a)+T_mean_a;

T_std_a = 0.05;
T_std_b = 1;

T_std = T_std*(T_std_b-T_std_a)+T_std_a;

k_L_a = 0;
k_L_b = 1;

k_L = k_L*(k_L_b-k_L_a)+k_L_a;

%% Initializing the Map (Array of Structures)

% Definition of the Default Structure:
default_struct = struct('type',0,'H',0,'L',0,'v',0,'T',0,'R',0,'state',0,'age',0,'life_exp',0,'sentenced',0,'served',0);

map = fun_init_map(default_struct,N,rho_tot,LEO_to_civ,v_civ,v_LEO,pop_frac,L_mean,L_std,T_mean,T_std,max_age);

%% Initialization Of The Jail

jail = fun_init_jail(default_struct,J_max);

%% Preallocation Storage Variables

sum_kills = zeros(nIter,1);
n_civ = N^2*rho_tot*(1-LEO_to_civ); % total number of civilians at the beginning

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
    
    kill = 0;

    if map(i,j).type == 3
        [map,jail,~] = fun_action_LEO(i,j,map,jail,J_max,default_struct,k_L);
    else
        [map,kill] = fun_action_civ(map,i,j,default_struct,k_P,k_L);
    end
    
    %% Recording The Results Of The Action
    
    if n == 1
        sum_kills(n) = kill;
    else
        sum_kills(n) = sum_kills(n-1) + kill;
    end
    
    %% Cloning
    
    map = fun_clone(map,P);
    
    %% Update Of The Map

    map = fun_update_map(map,default_struct);

    %% Update Of The Jail

    [jail,map] = fun_update_jail(jail,map,default_struct);
    

end

y = sum_kills(end)/n_civ;

end