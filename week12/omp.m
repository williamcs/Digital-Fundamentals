%In this exercise A=D+I, where Dij=sin(i+j) for 1=i,j=10 and I is the 10×10 identity matrix. Use A along with %b=[-2,-6,-9,1,8,10,1,-9,-4,-3]', and S=3 to find the solution to the problem given above.

D = zeros(10, 10);
for i = 1: 10
	for j = 1: 10
		D(i, j) = sin(i+j);
	end
end

I = eye(10);

A = D + I;
A_norm = normc(A);

b = [-2,-6,-9,1,8,10,1,-9,-4,-3]';
S = 3;

x = zeros(size(A_norm, 2), 1); 

omg = []; %  indexes of components of s
r = b;  % first residual
A_omg =[];  % Matrix of the columns used to represent b

for iter = 1 : S
	[i, j] = max(abs(A_norm' * r));
	omg = [omg, j];
	A_omg = A_norm(:, omg);
	x_omg_star = pinv(A_omg' * A_omg) * A_omg' * b;
	r = b - A_omg * x_omg_star;
	
	x(omg) = x_omg_star;
end



b = [-2,-6,-9,1,8,10,1,-9,-4,-3]';
S = 3;
for i = 1:10
for j = 1:10
A(i,j) = sin(i+j);
if (i==j)
A(i,j) = A(i,j) +1;
end
end
end
for i = 1: 10
Anorm(:,i) = A(:,i)/norm(A(:,i));
end
A = Anorm;
x = zeros(10,1);
r = b;
omg = [];
A_omg = [];
while nnz(x)<3
	maxnorm = 0;
	for j=1:10
		if(any(j==omg))
		else
			x_j = norm(transpose(A(:,j)) * r);
		if(maxnorm = x_j;
			i = j;
		end
	end
end

omg = [omg, i];
A_omg = [A_omg, A(:,i)];
z_omega_star = pinv(A_omg' * A_omg) * A_omg' * b;
r = b - A_omg * z_omega_star;


x = zeros(10,1);
for j=1:length(omg)
index = omg(1,j);
x(index,1) = z_omega_star(j,1);
end
end






