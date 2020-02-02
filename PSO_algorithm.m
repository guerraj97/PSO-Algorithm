function PSO_algotithm(dim,n_swarm, c1, c2, w,n_iteration, max_run,obj_fun,wdamp)
run = 0;

pbest = zeros(n_swarm,dim);
gbest = 1000000*ones(n_swarm,dim);
f_pbest = zeros(n_swarm,dim);

% Generate Random Solution for Particle Position
X = 100*rand(n_swarm,dim);
% Generate Random Solution for Particle Position
V = 100*rand(n_swarm,dim);

% for ni=1:n_swarm
% f_pbest(ni,:)=obj_fun(X(ni,:));
% end
% [fgbest,igbest]=min(f_pbest);
% gbest=X(igbest,:)
% pbest=X;
% fpbest=f_pbest;


while run < max_run
for i = 1:n_swarm
    if (f_pbest < pbest)
    pbest = X;
    end
    fpbest(i,:) = min(obj_fun(X(i,:)));
end

%Actualizar ecuaciones
for particle = 1:n_swarm
for dim = 1:dim

%velocidad
V(particle,:) = w*V(particle,:)+ c1*rand(1,dim).*(pbest(particle,:) - X(particle,:)) ...
              + c2*rand(1,dim).*(gbest(particle,:) - X(particle,:));
%posicion
 X(particle,:) = X(particle,:) + V(particle,:);
end

end



%
%actualizar posicion

%             costo(i,:) = myfun(X(i,:));
%             % Update Personal Best
%             if costo(i) < pbest_cost(i)
%                 pbest_position(i,:) = X(i,:);
%                 pbest_cost(i) = costo(i);
%             % Update Global Best
%                 [M,I] = min(pbest_cost);
%                 gbest = pbest_position(I,:);
%         bestcost(it) = M;
%
 run = run + 1
pbest
gbest
%         w = w * wdamp;
end
f_pbest;
end
