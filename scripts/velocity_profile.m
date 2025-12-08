function v_out = velocity_profile(t, t_start, u_in)
    
    if t < t_start
        v_out = 0;
    else
        v_out = u_in; 
    end
    
end