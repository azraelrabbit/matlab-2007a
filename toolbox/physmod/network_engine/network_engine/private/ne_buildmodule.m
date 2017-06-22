function ne_buildmodule(info)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if ispc
        % 8 9
        [directory, filename] = fileparts(info.GeneratedEqnLib);
        dll = fullfile(directory, horzcat(filename, '.dll'));
        % 11 12
        if exist(dll, 'file')
            delete(dll);
        end % if
        % 15 16
        oldDir = pwd;
        cd(directory);
        % 18 19
        try
            mex(horzcat('-I', matlabroot, '/toolbox/physmod/extern/include'), horzcat(matlabroot, '/toolbox/physmod/extern/lib/', computer('arch'), '/ne_mli.lib'), horzcat(matlabroot, '/toolbox/physmod/extern/lib/', computer('arch'), '/pm_util.lib'), info.GeneratedEqnSource, '-output', info.GeneratedEqnLib);
        catch
            % 22 25
            % 23 25
            % 24 25
            % 25 26
            cd(oldDir);
            rethrow(lasterror);
        end % try
        cd(oldDir);
        % 30 31
        if exist(dll, 'file')
            copyfile(dll, info.GeneratedEqnLib);
            delete(dll);
        end % if
    else
        % 36 37
        mex(horzcat('TEMP=', fileparts(info.GeneratedEqnLib)), horzcat('-I', matlabroot, '/toolbox/physmod/extern/include'), '-lmwne_mli', '-lmwpm_util', info.GeneratedEqnSource, '-output', info.GeneratedEqnLib);
        % 38 43
        % 39 43
        % 40 43
        % 41 43
        % 42 43
    end % if
    % 44 46
    % 45 46
    [gen_src_path, gen_src_name] = ne_getmodulepath(info);
    src_c = fullfile(gen_src_path, horzcat(gen_src_name, '.c'));
    src_h = fullfile(gen_src_path, horzcat(gen_src_name, '.h'));
    fileattrib(src_c, '-w');
    fileattrib(src_h, '-w');
end % function
