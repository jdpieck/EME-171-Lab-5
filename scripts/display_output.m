close all;

i_motor = s(:,1) / L_w;   % Motor Current (Amps)
v_vehicle = s(:,2) / M;   % Vehicle Velocity (m/s)

v_ref=zeros(length(t),1); 
for i=1:length(t) 
    v_ref(i) = LA92Oracle(t(i)); 
end 


%% Generate the Plots
figure('Name', 'Lab 5 Simulation Results', 'Color', 'w', 'Position', [50, 50, 700, 400]);

% Top Plot: Vehicle Velocity (The Response)
% subplot(2,1,1);
hold on 
plot(t, v_vehicle, 'b', 'LineWidth', 1.2);
plot(t, v_ref, 'r', 'LineWidth', 1.2, "LineStyle","-.");
legend({'Actual', 'Reference'})
title('Response: Vehicle Velocity');
xlabel('Time (s)');
ylabel('Velocity (m/s)');
grid on;
axis([32,54,4,8]);
hold off;


% Bottom Plot: Input Voltage (The Input)
% subplot(2,1,2);
% plot(t, u_plot, 'r--', 'LineWidth', 2);
% title('Input: Voltage Profile (u_{in})');
% xlabel('Time (s)');
% ylabel('Voltage (V)');
% grid on;

% Print steady state velocity for verification
fprintf('Final Velocity: %.4f m/s\n', v_vehicle(end));

[peak,peak_time] = max(v_vehicle);

fprintf('Peak Velocity: %.4f m/s\n', peak);
fprintf('Overshoot Percentage: %.4f %% \n', (peak-v_vehicle(end))/v_vehicle(end)*100);
fprintf('Normalized Peak Time: %.4f s \n',peak_time*t_step-t_start)


%Initial index
r2 = 1;
while v_vehicle(r2) < 0.9*v_vehicle(end) %Will hit the first instance of 90% SS. Value
    r2 = r2 + 1;
end
rise_time = (r2)*t_step;

fprintf('Normalized Rise Time: %.4f s \n',rise_time-t_start)

e = t_end/t_step;

% 2% above S.S. value and 2% below.
while v_vehicle(e) > 0.98*v_vehicle(end) && v_vehicle(e)<1.02*v_vehicle(end)
    e = e - 1;
end

settling_time = (e-1)*t_step;

fprintf('Normalized Settling Time: %.4f s \n',settling_time-t_start)