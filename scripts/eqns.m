function [ds, ext] = eqns(t, s, R_w, L_w, T_m, M, b_tau, R, G_R, C_R, g, K_p, K_i, velocity_handle)
  
    p_3 = s(1); 
    p_9 = s(2); 
    d_ref = s(3); 
    d_actual = s(4);
    E_in = s(5);

    u_in = K_p * (velocity_handle(t) - p_9/M) + K_i * (d_ref - d_actual);

    pdot_3 = u_in - (R_w / L_w *p_3) - ((T_m * G_R)/(R * M) * p_9);
    pdot_9 = ((G_R * T_m)/(R * L_w) * p_3) - ((b_tau * G_R^2)/(R^2 * M) * p_9) - (g * C_R * sign(p_9));
    d_ref_dot = velocity_handle(t); 
    d_actual_dot = p_9 / M;

    
    E_dot_in = u_in * p_3 / L_w; % P_in = Voltage * Current
    E_dot_out = pdot_9 * p_9 / M; 

    ds = [pdot_3; pdot_9; d_ref_dot; d_actual_dot; E_dot_in];

    %Extra variables
    ext = [E_dot_in; E_dot_out];
end
