%% Function For the Action of the Civilians

% This function will perform all the actions of the agent after movement,
% if the selected agent is a civilian. First, it will determine the local
% active-to-soldier ratio. Second, it will determine the net risk and the
% grievances. Then it will compute the vector (G-N) - T. If at least one
% entry of this vector is larger than zero, the selected agent will kill a
% civilian from an other ethinc group within reach.

function [map,kill] = fun_action_civ(map,i,j,default_struct,k_P,k_L)

%% Analyze Fields Within Vision

% Initialization:
surr_LEOs = 0;
surr_actives = 1;
range = map(i,j).v;
N = size(map,1);
civilians = struct('coordinates',[]);
civilians = repmat(civilians,2,1);

% Type of the Examined Agent:
type = map(i,j).type;

for k=-range:range
    range_j = range - abs(k);
        for m=-range_j:range_j
            i_temp = i + k;
            j_temp = j + m;
            
            % Check If Indices Are Within Legal Range:
            if i_temp > N
                continue
            elseif i_temp < 1
                continue
            elseif j_temp > N
                continue
            elseif j_temp < 1
                continue
            end
            
            % Gather Information About the Inspected Field and Store It:
            if map(i_temp,j_temp).type == 1
                civilians(1).coordinates = [civilians(1).coordinates; i_temp j_temp];
            elseif map(i_temp,j_temp).type == 2
                civilians(2).coordinates = [civilians(2).coordinates; i_temp j_temp];
            end
            
            if map(i_temp,j_temp).type == type && map(i_temp,j_temp).state == 1
                surr_actives = surr_actives + 1;
            elseif map(i_temp,j_temp).type == 3
                surr_LEOs = surr_LEOs + 1;
            end
            
        end
end


%% Choice of the Action

ratio = surr_LEOs/surr_actives;

P = 1 - exp(-k_P*ratio); % estimated arrest probability
G = map(i,j).H.*(1-map(i,j).L); % grievance of the selected civilian
N = P*map(i,j).R; % net risk of the selected civilian

kill = 0;

if type == 1
    index = 2;
elseif type == 2
    index = 1;
end

if (G-N) > map(i,j).T && isempty(civilians(index).coordinates) ~= 1
    n_opp = size(civilians(index).coordinates,1);
    ind_opp = unidrnd(n_opp);
    i_opp = civilians(index).coordinates(ind_opp,1);
    j_opp = civilians(index).coordinates(ind_opp,2);
    map(i_opp,j_opp) = default_struct;
    kill = 1;
end


%% Update of State

if (G-N) <= map(i,j).T
    map(i,j).state = 0;
elseif kill == 1
    map(i,j).state = 1;
end

%% Update The Legitimacy of the Group of the Violent Civilian

opp_civ = [];
N = size(map,1);

if kill == 1
    for k=-range:range
        range_j = range - abs(k);
            for m=-range_j:range_j
                i_temp = i_opp + k;
                j_temp = j_opp + m;

                % Check If Indices Are Within Legal Range:
                if i_temp > N || i_temp < 1 || j_temp > N || j_temp < 1
                    continue
                end

                % Coordinates of Fellow Civilians Within the Vision of the
                % Killed Civilian:
                if map(i_temp,j_temp).type == index
                    opp_civ = [i_temp j_temp;
                        opp_civ];
                end

            end

    end
end

% Updating the Perceived Legitimacy Values:
if isempty(opp_civ) ~= 1
    for l=1:size(opp_civ,1)
        map(opp_civ(l,1),opp_civ(l,2)).L = map(opp_civ(l,1),opp_civ(l,2)).L.*(1-k_L);
    end
end

end