function [map,jail,arrest] = fun_action_LEO(i,j,map,jail,J_max,default_struct)

arrest = 0;

% Spot The Active Civilians Within The Vision Of The Selected LEO:
active = fun_insp_active(map,i,j);

% Arrest A Random Active Agent Within Vision:
if isempty(active) ~= 1
    k = unidrnd(size(active,1));

    coord = active(k,:); % Coordinates Of The Active Civilian To Be Arrested

    map(coord(1),coord(2)).sentenced = unidrnd(J_max); % Assign Random Jail Term
    
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
        
end