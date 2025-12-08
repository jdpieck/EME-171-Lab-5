% --- Electrical Parameters ---
R_w = 0.3;          % Armature Winding Resistance (Omega)
L_w = 0.015;        % Armature Winding Inductance (Henry)
T_m = 1.718;        % Transduction Coefficient (Weber)

% --- Mechanical/Vehicle Parameters ---
M = 2200;           % Vehicle Mass (kg)
b_tau = 0.05;       % Drive Shaft Friction (Nms/rad)
R = 0.2;            % Wheel Radius (m)
G_R = 5;            % Gear Ratio (Unitless, assuming G_R = N_pinion / N_gear = 5/1 = 5)

% --- Resistance and Environmental Parameters ---
C_R = 0.006;        % Rolling Resistance Coefficient (Unitless)
g = 9.81;           % Acceleration due to gravity (m/s^2)
C_D = 0.32;         % Drag Coefficient (Unitless)
rho = 1.21;         % Air Density (kg/m^3)
A_f = 2.05;         % Vehicle Frontal Area (m^2)

% --- Simulation Control ---
t_start = 0.25; % sec after the sim starts
t_end = t_start + 2; % sec
t_step = 0.01; % sec
u_in = 100; % V
v_ref = 1; % m/s

% --- PI Control ---
K_p = 200;
K_i = 0;



disp('Parameters initialized successfully.');
