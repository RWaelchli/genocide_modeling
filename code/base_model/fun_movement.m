function [map,i,j] = fun_movement(map,i,j,default_struct,N)

free = fun_insp_free(map,i,j,N);

% If there are empty fields within vision, move the agent to a random empty
% location. If there are no empty fields, the agent remains at the same
% place.

if isempty(free) == 0
    k = unidrnd(size(free,1));

    i_new = free(k,1);
    j_new = free(k,2);

    % Copy Agent to New Position:
    map(i_new,j_new) = map(i,j);

    % Delete Original Agent:
    map(i,j) = default_struct;

    % Write the New Coordinates:
    i = i_new;
    j = j_new;
end

end