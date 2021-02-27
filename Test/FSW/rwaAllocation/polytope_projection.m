% clear

% momentum distribution matrix
beta = deg2rad(26);
sb = sin(beta);
cb = cos(beta);

W = [  cb,   0, -cb,  0;
        0,  cb,   0, -cb;
       sb,  sb,  sb,  sb ];
       
n = 4;
H_max = 3.2;

% generate points from 4D hypercube
HI4 = H_max * eye(n);
U   = zeros(n,2^n);
id  = 1;
for k = 0:n
    pairs = combnk(1:n,k);
    for p = 1:size(pairs,1)
        U(:,id) = HI4(:,pairs(p,:)) * ones(numel(pairs(p,:)),1);
        id = id + 1;
    end
end

P = (W * U)';
P = unique( P, 'rows');
P(:,3) = P(:,3) - 2*sb*H_max;

figure(2), clf, hold on, grid on, box on
K = convhull(P(:,1),P(:,2),P(:,3),'simplify',true);
trisurf(K,P(:,1),P(:,2),P(:,3),'FaceColor','cyan','FaceAlpha',0.75,'EdgeColor','b')
plot3(P(:,1),P(:,2),P(:,3),'b*','MarkerSize',5,'MarkerFaceColor','b')
xlabel('$x_{\mathcal{B}}$ [mNm]','FontSize',16,'Interpreter','latex'), 
ylabel('$y_{\mathcal{B}}$ [mNm]','FontSize',16,'Interpreter','latex'), 
zlabel('$z_{\mathcal{B}}$ [mNm]','FontSize',16,'Interpreter','latex'), 

n_pair = 1:n;
pairs = combnk(1:n,2);

for p = 1:size(pairs,1)
   ii = pairs(p,1);
   jj = pairs(p,2);
   
   w_hat_i = W(:,ii);
   w_hat_j = W(:,jj);
   
   temp = cross(w_hat_i,w_hat_j);
   n_hat_ij = temp./norm(temp);
   
   id_saturated = n_pair;
   id_saturated(pairs(p,:)) = [];
   
   v_ij = zeros(3,1);
   for k = id_saturated
       v_ij = v_ij + sign(dot(W(:,k),n_hat_ij)) .* W(:,k);
   end
   
   d_ij = dot(v_ij,n_hat_ij);
   
   A_(p,:) = (1/d_ij) * n_hat_ij';
   b_(p)   = H_max * max(abs(n_hat_ij));
   
end

% Generate/project some random vectors for verification
for k = 1:10
    v = 1.25*H_max * randn(3,1);
    quiver3(0,0,0,v(1),v(2),v(3),'r','LineWidth',1)

    
    temp = A_*v;
    [~,id] = max(abs(temp));

    a = A_(id,:)./norm(A_(id,:));
    b = sign(temp(id)) * H_max * max(abs(a));
    c = dot(a,v);
    if ( (-abs(b) > c) || (c > abs(b)) )
        x = (b/c).*v;
    else
        x = v;
    end
    quiver3(0,0,0,x(1),x(2),x(3),'b','LineWidth',1)
end