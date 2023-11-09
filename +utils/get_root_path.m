function [root_path] = get_root_path()
    pathstr = mfilename('fullpath');
    [pathstr, ~, ~] = fileparts([pathstr, '.m']);
    [root_path, ~, ~] = fileparts(pathstr);
end