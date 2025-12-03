%% --- Physical Parameters Initialization ---
% This script initializes all physical parameters for the bicycle model

rho = 1000; %kg/m^3, density of water
g = 9.81; %m/s^2, gravitational acceleration
%A_t = 0.5; %Original Guess
A_t = 0.75; %m^2, area of tanks
A_p = 0.1; %m^2, area of pipe from reservoir to turbine
L = 50; %m, Length of pipes
d_0 = 20; %m, depth of initial inlet
d_1 = 20; %m, depth of inlet to first tank
d_2 = 20; %m, depth of inlet to second tank
C_f = 49000; %kg/m^7, fluid pipe resistance coefficient
Q_init = 1.5; %m^3/s, steady-state flow rate through the turbine

C_t = A_t / (rho * g);
I_p = (rho * L) / A_p;

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