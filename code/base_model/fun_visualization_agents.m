function [C1_active,C1_quiet,C2_active,C2_quiet,Cops] = fun_visualization_agents(map)

%% Determination Of The Map Size

N = size(map,1);

%% Preallocation Of Used Arrays

A = zeros(N);
B = zeros(N);

C1_active = zeros(N^2,3);
C1_quiet = zeros(N^2,3);
C2_active = zeros(N^2,3);
C2_quiet = zeros(N^2,3);
Cops = zeros(N^2,3);

%% Copying The Information About The Types

for i=1:N
        A(i,:) = cell2mat({map(i,:).type});
        B(i,:) = cell2mat({map(i,:).state});
end

%% Divide The Entries Into The Single Cathegories

for i=1:N
    for j=1:N
        
        if A(i,j) == 1 && B(i,j) == 0
            C1_quiet(((i-1)*N+j),:) = [j N-(i-1) 1];
        elseif A(i,j) == 1 && B(i,j) == 1
            C1_active(((i-1)*N+j),:) = [j N-(i-1) 1];
        elseif A(i,j) == 2 && B(i,j) == 0
            C2_quiet(((i-1)*N+j),:) = [j N-(i-1) 1];
        elseif A(i,j) == 2 && B(i,j) == 1
            C2_active(((i-1)*N+j),:) = [j N-(i-1) 1];
        elseif A(i,j) == 3
            Cops(((i-1)*N+j),:) = [j N-(i-1) 1];
        end
        
    end
end

%% Deleting Rows Without Entries

rows = find(C1_quiet(:,1));
C1_quiet = C1_quiet(rows,:);

rows = find(C1_active(:,1));
C1_active = C1_active(rows,:);

rows = find(C2_quiet(:,1));
C2_quiet = C2_quiet(rows,:);

rows = find(C2_active(:,1));
C2_active = C2_active(rows,:);

rows = find(Cops(:,1));
Cops = Cops(rows,:);

end