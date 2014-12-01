function y = fun_model(N,rho_tot,pop_frac,LEO_to_civ,P,v_civ,v_LEO,k,J_max,T,L,max_age,nIter)

%% Initializing the Map (Array of Structures)

% Definition of the Default Structure:
default_struct = struct('type',0,'H',0,'L',0,'v',0,'T',0,'R',0,'state',0,'age',0,'life_exp',0,'sentenced',0,'served',0);

map = fun_init_map(default_struct,N,rho_tot,LEO_to_civ,v_civ,v_LEO,pop_frac,L,T,max_age);

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
    
%     arrest = 0;
    kill = 0;

    if map(i,j).type == 3
        [map,jail,~] = fun_action_LEO(i,j,map,jail,J_max,default_struct);
    else
        [map,kill] = fun_action_civ(map,i,j,default_struct,k);
    end
    
    %% Recording The Results Of The Action
    
    if n == 1
%         sum_arrests(n) = arrest;
        sum_kills(n) = kill;
    else
%         sum_arrests(n) = sum_arrests(n-1) + arrest;
        sum_kills(n) = sum_kills(n-1) + kill;
    end
    
    %% Cloning
    
    map = fun_clone(map,P);

    %% Update Of The Jail

    [jail,map] = fun_update_jail(jail,map,default_struct);

    %% Update Of The Map

    map = fun_update_map(map,default_struct);
    

end

y = sum_kills(end)/n_civ;

end