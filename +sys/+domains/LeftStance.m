function domain = LeftStance(model, load_path)
    domain = copy(model);
    domain.setName('LeftStance');
    
    if nargin < 2
        load_path = [];
    end
    
    % Add left foot contact
    [left_foot, fric_coef, geometry] = sys.frames.LeftFoot(model);
    left_foot_contact = ToContactFrame(left_foot, 'PlanarContactWithFriction');
    domain = addContact(domain, left_foot_contact, fric_coef, geometry, load_path);
    
    % Add event
    % height of non-stance foot (right foot)
    [right_foot] = sys.frames.RightFoot(model);
    p_swing_foot = getCartesianPosition(domain, right_foot);
    h_nsf = UnilateralConstraint(domain, p_swing_foot(3), 'rightFootHeight', 'x');
    domain = addEvent(domain, h_nsf);
    
%     % Add virtual constraints
%     x = domain.States.x;
%     dx = domain.States.dx;
%     t = SymVariable('t'); % time
%     p = SymVariable('p', [2,1]); % time range
%     tau = (t - p(1))/(p(2) - p(1)); % time phase
    
    
    
end