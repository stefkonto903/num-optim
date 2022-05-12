%Question 1
x = [1 2; 1 2];

%gradient descent method
for k = 1:100
    
    grad_f = [2*x(k,1)+4*(x(k,1)-x(k,2)).^3; 2*x(k,2)-2-4*(x(k,1)-x(k,2)).^3];
    x(k+1,:) = x(k,:) - 0.1*grad_f';

end
%figure; plot(x(:,1),x(:,2),'-o')

x_n = [1 2; 1 2];
%newton's method
for n = 1:100
    
    hessian2D = [2+12*(x_n(n,1)-x_n(n,2)).^2 -12*(x_n(n,1)-x_n(n,2)).^2; -12*(x_n(n,1)-x_n(n,2)).^2 2+12*(x_n(n,1)-x_n(n,2)).^2];
    grad_f1 = [2*x_n(n,1)+4*(x_n(n,1)-x_n(n,2)).^3; 2*x_n(n,2)-2-4*(x_n(n,1)-x_n(n,2)).^3];
    
    x_n(n+1,:) = x_n(n,:)' - inv(hessian2D)*grad_f1;
    
end
%figure; plot(x_n(:,1),x_n(:,2),'-o')

%Question 2
x_3 = [1 2; 1 2];
hessians2Dd = zeros(size(x_3));
condition_n_K = [0];

for A = 1:10
    for i = 1:100
        hessian2Dd = [2*A 0; 0 2/A];
        hessians2Dd = cat(1,hessians2Dd,hessian2Dd);
        condition_n_K(A) = (max(eig(hessian2Dd))/min(eig(hessian2Dd)))';
    end
    
end

%gradient descent method
for j = 1:100
    
    grad_f2 = [2*2*x_3(j,1); 2*x_3(j,2)/2];
    x_3(j+1,:) = x_3(j,:)' - 0.2*grad_f2; 
    
end
%figure; plot(x_3(:,1),x_3(:,2),'-o')

%Question 3
for l = 1:20
    
    A_m = randn(l,l);
    Q_s = A_m.*A_m';
    K_cond(l) = max(eig(Q_s))/min(eig(Q_s));
    
    
end

%Question 4
x_th4 = [1 2; 1 2];

%gradient descent method
for p = 1:100
    
    [f_max, ind] = max_function_4(x_th4(p,1),x_th4(p,2));
    
    if ind == 1
        gradf_th4 = [1; 1];
    elseif ind == 2
        gradf_th4 = [0.9; -1.1];
    elseif ind == 3
        gradf_th4 = [-0.8; 1.2];
    elseif ind == 4
        gradf_th4 = [-1.1; -0.9];
    end
    x_th4(p+1,:) = x_th4(p,:) - 10*gradf_th4';

end

%figure; plot(x_th4(:,1),x_th4(:,2),'-o')

%Question 5
x_th5 = [3 2; 2 1];
a = rand(4,1);
b = rand(4,1);

for i = 1:100
    for ii = 1:4
    
    gradf_th5 = 0.5*[x_th5(i,1)-a(ii); x_th5(i,2)-b(ii)];    
    x_th5(j+1,:) = x_th5(i,:)' - 0.2*gradf_th5;
    end
end

%figure; plot(x_th5(:,1),x_th5(:,2),'-o')