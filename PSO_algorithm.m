function PSO_algotith(dim,n_swarm, c1, c2, W,n_iteration, obj_fun, max_run)
clear;
clc;
close all;
V = zero(1,dim);

for i = 1:n_swarm
    for dimension = 1:dim
        %inicializa al grupo
        %inicializa la velocidad
    end
end

for iteration = 1:n_iteration
    for swarm_particule = 1:n_swarm
        %calcular fitness
        if %pbest_actual es mejor al pasado
            %pbest = pbest_actual
        end
    end


%ahora tomando el mejor valor global
for pswarm = 1:n_swarm
    for dim2 = 1:dim
        %calcular velocidad como
        %V(iteration+1) = W*V(iteration) + c1 rand(P - X) + c2 rand(Pg - X)

        %actualizar posicion
        %X(iteration+1) = X(iteration) + V(iteration+1)
    end
end
end
