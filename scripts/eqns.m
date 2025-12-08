function [ds, ext] = eqns(t, s, R_w, L_w, T_m, M, b_tau, R, G_R, C_R, g, velocity_handle)
    % ds = derivatives of the states
    % ext = extras
    
    u_in = velocity_handle(t);
    p_3 = s(1); 
    p_9 = s(2); 

    qdot_3 = u_in - (R_w / L_w *p_3) - ((T_m * G_R)/(R * M) * p_9);
    pdot_9 = ((G_R * T_m)/(R * L_w) * p_3) - ((b_tau * G_R^2)/(R^2 * M) * p_9) - (M * g * C_R * sign(p_9 / M));

    ds = [qdot_3; pdot_9;];

    %Extra variables
    ext = [];
end
