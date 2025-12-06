function [ds, ext] = eqns(t, s, R_w, L_w, T_m, M, b_tau, R, G_R, C_R, g, C_D, rho, A_f, u_in)
    % ds = derivatives of the states
    % ext = extras
    
    Q_0 = turbine_profile(t);
    p_3 = s(1); %N-s/m^2, fluid momentum in first section of pipe
    p_9 = s(2); %N-s/m^2, fluid momentum in second section of pipe

    qdot_3 = u_in - (R_w / L_w *p_3) - ((T_m * G_R)/(R * M) * p_9);
    pdot_9 = ((G_R * T_m)/(R * L_w) * p_3) - ((b_tau * G_R^2)/(R^2 * M) * p_9) - (M * g * C_R * sign(p_9 / M));

    ds = [qdot_3; pdot_9;];

    %Extra variables
    ext = [Q_0, h_1, h_2];
end