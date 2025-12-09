clear;
parameters; % Load parameters
initial = [0, 0, 0, 0];
tspan = t_start:t_step:t_end;

% velocity_handle = @(t) velocity_profile(t,t_start,v_ref);
velocity_handle = @(t) LA92Oracle(t);

ode_handle = @(t,s) eqns(t, s, ...
   R_w, L_w, T_m, M, b_tau, R, G_R, C_R, g, K_p, K_i, velocity_handle);

[t, s] = ode45(ode_handle, tspan, initial);

%% Graphing
ext = zeros(length(t), 2);
ds = zeros(length(t), 4);

for i = 1:length(t) 
    [ds(i,:), ext(i,:)] = eqns(t(i), s(i,:),R_w, L_w, T_m, M, b_tau, R, G_R, C_R, g, K_p, K_i, velocity_handle);
end

P_in = ext(:, 1);
P_out = ext(:, 2);

P_in_acc = P_in(P_out>0);
P_out_acc = P_out(P_out>0);

disp(mean(P_in_acc))
disp(mean(P_out_acc))

disp(mean(P_out_acc)/mean(P_in_acc))

% display_output;