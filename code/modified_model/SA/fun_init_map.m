%% Map Initialization Function

% This function initializes the map for the scenario.

% Input arguments:

% default_struct is a structure that contains no information and just acts
% as a place holder.

% N is the total number of grid points each spatial dimension.

% rho_tot is the initial total density of the population on the map.

% cop_to_civ is the initial ratio of cops to civilians.

function map = fun_init_map(default_struct,N,rho_tot,LEO_to_civ,v_civ,v_LEO,pop_frac,L_mean,L_std,T_mean,T_std,max_age)

% Preallocation of the Array of Structures:
map = repmat(default_struct,N,N); % array of structures representing the map

n_fields = N^2; % number of fields on the map
n_civ = n_fields*rho_tot*(1-LEO_to_civ); % total number of civilians
n_1 = n_civ*pop_frac; % number of civilians 1
n_2 = n_civ*(1-pop_frac); % number of civilians 2
n_LEO = n_fields*rho_tot*LEO_to_civ; % number of soliders


% Initialization of the LEOs:
for k=1:n_LEO
    
    % Choose random position on the map:
    i = unidrnd(N);
    j = unidrnd(N);
    
    % Repeat selection if position is already taken:
    while(map(i,j).type ~= 0)
        i = unidrnd(N);
        j = unidrnd(N);
    end
    
    % Define Characteristics:
    map(i,j).type = 3;
    map(i,j).v = v_LEO;
    
end

pd_L = makedist('Normal','mu',L_mean,'sigma',L_std);
t_L = truncate(pd_L,0,1);
pd_T = makedist('Normal','mu',T_mean,'sigma',T_std);
t_T = truncate(pd_T,-1,1);

% Initialization of the Civilians 1:
for k=1:n_1
    
    % Choose random position on the map:
    i = unidrnd(N);
    j = unidrnd(N);
    
    % Repeat selection if position is already taken:
    while(map(i,j).type ~= 0)
        i = unidrnd(N);
        j = unidrnd(N);
    end
    
    % Define Characteristics:
    map(i,j).type = 1;
    map(i,j).H = unifrnd(0,1); % hardship
    map(i,j).L = random(t_L); % legitimacy
    map(i,j).v = v_civ; % vision
    map(i,j).T = random(t_T); % violence threshold
    map(i,j).R = unifrnd(0,1); % risk aversion
    map(i,j).life_exp = unidrnd(max_age); % life expectancy
    
end

% Initialization of the Civilians 2:
for k=1:n_2
    
    % Choose random position on the map:
    i = unidrnd(N);
    j = unidrnd(N);
    
    % Repeat selection if position is already taken:
    while(map(i,j).type ~= 0)
        i = unidrnd(N);
        j = unidrnd(N);
    end
    
    % Define Characteristics:
    map(i,j).type = 2;
    map(i,j).H = unifrnd(0,1); % hardship
    map(i,j).L = random(t_L); % legitimacy
    map(i,j).v = v_civ; % vision
    map(i,j).T = random(t_T); % violence threshold
    map(i,j).R = unifrnd(0,1); % risk aversion
    map(i,j).life_exp = unidrnd(max_age); % life expectancy
    
end

end