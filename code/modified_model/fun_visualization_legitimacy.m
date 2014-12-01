function [L1,L2] = fun_visualization_legitimacy(map)

N = size(map,1);

L1 = 0;
L2 = 0;
n1 = 0;
n2 = 0;

for i=1:N
    for j=1:N
        
        if map(i,j).type ~= 0 && map(i,j).type ~= 3
            if map(i,j).type == 1
                L1 = L1 + map(i,j).L;
                n1 = n1 + 1;
            elseif map(i,j).type == 2
                L2 = L2 + map(i,j).L;
                n2 = n2 + 1;
            end
        end
        
    end
end

L1 = L1/n1;
L2 = L2/n2;