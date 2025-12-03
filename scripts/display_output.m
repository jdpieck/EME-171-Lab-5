close all;

q_7 = s(:, 2);  % Volume in Tank 1 (corresponds to h1)
q_13 = s(:, 4); % Volume in Tank 2 (corresponds to h2)

% Calculate the heights relative to the pipe connection elevation
h1_rel = q_7 / A_t;
h2_rel = q_13 / A_t;

% Maximum allowable height (H_max) is 5 meters above the surge tank tops.
H_max = 5; % This is the height above the surge tank rim (relative to the house/ground level)

% --- 2. Plotting the Results ---
figure(1);
% -------------------------------------------------------------------------
%% Plot A: Input Flow (Q_0) vs. Time

Q_in = ext(:,1);

% subplot(2, 1, 1);
% plot(t, Q_in, 'LineWidth', 2);
% title('Input Flow (Q_0) to Turbine vs. Time');
% xlabel('Time (s)');
% ylabel('Flow (m^3/s)');
% grid on;
% legend('$Q_0(t)$', 'Interpreter', 'latex', 'Location', 'best');

% -------------------------------------------------------------------------
%% Plot B: Tank Heights vs. Time

% subplot(2, 1, 2);
plot(t, h1_rel, 'b-', 'LineWidth', 2);
hold on;
plot(t, h2_rel, 'r--', 'LineWidth', 2);

% Add the maximum overflow line (5m above the reservoir)
yline((H_max+60), 'k:', 'LineWidth', 1.5, 'DisplayName', 'Overflow Limit @ Tank 2 (m)');
yline((H_max+40), 'k:', 'LineWidth', 1.5, 'DisplayName', 'Overflow Limit @ Tank 1 (m)');

title('Surge Tank Water Heights vs. Time');
xlabel('Time (s)');
ylabel('Water Height Above Tank Connection (m)');
legend('$h_1$', '$h_2$', 'Overflow Limits', 'Interpreter', 'latex', 'Location', 'best');
grid on;
hold off;

% Annotate the overflow status for the report discussion
max_h1 = max(h1_rel);
max_h2 = max(h2_rel);

fprintf('\n--- Surge Tank Analysis ---\n');
fprintf('Maximum Height in Tank 1 (h1): %.3f m\n', max_h1);
fprintf('Maximum Height in Tank 2 (h2): %.3f m\n', max_h2);
fprintf('Overflow Limit (H_max): %.3f m\n', H_max);

if max_h1 > (H_max+40) || max_h2 > (H_max+60)
    fprintf('\n!!! WARNING: OVERFLOW DETECTED !!!\n');
else
    fprintf('\nSUCCESS: Surge tanks did not overflow for At = %.3f m^2.\n', A_t);
end