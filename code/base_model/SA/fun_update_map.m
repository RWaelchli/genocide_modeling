%% Update Map Function

% This function increases the age of all civilians on the map by one and
% removes the civilians that have reached their life expectancy.

function map = fun_update_map(map,default_struct)

for i=1:size(map,1)
    for j=1:size(map,2)
        if map(i,j).type ~= 0 && map(i,j).type ~= 3
            map(i,j).age = map(i,j).age + 1;
            if map(i,j).age >= map(i,j).life_exp
                map(i,j) = default_struct;
            end
        end
    end
end

end