function [system] = LoadSystem(model, load_path)
    if nargin < 2
        load_path = [];
    end
    
    right_stance = sys.domains.RightStance(model, load_path);
    left_stance = sys.domains.LeftStance(model, load_path);
    
    left_impact = RigidImpact('LeftImpact', left_stance, 'leftFootHeight');
    % left_impact.addImpactConstraint(struct2array(left_stance.HolonomicConstraints), load_path);
    
    right_impact = RigidImpact('RightImpact', right_stance, 'rightFootHeight');
    % right_impact.addImpactConstraint(struct2array(right_stance.HolonomicConstraints), load_path);
    
    io_control  = IOFeedback('IO');
    
    % Create a direct graph indicating the phases
    system = HybridSystem('atrias');
    system = addVertex(system, 'RightStance', 'Domain', right_stance, 'Control', io_control);
    system = addVertex(system, 'LeftStance', 'Domain', left_stance, 'Control', io_control);

    srcs = {'RightStance'
        'LeftStance'};

    tars = {'LeftStance'
        'RightStance'};

    system = addEdge(system, srcs, tars);
    system = setEdgeProperties(system, srcs, tars, 'Guard', {left_impact, right_impact});
end