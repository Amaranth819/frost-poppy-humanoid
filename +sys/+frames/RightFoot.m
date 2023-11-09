function [contact, fric_coef, geometry] = RightFoot(robot)

    params = sys.GetExtraParams();
    r_foot_frame = robot.Joints(getJointIndices(robot, 'r_ankle_y'));
    
    contact = CoordinateFrame(...
        'Name', 'LeftSole',...
        'Reference', r_foot_frame,...
        'Offset', [0, 0, 0],...
        'R', [0, 0, 0]...
    );

    fric_coef.mu = params.fric_coef;
    fric_coef.gamma = params.rot_fric_coef;
    
    geometry.la = params.wf / 2;
    geometry.lb = params.wf / 2;
    geometry.La = params.lt;
    geometry.Lb = params.lh;
end