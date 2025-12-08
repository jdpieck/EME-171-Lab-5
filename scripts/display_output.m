close all;

% 1. Recover physical variables from the state vector 's'
% s(:,1) = Flux Linkage (p_L). Current i = p_L / L_w
% s(:,2) = Momentum (p_M).     Velocity v = p_M / M

i_motor = s(:,1) / L_w;   % Motor Current (Amps)
v_vehicle = s(:,2) / M;   % Vehicle Velocity (m/s)

% 2. Reconstruct the input signal for plotting
% We loop through the time vector 't' to see what the input was at each step
u_plot = zeros(length(t), 1);
for k = 1:length(t)
    u_plot(k) = velocity_profile(t(k), t_start, u_in);
end

% 3. Generate the Plots
figure('Name', 'Lab 5 Simulation Results', 'Color', 'w');

% Top Plot: Vehicle Velocity (The Response)
subplot(2,1,1);
plot(t, v_vehicle, 'b', 'LineWidth', 2);
title('Response: Vehicle Velocity');
xlabel('Time (s)');
ylabel('Velocity (m/s)');
grid on;

% Bottom Plot: Input Voltage (The Input)
subplot(2,1,2);
plot(t, u_plot, 'r--', 'LineWidth', 2);
title('Input: Voltage Profile (u_{in})');
xlabel('Time (s)');
ylabel('Voltage (V)');
grid on;

% Print steady state velocity for verification
fprintf('Final Velocity: %.4f m/s\n', v_vehicle(end));