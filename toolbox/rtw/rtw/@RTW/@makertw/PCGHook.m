function PCGHook(h)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    % 12 13
    modelName = h.ModelName;
    buildInfo = h.BuildInfo;
    % 15 17
    % 16 17
    pcgCommand = get_param(modelName, 'PostCodeGenCommand');
    % 18 19
    if not(isempty(pcgCommand))
        if strcmp(get_param(modelName, 'RTWVerbose'), 'on')
            disp('### Evaluating PostCodeGenCommand specified in the model');
        end % if
        try
            % 24 26
            % 25 26
            cur_pwd = pwd;
            % 27 28
            eval(pcgCommand);
        catch
            lerr = lasterror;
            errMsg = horzcat(sprintf('\n'), lerr.message);
            % 32 34
            % 33 34
            cd(cur_pwd);
            DAStudio.error('RTW:buildProcess:invalidPostCodeGenCommand', 'PostCodeGenCommand', errMsg);
            % 36 37
        end % try
        % 38 40
        % 39 40
        if not(strcmp(cur_pwd, pwd))
            DAStudio.warning('RTW:makertw:changeDirNotAllowed', 'PostCodeGen command', pwd, cur_pwd);
            % 42 43
            cd(cur_pwd);
        end % if
        % 45 46
    end % if
end % function
