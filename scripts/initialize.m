function intial_conditions = initialize(I_p, Q_0, C_t, C_f, d_0, d_1, d_2, g, rho)

    p_9 = I_p * Q_0; %N-s/m^2, steady-state fluid momentum in second section of pipe
    p_3 = I_p * Q_0; %N-s/m^2, steady-state fluid momentum in first section of pipe
    q_7 = C_t * ((rho * g * (d_0 + d_1)) - C_f * Q_0 * abs(Q_0)); %m^3, steady-state volume of water displaced in first tank
    q_13 = C_t * ((rho * g * (d_0 + d_1 + d_2)) - 2 * C_f * Q_0 * abs(Q_0)); %m^3, steady-state volume of water displaced in second tank
    
    intial_conditions = [p_3, q_7, p_9, q_13];
end