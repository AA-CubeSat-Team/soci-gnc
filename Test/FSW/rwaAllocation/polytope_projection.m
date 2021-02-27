clear
init_params;

% momentum distribution matrix      
W = fswParams.allocator.A_wheel2body;
T_max = fswParams.allocator.max_torque_Nm;
n = 4;

% generate points from 4D hypercube
TI4 = T_max * eye(n);
U   = zeros(n,2^n);
id  = 1;
for k = 0:n
    pairs = combnk(1:n,k);
    for p = 1:size(pairs,1)
        U(:,id) = TI4(:,pairs(p,:)) * ones(numel(pairs(p,:)),1);
        id = id + 1;
    end
end

P = (W * U)';
% P = cleanup(P);
P = unique( P, 'rows');
P(:,3) = P(:,3) - 2*sind(23)*T_max;

figure(2), clf, hold on, grid on, box on
K = convhull(P(:,1),P(:,2),P(:,3),'simplify',true);
trisurf(K,P(:,1),P(:,2),P(:,3),'FaceColor','cyan','FaceAlpha',0.25,'EdgeColor','b')
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
   
end

[A,B,~,~]=vert2lcon(P);
A = cleanup(A);
B = cleanup(B);

% Generate/project some random vectors for verification
allocator = fswParams.allocator;
for k = 1:10
    v = 1.25*T_max * randn(3,1);
    quiver3(0,0,0,v(1),v(2),v(3),'r','LineWidth',2)
        
    val = 0.0;
    w_facet = allocator.w_facet;
    for ff = 1:allocator.num_facet
        w_ff = w_facet(:,ff);
        vh = v;
       temp = abs( dot(w_ff,vh) );
       if (temp > val)
           val = temp;
           idd = ff;
           sgn = sign(dot(w_ff,vh));
       end
    end
    a = sgn * w_facet(:,idd)./norm(w_facet(:,idd));
    switch idd
        case {2,5}
            b = B(1);
        case {1,3,4,6}
            b = B(3);
    end 

    c = dot(a,v);
    if ( (-abs(b) > c) || (c > abs(b)) )
        x = (b/c).*v;
    else
        x = v;
    end

    quiver3(0,0,0,x(1),x(2),x(3),'b','LineWidth',2)
    try
        assert(all(A*x-B<=sqrt(eps)))
    catch me
%         ang_btwn
        throw(me)
    end
end

function M = cleanup(M)
    [n,m] = size(M);
    for row = 1:n
        for col = 1:m
            if (abs(M(row,col)) < 1e-12)
                M(row,col) = 0.0;
            end
        end
    end
end