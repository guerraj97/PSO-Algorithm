function PSO_algotith(dim,n_swarm, c1, c2, w,n_iteration, max_run,obj_fun,wdamp)
run = 0;

pbest = zeros(n_swarm,dim);
gbest = 1000000*ones(n_swarm,dim);
f_pbest = zeros(n_swarm,dim);

% Generate Random Solution for Particle Position
X = 100*rand(n_swarm,dim);
% Generate Random Solution for Particle Position
V = 100*rand(n_swarm,dim);

pbest = X;

for i = 1:n_swarm
    fpbest(i,:) = obj_fun(X(i,:));
end


% % Update Velocity
% V (swarm_particle,:) = w*V(swarm_particle,:) ...
% + c1*rand(1,dim).*(pbest_position(swarm_particle,:) - X(swarm_particle,:)) ...
%               + c2*rand(1,dim).*(gbest - X(swarm_particle,:));
%
% %actualizar posicion
% X(swarm_particle,:) = X(swarm_particle,:) + V(swarm_particle,:);
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
% run = run + 1;
%         w = w * wdamp;

end
