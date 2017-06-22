function retStatus = Realize(hThis)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    retStatus = true;
    % 9 11
    try
        hBlock = pm_getsl_dblhandle(hThis.BlockHandle);
        nameStr = get_param(hBlock, 'LocalVarNames');
        if isempty(nameStr)
            % 14 16
            return;
        end % if
        % 17 19
        descStr = get_param(hBlock, 'LocalVarDescs');
        logStr = get_param(hBlock, 'LocalVarLogging');
        % 20 22
        nameLst = textscan(nameStr, '%s', 'delimiter', '|');
        descLst = textscan(descStr, '%s', 'delimiter', '|');
        logStates = logical(eval(logStr));
        % 24 26
        hThis.VarNames = nameLst{1.0, 1.0}(2.0:end);
        hThis.VarDescriptions = descLst{1.0, 1.0}(2.0:end);
        hThis.StateList = logStates;
    catch
        retStatus = false;
    end % try
