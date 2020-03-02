%% Jose Pablo Guerra - Implementacion del Algoritmo PSO.
%  Utiliza la funcion PSO_algotith.
%% Funcion a utilizar y definicion de parametros.

%obj_fun = @(x) sum(x.^2); %definicion de la funcion objetivo que se quiere optimizar
Vars = 2; %numero de variables o numero de incognitas.
varSolution = [1 Vars]; %Matriz de soluciones.
%min_function = min(obj_fun);
Lb = -10;
Ub = 10;

nIteration = 200; %maxima numero de iteraciones

n_swarm = 100;%numero de agentes, poblacion
w = 0.5; %coeficiente de inercia
wdamp = 0.99;
c1 = 0.5; %coeficiente de aceleracion (personal)
c2 = 0.5; %coeficiente de aceleracion (grupal)
init_particle = zeros(n_swarm,2);
max_convergence = 0.1;
n = 1;
clf;
[a,gbest,status,particle,iteration_over] = PSO_algorithm(varSolution,n_swarm,...
                                                max_convergence,Lb,Ub,w,c1,c2,wdamp);

for pop = 1:n_swarm
          init_particle(pop,1) = particle(pop).pos(1);
          init_particle(pop,2) = particle(pop).pos(2);
end

    figure(1);
    title('Posición inicial de las partículas');
    plot(init_particle(:,1),init_particle(:,2),'ro');
    drawnow;

    figure(2);
    plot(status);
    title('Costo global por iteración');
    grid on;
    grid minor;
    drawnow;
