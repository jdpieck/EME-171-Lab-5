function tspan = find_time_control_parameters(compliance, inertia)

    omega_n = 1 / sqrt(compliance * inertia); 
    T = (2 * pi) / omega_n;       
    
    fprintf("Esimated Natural Freuqency: %.5f \n", omega_n)
    fprintf("Period Durration: %.5f \n", T)

    % Step size should be small enough to resolve the wave
    dt = T / 1000;                 
    
    % Total time should be long enough to see the result (5 to 10 periods)
    t_final = 5 * T;             
    
    tspan = 0:dt:t_final;
end