function H = fun_visualization_hardship(map)

%% Determination Of The Map Size

N = size(map,1);

%% Preallocation Of Used Arrays

A = zeros(N);
T = zeros(N);
H = zeros(N^2,3);

%% Copying The Information About The Hardships And The Agent Types

for i=1:N
        A(i,:) = cell2mat({map(i,:).H});
        T(i,:) = cell2mat({map(i,:).type});
end

%% Save The Hardship Values In Appropriate Form

for i=1:N
    for j=1:N
        
        if T(i,j) ~= 0 && T(i,j) ~= 3
            H(((i-1)*10+j),:) = [j N-(i-1) A(i,j)];
        end
        
    end
end

%% Deleting Rows Without Entries

rows = find(H(:,1));
H = H(rows,:);

end