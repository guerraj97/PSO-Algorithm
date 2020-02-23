%% Jose Pablo Guerra - Implementacion del Algoritmo PSO.
%  Utiliza la funcion PSO_algotith.
%% Funcion a utilizar y definicion de parametros.

%paraboloide 0
%Shubert -186.7309
%Bohachevsky 0
%Goldstein 3
%Powell 0
%eggholder -959.6407

%obj_fun = @(x) sin(10*pi.*x) / (2.*x) + (x-1).^4; %definicion de la funcion objetivo que se quiere optimizar
Vars = 2; %numero de variables o numero de incognitas.
varSolution = [1 Vars]; %Matriz de soluciones.
%min_function = min(obj_fun);
Lb = -10;
Ub = 10;

BigLoop = 100; %maxima numero de iteraciones

n_swarm = 100;%numero de agentes, poblacion
w = 1; %coeficiente de inercia
wdamp = 0.99;
c1 = 2; %coeficiente de aceleracion (personal)
c2 = 2; %coeficiente de aceleracion (grupal)
init_particle = zeros(n_swarm,2);
n = 1;
clf;
[a,gbest,status,particle,iteration_over] = PSO_algorithm(varSolution,n_swarm,Lb,Ub,BigLoop,w,c1,c2,wdamp);

for pop = 1:n_swarm
          init_particle(pop,1) = particle(pop).pos(1);
          init_particle(pop,2) = particle(pop).pos(2);
end

    figure(1);
    plot(init_particle(:,1),init_particle(:,2),'ro');
    drawnow;

    figure(2);
    plot(status);
    grid on;
    grid minor;
    drawnow;
