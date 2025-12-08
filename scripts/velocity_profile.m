function v_out = velocity_profile(t, t_start, v)
    
    if t < t_start
        v_out = 0;
    else
        v_out = v; 
    end
    
end