function [ds, ext] = eqns(t, s, rho, g, L, A_t, A_p, d_0, d_1, d_2, C_f, turbine_profile, C_t, I_p)
    % ds = derivatives of the states
    % ext = extras
    
    Q_0 = turbine_profile(t);
    p_3 = s(1); %N-s/m^2, fluid momentum in first section of pipe
    q_7 = s(2); %m^3, volume of water displaced in first tank
    p_9 = s(3); %N-s/m^2, fluid momentum in second section of pipe
    q_13 = s(4); %m^3, volume of water displaced in second tank

    pdot_3 = (rho * g * d_0) + (rho * g * d_1) - (C_f / I_p) * p_3 * abs(p_3 / I_p) - (q_7 / C_t);
    qdot_7 = (p_3 / I_p) - (p_9 / I_p);
    pdot_9 = (q_7 / C_t) + (rho * g * d_2) - (C_f / I_p) * p_9 * abs(p_9 / I_p) - (q_13 / C_t);
    qdot_13 = (p_9 / I_p) - Q_0;
    
    %Height of Tank 1
    h_1 = q_7/A_t;

    %Height of Tank 2
    h_2 = q_13/A_p;

    ds = [pdot_3; qdot_7; pdot_9; qdot_13;];

    %Extra variables
    ext = [Q_0, h_1, h_2];
end