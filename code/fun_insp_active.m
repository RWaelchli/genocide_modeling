%% Surrounding Fields Inspection Function

% This function inspects the surrounding fields for active agents. It
% returns their coordinates in the matrix called "active".

function active = fun_insp_active(map,i,j)

N = size(map,1);

active = [];
range = map(i,j).v;

% Inspecting All Fields Within the Vision:
for k=-range:range
    range_j = range - abs(k);
        for m=-range_j:range_j
            i_temp = i+k;
            j_temp = j+m;
            
            % Check If Indices Are Within the Legal Range:
            if i_temp > N || i_temp < 1 || j_temp > N || j_temp < 1
                continue
            end
            
            % Check if there is an active agent on the inspected field:
            if map(i_temp,j_temp).type ~= 0 && map(i_temp,j_temp).type ~= 4 && map(i_temp,j_temp).state == 1
                active = [active;i_temp j_temp];
            end
        end
end

end