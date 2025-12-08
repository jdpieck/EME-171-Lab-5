clear;
parameters; % Load parameters
initial = initialize();
tspan = 0:t_step:t_end;

velocity_handle = @(t) velocity_profile(t, t_start, u_in);

ode_handle = @(t,s) eqns(t, s, ...
   R_w, L_w, T_m, M, b_tau, R, G_R, C_R, g, velocity_handle);

[t, s] = ode45(ode_handle, tspan, initial);

%% Graphing
% ext = zeros(length(t), 3);
% ds = zeros(length(t), 4);

% for i = 1:length(t) 
%     [ds(i,:), ext(i,:)] = eqns(t(i), s(i,:),rho,g,L,A_t,A_p,d_0,d_1,d_2,C_f,turbine_handle,C_t,I_p);
% end

display_output;