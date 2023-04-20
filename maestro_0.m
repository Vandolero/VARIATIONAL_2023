function maestro_0();

%--------------------------------------------------
%----- Generación de datos ---------------
datos=generadatos_1();
%---------------------------------------------------

%------ Se hace el GA---------------------------
% Ajuste del GA
gene=10;
TolFun_Data=1e-3;
%options = optimoptions("ga",'MaxGenerations',gene,'MaxStallGenerations',gene,'PopulationSize',100,...
%    'TolFun', TolFun_Data,'SelectionFcn', @selectionroulette,...
%    'MutationFcn',@mutationadaptfeasible);

options = optimoptions("ga",'MaxGenerations',gene,'MaxStallGenerations',gene,'PopulationSize',50,...
    'TolFun', TolFun_Data,'HybridFcn',{@fmincon});


%options = optimoptions('ga','PlotFcn', @gaplotbestf,'MaxGenerations',gene,'MaxStallGenerations',gene);

%Valores de los paramétros.
bajo=[.5,.5]; arriba=[10,10];
numerodeparametros=length(bajo);
% Se define la función con pase de datos.
fun =@(x) var_acc_nlse2(x,datos);

% Definción del GA
var_optimos=ga(fun,numerodeparametros,[],[],[],[],...
    [bajo],[arriba],[],options);

%options=optimoptions("patternsearch",'MaxIterations',1000);
%var_optimos= patternsearch(fun,[1,sqrt(2/3)],[],[],[],[]...
%,[bajo],[arriba],options);

% Desplegamos resultados
display(var_optimos)
%---------------------------------------------



options=optimoptions("patternsearch",'MaxIterations',100);
var_optimos= patternsearch(fun,[var_optimos],[],[],[],[]...
,[var_optimos*.75],[var_optimos*1.25],options);

display(var_optimos)


end