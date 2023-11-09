function robot = LoadModel(urdf, load_path, delay_set)
    % Construct RobotLinks object for Poppy Humanoid
    if nargin < 1
        cur = utils.get_root_path();
        urdf = fullfile(cur, 'urdf', 'poppy_humanoid_add_transmissions.pybullet.urdf');
    end
    
    if nargin < 2
        load_path = [];
    end
    
    if nargin < 3
        delay_set = false;
    end
    
    base = get_base_dofs('floating');
    robot = model.PoppyHumanoidModel(urdf, base, load_path);
end