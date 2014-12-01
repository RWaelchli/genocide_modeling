function [map,jail,arrest] = fun_action_LEO(i,j,map,jail,J_max,default_struct,k_L)

arrest = 0;

% Spot The Active Civilians Within The Vision Of The Selected LEO:
active = fun_insp_active(map,i,j);

% Arrest A Random Active Agent Within Vision:
if isempty(active) ~= 1
    
    k = unidrnd(size(active,1));
    coord = active(k,:); % Coordinates Of The Active Civilian To Be Arrested
    i_arrest = coord(1);
    j_arrest = coord(2);
    map(i_arrest,j_arrest).sentenced = unidrnd(J_max); % Assign Random Jail Term
    type_arrested = map(i_arrest,j_arrest).type; % recording the type of the arrested civilian
    range_arrested = map(i_arrest,j_arrest).v;
    
    % Move Arrested Civilian To The Jail:
    for k=1:length(jail)
        if jail(k).type == 0
            jail(k) = map(coord(1),coord(2));
            map(coord(1),coord(2)) = default_struct; % Clear The Position On The Map
            break
        end
    end
    
    % Record The Arrest:
    arrest = 1;
end

%% Updating The Legitimacy of the Group of the Arrested Civilian

N = size(map,1);
if arrest == 1
    if type_arrested == 1
        type_update = 2;
    elseif type_arrested == 2
        type_update = 1;
    end

    opp_civ = [];

    for k=-range_arrested:range_arrested
        range_j = range_arrested - abs(k);
            for m=-range_j:range_j
                i_temp = i_arrest + k;
                j_temp = j_arrest + m;

                % Check If Indices Are Within Legal Range:
                if i_temp > N || i_temp < 1 || j_temp > N || j_temp < 1
                    continue
                end

                % Coordinates of Fellow Civilians Within the Vision of the
                % Killed Civilian:
                if map(i_temp,j_temp).type == type_update
                    opp_civ = [i_temp j_temp;
                        opp_civ];
                end

            end

    end

    % Updating the Perceived Legitimacy Values:
    if isempty(opp_civ) ~= 1
        for l=1:size(opp_civ,1)
            map(opp_civ(l,1),opp_civ(l,2)).L = map(opp_civ(l,1),opp_civ(l,2)).L+k_L.*(1-map(opp_civ(l,1),opp_civ(l,2)).L);
        end
    end
end
        
end