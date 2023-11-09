function robot_disp = LoadRobotDisplay(robot, varargin)
    ip = inputParser;
    ip.addParameter('UseExported',true,@(x) isequal(x,true) || isequal(x,false));
    ip.addParameter('ExportPath','',@(x)ischar(x));
    ip.addParameter('SkipExporting',false,@(x) isequal(x,true) || isequal(x,false));
    ip.parse(varargin{:});
    
    opts = ip.Results;
    if isempty(opts.ExportPath)
        root_path = utils.get_root_path();
        export_path = fullfile(root_path,'gen','animator');
        opts.ExportPath = export_path;
    else
        export_path = opts.ExportPath;
    end
    if ~exist(export_path,'dir')
        mkdir(export_path);
    end
    addpath(export_path);
    
    f = figure(1000);clf;
    robot_disp = frost.Animator.Display(f, robot, opts);
%     
%     % Rendering settings for every component
%     right_foot = robot.Links(getLinkIndices(robot, 'r_foot'));
%     rfoot_disp = frost.Animator.Patch(robot_disp.axs, robot, right_foot, 'urdf/r_foot_visual.STL', 'right_foot_patch', 'r_foot', opts);
%     robot_disp.addItem(rfoot_disp);
%     left_foot = robot.Links(getLinkIndices(robot, 'l_foot'));
%     lfoot_disp = frost.Animator.Patch(robot_disp.axs, robot, left_foot, 'urdf/l_foot_visual.STL', 'left_foot_patch', 'l_foot', opts);
%     robot_disp.addItem(lfoot_disp);
    
%     right_foot = robot.Links(getLinkIndices(robot, 'r_foot'));
%     [right_foot_faces, ~] = stlread('urdf/r_foot_visual.STL');
%     right_foot_offset = [0, 0, 0];
%     right_foot_disp = frost.Animator.Patch(robot_disp.axs, robot, right_foot, right_foot_offset, right_foot_faces, 'right_foot', opts);
%     robot_disp.addItem(right_foot_disp);

%     right_foot = sys.frames.RightFoot(robot);
%     param = sys.GetExtraParams();
%     name = 'RightFoot';
%     top_offset = [0,0,-param.hf];
%     wf = param.wf;
%     lt = param.lt;
%     lh = param.lh;
%     bottom_offset = [lt,-wf/2,0;
%         lt,wf/2,0;
%         -lh,wf/2,0;
%         -lh,-wf/2,0
%         ];
%     right_foot = frost.Animator.Pyramid(robot_disp.axs, robot, right_foot, top_offset, bottom_offset, name, opts);
%     robot_disp.addItem(right_foot);
%     
%     left_foot = sys.frames.LeftFoot(robot);
%     param = sys.GetExtraParams();
%     name = 'LeftFoot';
%     top_offset = [0,0,-param.hf];
%     wf = param.wf;
%     lt = param.lt;
%     lh = param.lh;
%     bottom_offset = [lt,-wf/2,0;
%         lt,wf/2,0;
%         -lh,wf/2,0;
%         -lh,-wf/2,0
%         ];
%     left_foot = frost.Animator.Pyramid(robot_disp.axs, robot, left_foot, top_offset, bottom_offset, name, opts);
%     robot_disp.addItem(left_foot);
    
end