function domain = RightStance(model, load_path)
    domain = copy(model);
    domain.setName('RightStance');
    
    if nargin < 2
        load_path = [];
    end
    
    % Add right foot contact
    [right_foot, fric_coef, geometry] = sys.frames.RightFoot(model);
    right_foot_contact = ToContactFrame(right_foot, 'PlanarContactWithFriction');
    domain = addContact(domain, right_foot_contact, fric_coef, geometry, load_path);
    
    % Add event
    % height of non-stance foot (left foot)
    [left_foot] = sys.frames.RightFoot(model);
    p_swing_foot = getCartesianPosition(domain, left_foot);
    h_nsf = UnilateralConstraint(domain, p_swing_foot(3), 'leftFootHeight', 'x');
    domain = addEvent(domain, h_nsf);
    
%     % Add virtual constraints
%     x = domain.States.x;
%     dx = domain.States.dx;
%     t = SymVariable('t'); % time
%     p = SymVariable('p', [2,1]); % time range
%     tau = (t - p(1))/(p(2) - p(1)); % time phase
    
    
    
end