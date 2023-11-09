%% Setup
clear; close all; clc;
restoredefaultpath; matlabrc;

frost_path  = 'E:\Syracuse\Robot\robot\code\FROST-master\FROST-master\'; % specify the path to the FROST
addpath(frost_path);
frost_addpath; % initialize FROST
export_path = 'gen/sim'; % path to export compiled C++ and MEX files
utils.init_path(export_path);
addpath('gen/sim');

%% Robot model settings
curr_path = utils.get_root_path();
% Add transmissions in urdf to identify actuators (same as adding motors in mujoco)
urdf = fullfile(curr_path, 'urdf', 'poppy_humanoid_add_transmissions.pybullet.urdf');
delay_set = true;
load_sys = false; % if true, then load symbolic expression
if load_sys
    load_path = 'gen/sym';
    init_path();
else
    load_path = [];
end

%% Load robot model.
robot = sys.LoadModel(urdf, load_path, delay_set);

%% Load hybrid system.
system = sys.LoadSystem(robot, load_path);

%% Compile (only need to run for the 1st time)
system.compile(export_path);

%% Animation
exo_disp = plot.LoadRobotDisplay(robot, 'UseExported', true, 'SkipExporting', false);
% exo_disp = plot.LoadRobotDisplay(robot);