clear

% 4 wheels
n = 4;

% arbitrary choice
Hmax = 3.2e-3;

% SOCi parameters
beta = deg2rad(23);
sb = sin(beta);
cb = cos(beta);
W = [ cb,  0,  -cb,  0;
      0,   cb,   0, -cb;
      sb,  sb,  sb,  sb ];

% compute vertices of n dimensional hypercube
C = repmat([-Hmax,Hmax],n,1);

% get polytope data
n_pair = 1:n;
pairs = combnk(1:n,2);
pairs = [ pairs; pairs(:,2), pairs(:,1) ];

vertices = zeros(3,4*n*(n-1));

A = zeros(12,3); % number of facets x 3
b = zeros(12,1); % number of facets x 1
w_ij = zeros(3,size(pairs,1));
g_ij = zeros(1,size(pairs,1));
inrm2 = zeros(1,size(pairs,1));

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
   
   vertices(:,4*(p-1)+1) =   Hmax .* w_hat_i ...
                           + Hmax .* w_hat_j ...
                           + Hmax .* v_ij;
   vertices(:,4*(p-1)+2) = - Hmax .* w_hat_i ...
                           + Hmax .* w_hat_j ...
                           + Hmax .* v_ij;
   vertices(:,4*(p-1)+3) =   Hmax .* w_hat_i ...
                           - Hmax .* w_hat_j ...
                           + Hmax .* v_ij;
   vertices(:,4*(p-1)+4) = - Hmax .* w_hat_i ...
                           - Hmax .* w_hat_j ...
                           + Hmax .* v_ij;
   d_ij = dot(v_ij,n_hat_ij);
   
   w_ij(:,p) = (1/d_ij) .* n_hat_ij;
   g_ij(p) = dot(n_hat_ij,cross(v_ij,w_hat_j))./norm(temp);
   inrm2(p) = 1.0/(norm(temp)^2);
   A(p,:) = n_hat_ij';
   b(p) = dot(vertices(:,4*(p-1)+1),n_hat_ij);
   
end

% compute unique vertices
vertices = unique(vertices','rows')';

% compute the largest ellipsoid inside the polytope (will fail if you dont
% have CVX setup but won't throw an error)
try
    cvx_begin sdp quiet
        variable Qh(3,3) symmetric
        maximize( det_rootn(Qh) )
        subject to
            for k = 1:numel(b)
                norm( Qh*A(k,:)',2 ) <= b(k);
            end
    cvx_end
    [X,Y,Z] = ellipsoid(0,0,0,Qh(1,1),Qh(2,2),Qh(3,3),50);
    vol_ellip  = 4/3*pi*prod(diag(Qh));
    plot_ellip = true;
catch
    plot_ellip = false;
end

% compute the largest rectangle inside the polytope
try
    Ap = max(A,0);
    Am = max(-A,0);
    cvx_begin quiet
        variable l(3,1)
        variable u(3,1)
%         maximize( sum_log(u-l) )
        maximize( log(u(1)-l(1)) + log(u(2)-l(2)) + log(u(3)-l(3)) )
        subject to
            Ap * u - Am * l <= b;
            l <= u;
%             id = 1;
%             for k = 0:3
%                 lst = combnk(1:3,k);
%                 if (~isempty(lst))
%                     for row = 1:size(lst,1)
%                         temp = l;
%                         for col = 1:size(lst,2)
%                             temp(lst(row,col)) = u(lst(row,col));
%                         end
%                         A * temp <= b;
%                     end
%                 else
%                     A * l <= b;
%                 end
%             end
    cvx_end
    vol_rect  = prod(u-l);
    plot_rect = true;
catch
    plot_rect = false;
end

% plot the envelope
figure(1), clf, hold on, grid on, box on
plot3(vertices(1,:),vertices(2,:),vertices(3,:),'r*')
if (plot_ellip)
    he = surf(X,Y,Z);
    he.LineStyle = 'none';
    he.FaceAlpha = 0.75;
    he.FaceColor = 'm';
end
if (plot_rect)
    rect_vertices = zeros(3,8);
    id = 1;
    for k = 0:3
       lst = combnk(1:3,k);
       if (~isempty(lst))
           
           for row = 1:size(lst,1)
               temp = l;
               for col = 1:size(lst,2)
                   temp(lst(row,col)) = u(lst(row,col));
               end
               rect_vertices(:,id) = temp;
               id = id + 1;
           end

       else
           rect_vertices(:,id) = l;
           id = id + 1;
       end  
    end
    id_rect_hull = convhull(rect_vertices','Simplify',true);
    h = trisurf(id_rect_hull,rect_vertices(1,:),...
        rect_vertices(2,:),rect_vertices(3,:),...
            'FaceColor','k','FaceAlpha',0.8,...
            'EdgeColor','k','LineWidth',1);
    %     rect = alphaShape(rect_vertices(1,:)',...
%                       rect_vertices(2,:)',...
%                       rect_vertices(3,:)');
%     plot(rect)
end
fprintf('Ratio of ellipsoidal volume to rectangular: %5.2f\n',vol_ellip/vol_rect);
id_hull = convhull(vertices','Simplify',true);
plot3(0,0,0,'ro','MarkerSize',6)
h = trisurf(id_hull,vertices(1,:),vertices(2,:),vertices(3,:),...
            'FaceColor','c','FaceAlpha',0.2,...
            'EdgeColor','c','LineWidth',0.5);
axis equal