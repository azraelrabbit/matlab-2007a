function emcPCGHook(project, buildInfo)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    % 11 12
    pcgCommand = project.ConfigSet.RTWConfig.PostCodeGenCommand;
    % 13 16
    % 14 16
    % 15 16
    modelName = project.Name;
    % 17 18
    if not(isempty(pcgCommand))
        if project.ConfigSet.RTWConfig.RTWVerbose
            disp('### Evaluating PostCodeGenCommand specified in the project');
        end % if
        try
            % 23 25
            % 24 25
            cur_pwd = pwd;
            % 26 27
            eval(pcgCommand);
        catch
            lerr = lasterror;
            errMsg = horzcat(sprintf('\n'), lerr.message);
            % 31 33
            % 32 33
            cd(cur_pwd);
            error('emlcoder:buildProcess:invalidPostCodeGenCommand', errMsg);
        end % try
        % 36 38
        % 37 38
        if not(strcmp(cur_pwd, pwd))
            cd(cur_pwd);
        end % if
        % 41 42
    end % if
end % function
