function [desc, interface_file_path] = getInterfaceDescription(h)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    % 14 15
    error(nargchk(1.0, 1.0, nargin, 'struct'))
    % 16 18
    % 17 18
    if h.generatedAlgorithm
        % 19 20
        [rootModel, sysPath] = h.getSystemPath;
        % 21 23
        % 22 23
        codeGenDir = h.a_getCodeGenDir(rootModel, sysPath);
        % 24 26
        % 25 26
        interface_file = 'pil_interface';
        % 27 28
        interface_file_path = fullfile(codeGenDir, horzcat(interface_file, '.m'));
    else
        % 30 31
        error('Custom algorithm not yet supported...');
        % 32 34
        % 33 34
    end % if
    % 35 37
    % 36 37
    if exist(interface_file_path, 'file')
        % 38 42
        % 39 42
        % 40 42
        % 41 42
        prevpath = addpath(codeGenDir, '-BEGIN');
        try
            desc = eval(interface_file);
        catch
            % 46 47
            path(prevpath);
            error(horzcat(interface_file_path, ' is not a valid M-file: ', lasterr));
        end % try
        % 50 51
        path(prevpath);
    else
        % 53 54
        nl = sprintf('\n');
        if h.generatedAlgorithm
            msg = horzcat('Please make sure that Simulink system: ', rootModel, '/', sysPath, nl, 'is configured to create a PIL Interface File ', 'and generate code again.');
        else
            % 58 59
            % 59 61
            % 60 61
            msg = '';
        end % if
        % 63 64
        error(horzcat('PIL Interface File: ', interface_file_path, ' does not exist.', nl, nl, msg));
        % 65 66
    end % if
end % function
