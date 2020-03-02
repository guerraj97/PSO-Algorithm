%% PSO_algorithm
% Jose Pablo Guerra
% Funcion que implementa el algoritmo PSO
% [swarm_p,gbest] = PSO_algorithm(n_varsize,n_swarm,obj_fun,min,max)
% in:
% n_varsize = numero de variables para la n-dimension
% n_swarm = numero de agentes
% obj_fun = funcion objetivos
% Lb = minimo de las variables
% Ub = maximo de las variables
% maxIteration =
% w
% c1
% c2
% damp

% out:
% swarm_p = estructura que almacena las particulas con sus respectivas
% posiciones, velocidades y funciones de costo.
% gbest = (por ahora, para debub) retorna el mejor costo global.
% Status_by_cost =
% initParticle =

%%
function [swarm_p,gbest,Status_by_cost,initParticle,iteration_over] = PSO_algorithm(n_varsize,...
                                                n_swarm,max_convergence,Lb,Ub,w,c1,c2,damp)
%run = 0;

%inicializacion de parametros.
%utiliza estructuras
part.pos = []; %posicion
part.velocity = []; %velocidad
part.costo = []; %costo de la funcion
initParticle = [];
%mejor posicion y mejor costo personal.
part.b.Pos = [];
part.b.Costo = [];

iteration_over = zeros(100,2);

CostoParticulas = zeros(200,1);
option = 5;
N = 1; %control de iteraciones para estadistica
%% aqui cambio de codigo para poder probar variacion de parametros.

%for iteration_Var = 1:100

count_iteration = 1;

%genero cada particula del swarm.
swarm_p = repmat(part, n_swarm, 1);
initParticle = repmat(part, n_swarm, 1);
%vector para el ploteo
plot_swarm = zeros(n_swarm,2);

%global best al inicio
gbest.Costo = inf; %al ser un problema de minimazion se toma el infinito.
for i = 1:n_swarm
    swarm_p(i).pos = unifrnd(Lb,Ub,n_varsize); %definiendo la posicion de cada particula.
    initParticle(i).pos = swarm_p(i).pos;
    %inicializando la velocidad
    swarm_p(i).velocity = zeros(n_varsize);

    %evaluando la primera iteracion
    swarm_p(i).costo = obj_fun(swarm_p(i).pos,option);

    %Buscando una funcion de costo inicial e inicializando la mejor
    %posicion
    swarm_p(i).b.Pos = swarm_p(i).pos;
    swarm_p(i).b.Costo = swarm_p(i).costo;
    if swarm_p(i).b.Costo < gbest.Costo
        gbest = swarm_p(i).b;
    end
end

%Status_by_cost = zeros(200,1);

figure(3);
clf;
for iteration = 1:200
    plot(plot_swarm(:,1),plot_swarm(:,2),'ro');
    axis([Lb Ub Lb Ub]);
    title('Movimiento de las partículas');
    grid on;
    pause(0.1);

    for pop = 1:n_swarm

        %velocidad
        swarm_p(pop).velocity = w*swarm_p(pop).velocity ...
            + c1 * rand(n_varsize).*(swarm_p(pop).b.Pos - swarm_p(pop).pos)...
            + c2 * rand(n_varsize).*(gbest.Pos - swarm_p(pop).pos);

        %posicion
         swarm_p(pop).pos = swarm_p(pop).pos + swarm_p(pop).velocity;

         %evaluando la funcion de costo
         swarm_p(pop).costo = obj_fun(swarm_p(pop).pos,option);

         if swarm_p(pop).costo < swarm_p(pop).b.Costo
             swarm_p(pop).b.Pos = swarm_p(pop).pos;
             swarm_p(pop).b.Costo = swarm_p(pop).costo;

                 if swarm_p(i).b.Costo < gbest.Costo
                    gbest = swarm_p(i).b;
                 end
         end
         plot_swarm(pop,1) = swarm_p(pop).pos(1);
         plot_swarm(pop,2) = swarm_p(pop).pos(2);
         CostoParticulas(pop) = swarm_p(pop).costo;
    end
    %CostoParticulas = gbest.Costo;

    Status_by_cost(iteration) = gbest.Costo;
    %M = min(Status_by_cost);
    %w = w*damp;

        if Status_by_cost(iteration) < max_convergence
        if sum(CostoParticulas(:)) < (max_convergence * n_swarm)
            iteration_over(N,1) = iteration;
            iteration_over(N,2) = Status_by_cost(iteration);
            N = N + 1;
            break;
        end
        elseif iteration == 1
            %no hago nada
        elseif Status_by_cost(iteration) ~= Status_by_cost(iteration - 1)
              count_iteration = 1;
        elseif Status_by_cost(iteration) == Status_by_cost(iteration - 1)
              count_iteration = count_iteration + 1;

            if count_iteration > 10
            %count_iteration = 1;
            iteration_over(N,1) = iteration;
            iteration_over(N,2) = Status_by_cost(iteration);
            %N = N + 1;
            break;
            end
        end

        disp(['iteration ' num2str(iteration) ' BesCosto = ' num2str(Status_by_cost(iteration))])

end
 %w =w*damp;
 %disp(['iteration ' num2str(iteration_Var)])

end
