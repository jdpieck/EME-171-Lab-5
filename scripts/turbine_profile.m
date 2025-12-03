function [Q_0] = turbine_profile(t, Q_init, t_ramp, t_shutoff)
    % Calculates the turbine shutoff profile
    
    t_off =  t_ramp + t_shutoff;

    if t < t_shutoff
        Q_0 = Q_init;

    elseif t >= t_shutoff && t <= t_off
        Q_0 = Q_init*(1- (t - t_shutoff)/t_ramp);

    elseif t > t_off
        Q_0 = 0; % Turbine is shut off
    end

end