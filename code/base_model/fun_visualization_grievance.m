function G = fun_visualization_grievance(map)

%% Determination Of The Map Size

N = size(map,1);

%% Preallocation Of Used Arrays

H = zeros(N);
L = zeros(N);
T = zeros(N);
A = zeros(N);
G = zeros(N^2,3);

%% Copying The Information About The Hardships, The Agent Types And The Legitimacies

for i=1:N
        H(i,:) = cell2mat({map(i,:).H});
        T(i,:) = cell2mat({map(i,:).type});
end

for i=1:N
    for j=1:N
        if T(i,j) == 1
            L(i,j) = cell2mat({map(i,j).L});
        elseif T(i,j) == 2
            L(i,j) = cell2mat({map(i,j).L});
        end
    end
end

A = H.*(1-L);

%% Save The Grievances Values In Appropriate Form

for i=1:N
    for j=1:N
        if A(i,j) ~= 0
            G(((i-1)*N+j),:) = [j N-(i-1) A(i,j)];
        end
    end
end

%% Deleting Rows Without Entries

rows = find(G(:,1));
G = G(rows,:);

end