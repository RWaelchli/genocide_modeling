function map = fun_clone(map,P)

N = size(map,1);

% Randomly Order the x- and y-Coordinates:
x = randperm(N);
y = randperm(N);

for i=1:N
    for j=1:N
        free = [];
        
        % Checking for free locations right next to the selected agent:
        for k = -1:1
            for m = -1:1
                
                if x(i)+k > N || x(i)+k < 1 || y(j)+m > N || y(j)+m < 1
                continue
                end
                
                if map(x(i)+k,y(j)+m).type == 0
                    free = [free;x(i)+k y(j)+m];
                end
            end
        end
        
        % Possible cloning, if there are free locations:
        if isempty(free) == 0
            
            % Choose Random Free Location:
            k = unidrnd(size(free,1));
            i_clone = free(k,1);
            j_clone = free(k,2);

            % Performing the Cloning With Probability P:
            boundary = norminv(P,0,1);
            p = normrnd(0,1);
            if p <= boundary && map(i,j).type ~= 3
                map(i_clone,j_clone) = map(i,j);
                map(i_clone,j_clone).age = 0;
            end

        end
    end
end

end