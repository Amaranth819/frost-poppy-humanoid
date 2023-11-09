function [params] = GetExtraParams()

    % Temporarily copy from atlas, have to figure out their meanings
    params.lt = 0.1728;
    params.lh = 0.082;
    params.wf = 0.1524; % Width of foot?
    params.hf = 0.026833; % Height of foot?
    
    params.fric_coef = 0.5;
    params.rot_fric_coef = 20;
end