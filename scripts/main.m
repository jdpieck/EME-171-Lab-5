clear;
parameters; % Load parameters
initial = initialize();
tspan = 0:t_step:t_end;

ODE_Function = @(t,s) eqns(t, s, ...
    rho, g, L, A_t, A_p, d_0, d_1, d_2, C_f, turbine_handle, C_t, I_p);

[t, s] = ode45(ODE_Function, tspan, initial);

%% Graphing
ext = zeros(length(t), 3);
ds = zeros(length(t), 4);

for i = 1:length(t) 
    [ds(i,:), ext(i,:)] = eqns(t(i), s(i,:),rho,g,L,A_t,A_p,d_0,d_1,d_2,C_f,turbine_handle,C_t,I_p);
end

display_output;