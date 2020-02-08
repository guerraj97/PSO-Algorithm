%%
%Jose Pablo Guerra - Implementacion del Algoritmo PSO.
%Utiliza la funcion PSO_algotith.
%% Funcion a utilizar y deficion de parametros.

obj_fun = @(x) sum(x.^2); %definicion de la funcion objetivo que se quiere optimizar
Vars = 3; %numero de variables o numero de incognitas.
varSolution = [1 Vars]; %Matriz de soluciones.

Lb = -10;
Ub = 10;

nIteration = 30; %maxima numero de iteraciones

n_swarm = 4;%numero de agentes, poblacion

w = 1; %coeficiente de inercia

c1 = 2; %coeficiente de aceleracion (personal)
c2 = 2; %coeficiente de aceleracion (grupal)


[a,gbest] = PSO_algotithm(varSolution,n_swarm,obj_fun,Lb,Ub);
