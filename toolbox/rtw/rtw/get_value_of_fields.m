function get_value_of_fields(hModel, dialogFig, transition)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    modelName = get_param(hModel, 'Name');
    eval(horzcat('global ', modelName, '_FunctionFileSplitThresholds;'));
    eval(horzcat('local = ', modelName, '_FunctionFileSplitThresholds;'));
    % 8 10
    functionSplit = 'Function split threshold';
    fileSplit = 'File split threshold';
    % 11 13
    switch transition
    case 'open'
        if isfield(local, 'AlreadyDeclared')
            o = findobj(dialogFig, 'Tag', horzcat(fileSplit, '_EditFieldTag'));
            set(o, 'String', local.FileSplitThreshold);
            % 17 19
            o = findobj(dialogFig, 'Tag', horzcat(functionSplit, '_EditFieldTag'));
            set(o, 'String', local.FunctionSplitThreshold);
        else
            local.AlreadyDeclared = 1.0;
            % 22 24
            o = findobj(dialogFig, 'Tag', horzcat(fileSplit, '_EditFieldTag'));
            local.FileSplitThreshold = get(o, 'String');
            % 25 27
            o = findobj(dialogFig, 'Tag', horzcat(functionSplit, '_EditFieldTag'));
            local.FunctionSplitThreshold = get(o, 'String');
        end % if
    case 'close'
        o = findobj(dialogFig, 'Tag', horzcat(fileSplit, '_EditFieldTag'));
        local.FileSplitThreshold = get(o, 'String');
        % 32 34
        o = findobj(dialogFig, 'Tag', horzcat(functionSplit, '_EditFieldTag'));
        local.FunctionSplitThreshold = get(o, 'String');
    otherwise
        DAStudio.error('RTW:configSet:unknownTransition');
    end % switch
    % 38 40
    eval(horzcat(modelName, '_FunctionFileSplitThresholds = local;'));
