function [swarm_p,gbest] = PSO_algotithm(n_varsize,n_swarm,obj_fun,min,max)
run = 0;

%inicializacion de parametros.
part.pos = []; %posicion
part.velocity = []; %velocidad
part.costo = []; %costo de la funcion

%mejor posicion y mejor costo personal.
part.b.Pos = [];
part.b.Costo = [];
%genero cada particula del swarm.
swarm_p = repmat(part, n_swarm, 1);

%global best al inicio
gbest.Costo = inf; %al ser un problema de minimazion se toma el infinito.


for i = 1:n_swarm
    swarm_p(i).pos = unifrnd(min,max,n_varsize); %definiendo la posicion de cada particula.

    %inicializando la velocidad
    swarm_p(i).velocity = zeros(n_varsize);

    %evaluando la primera iteracion
    swarm_p(i).costo = obj_fun(swarm_p(i).pos);

    %Buscando una funcion de costo inicial e inicializando la mejor
    %posicion
    swarm_p(i).b.Pos = swarm_p(i).pos;
    swarm_p(i).b.Costo = swarm_p(i).costo;

    swarm_p(i).b.Costo
    gbest.Costo
    if swarm_p(i).b.Costo < gbest.Costo
        %gbest.Cost = swarm_p(i).b.Costo;
        gbest = swarm_p(i).b;
        i
    end
end
end
