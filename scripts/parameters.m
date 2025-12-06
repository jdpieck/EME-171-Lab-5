%% --- Physical Parameters Initialization ---
% This script initializes all physical parameters for the bicycle model

%% Vehicle and Motor Parameters

R_w  = 0.3;          % Armature winding resistance (Ohms)
L_w  = 0.015;        % Armature winding inductance (Henries)
T_m  = 1.718;        % Motor transduction coefficient (Webers or Nm/A)
M   = 2200;         % Vehicle mass (kg)
b_tau = 0.05;       % Drive shaft viscous friction (N·m·s/rad)

R   = 0.2;          % Wheel radius (meters)
G_R  = 5;            % Gear ratio (dimensionless, 5:1)

C_R  = 0.006;        % Rolling resistance coefficient (dimensionless)
g   = 9.81;         % Acceleration due to gravity (m/s^2)

C_D  = 0.32;         % Aerodynamic drag coefficient (dimensionless)
rho = 1.21;         % Air density (kg/m^3)
A_f  = 2.05;         % Vehicle frontal area (m^2)

u_in = ??;          % Input voltage to the motor (Volts) - Define as needed


% Maximum water level for overflow check (5m above the reservoir level)
% This is used later to check if h1 or h2 exceeds this max height.
H_max_above_reservoir = 5; % (m)
% The initial water level in the tanks is at the reservoir level.
% Overflow occurs when tank height h1 or h2 is > 5m above the pipe inlet/outlet level.

% Shut-down time parameters for the ramp function Q0(t)
t_ramp = 0.15; % Time over which Q0 is reduced linearly to zero (s)
t_start_shutdown = 5; % Example: Time (t) when the turbine begins to turn off (s). Choose a time to reach steady-state before shutdown.

%% --- Variables to be Optimized (Initial Guess) ---

% Tank Area At - This will be varied to find the minimum value.
% Start with an initial guess, for example:
A_t_guess = 0.5; % (m^2)

% This is defined as a function of the guess At.
C_t_guess = A_t_guess / (rho * g); % (m^5/N) 

%% --- Check Assumption ---
% The problem assumes At > 5 * Ap
A_p_check = 5 * A_p; % Minimum At based on assumption (0.5 m^2)
if A_t_guess < A_p_check
    warning('Initial At guess is smaller than the recommended At > 5*Ap assumption boundary.');
end

%% --- Confirmation ---
disp(' ');
disp('All physical parameters have been initialized in the workspace.');