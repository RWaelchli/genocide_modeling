%% Jail Update Function

% This function updates the jail array of structures. First it updates the
% age of the inmates and removes those who have reached their life
% expectancy. Then it releases the civilians that have served their time
% onto a random free position on the map.

function [jail,map] = fun_update_jail(jail,map,default_struct)

N = size(map,1);

for n=1:length(jail)
    if jail(n).type ~= 0
        
        % Update The Served Time:
        jail(n).served = jail(n).served + 1;
        
        % Update The Age:
        jail(n).age = jail(n).age + 1;
        
        % Remove Civilians That Have Reached Their Life Expectancy
        if jail(n).age >= jail(n).life_exp
            jail(n) = default_struct;
        end
        
        % Release Of Civilians That Have Served Their Time
        if jail(n).served >= jail(n).sentenced
            % Choose Random Position On the Map:
            i = unidrnd(N);
            j = unidrnd(N);

            % Repeat Selection If An Agent Is at That Position:
            while map(i,j).type ~= 0
                i = unidrnd(N);
                j = unidrnd(N);
            end

            % Release Civilian Onto The Selected Position:
            map(i,j) = jail(n);
            map(i,j).sentenced = 0;
            map(i,j).served = 0;
            map(i,j).state = 0;
            jail(n) = default_struct; % Clear The Position In The Jail
        end
    end
end



end