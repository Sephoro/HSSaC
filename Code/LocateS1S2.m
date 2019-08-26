function [heartsounds] = LocateS1S2(s1,positions)

heartsounds = zeros(length(positions), 2);
heartsounds(:,2) = positions(:,1);

s1pos = find(heartsounds(:,2) == s1);

%represent even with 0
%represent odd  with 1

c1 = mod(s1pos, 2);

i = 1:floor(length(positions)/2);

if(c1 == 0) %S1 is on the even indices of the vector,S2 odd indices
    c2 = 1;
    heartsounds(:,1) = 2;
    heartsounds(2*i,1) = 1;
   
else  %S1 is on the odd indices of the vector,S2 even indices
    c1 = 1;
    heartsounds(:,1) = 1;
    heartsounds(2*i,1) = 2;
end

end