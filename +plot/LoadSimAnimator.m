function [GUI] = LoadSimAnimator(robot, logger, varargin)
    t = [];
    q = [];
    
    for i=1:numel(logger)
        t = [t, logger(i).flow.t];
        q = [q, logger(i).flow.states.x];
    end
end