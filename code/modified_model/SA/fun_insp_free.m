%% Surrounding Fields Inspection Function

% This function inspects the fields within vision for empty positions and
% returns the coordinates of the empty positions as matrix called "free".

function free = fun_insp_free(map,i,j,N)

free = [];
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
            
            % Check if there is an agent on the inspected field:
            if map(i_temp,j_temp).type == 0
                free = [free;i_temp j_temp];
            end
        end
end
end