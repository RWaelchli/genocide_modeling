%% Function For the Action of the Civilians

% This function will perform all the actions of the agent after movement,
% if the selected agent is a civilian. First, it will determine the local
% active-to-soldier ratio. Second, it will determine the net risk and the
% grievances. Then it will compute the vector (G-N) - T. If at least one
% entry of this vector is larger than zero, the selected agent will kill a
% civilian from an other ethinc group within reach.

function [map,kill] = fun_action_civ(map,i,j,default_struct)

%% Analyze Fields Within Vision

% Initialization:
surr_soldiers = 0;
surr_actives = 1;
range = map(i,j).v;
N = size(map,1);
civilians = struct('coordinates',[]);
civilians = repmat(civilians,3,1);

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
            elseif map(i_temp,j_temp).type == 3
                civilians(3).coordinates = [civilians(3).coordinates; i_temp j_temp];
            end
            
            if map(i_temp,j_temp).type == type && map(i_temp,j_temp).state == 1
                surr_actives = surr_actives + 1;
            elseif map(i_temp,j_temp).type == 4
                surr_soldiers = surr_soldiers + 1;
            end
            
        end
end


%% Choice of the Action

ratio = surr_soldiers/surr_actives;

P = 1 - exp(-k*ratio); % estimated arrest probability
G = map(i,j).H.*(1-map(i,j).L); % grievance of the selected civilian
N = P*map(i,j).R; % net risk of the selected civilian

kill = 0;
diff = (G - N) - map(i,j).T;

% Search Index of Largest Difference:
[~,index] = max(diff);

if diff(index) > 0 && index ~= type
    if isempty(civilians(index).coordinates) ~= 1
        kill_coord = civilians(index).coordinates(unidrnd(size(civilians(index).coordinates,1)),:);
        map(kill_coord(1),kill_coord(2)) = default_struct;
        kill = 1;
    end
end

% Search Index of the Second Largest Difference:

diff_sort = sort(diff);
index = find(diff == diff_sort(2));

% Check If All Differences Are Equal:
if length(index) > 1
    index = unidrnd(3);
    while index == type
        index = unidrnd(3);
    end
end

if diff(index) > 0 && index ~= type && kill ~= 1
    if isempty(civilians(index).coordinates) ~= 1
        kill_coord = civilians(index).coordinates(unidrnd(size(civilians(index).coordinates,1)),:);
        map(kill_coord(1),kill_coord(2)) = default_struct;
        kill = 1;
    end
end

%% Update of State

if diff <= 0
    map(i,j).state = 0;
elseif kill == 1
    map(i,j).state = 1;
end

end