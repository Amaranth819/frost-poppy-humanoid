classdef PoppyHumanoidModel < RobotLinks
    properties
        
    end
    
    methods
        % Constructor
        function obj = PoppyHumanoidModel(urdf_file_path, base, load_path)
            if nargin < 2
                load_path = [];
            end
            
            [name, links, joints, transmissions] = ros_load_urdf(urdf_file_path);
            
            % Set up config
            config.name = name;
            config.joints = joints;
            config.links = links;
            config.transmissions = transmissions;
            
            obj = obj@RobotLinks(config, base, load_path);
        end
        
    end
end