function varargout = mdladv_mdlref(action, models)
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
    if ne(nargin, 2.0)
        error('Invalid number of arguments');
    end % if
    % 18 19
    switch action
    case 'FindModelsWithModelRefAndTunableVars'
        topModel = get_param(models, 'Name');
        mdlList = l_FindModelsWithModelRefAndTunableVars(topModel);
        varargout{1.0} = mdlList;
    case 'FindModelsWithImplicitSignalResolution'
        % 25 26
        topModel = get_param(models, 'Name');
        mdlList = l_FindModelsWithImplicitSignalResolution(topModel);
        varargout{1.0} = mdlList;
    case 'ConvertTunableVarsToParameterObjects'
        % 30 31
        models = HTMLencode(models, 'decode');
        l_ConvertTunableVarsToParameterObjects(models);
    case 'DisableImplicitSignalResolution'
        % 34 35
        models = HTMLencode(models, 'decode');
        l_DisableImplicitSignalResolution(models);
    otherwise
        % 38 39
        error('Unexpected action')
    end % switch
end % function
function mdlList = l_FindModelsWithModelRefAndTunableVars(topModel)
    % 43 48
    % 44 48
    % 45 48
    % 46 48
    % 47 48
    mdlList = flipud(find_mdlrefs(topModel));
    % 49 50
    if eq(length(mdlList), 1.0)
        % 51 52
        mdlList = {};
        return;
    end % if
    % 55 57
    % 56 57
    for idx=length(mdlList):-1.0:1.0
        thisMdl = mdlList{idx};
        closeThisMdl = false;
        % 60 62
        % 61 62
        if isempty(find_system('Type', 'block_diagram', 'Name', thisMdl))
            load_system(thisMdl);
            closeThisMdl = true;
        end % if
        % 66 68
        % 67 68
        if isempty(get_param(thisMdl, 'TunableVars'))
            mdlList(idx) = [];
        end % if
        % 71 72
        if closeThisMdl
            bdclose(thisMdl);
        end % if
    end % for
end % function
function mdlList = l_FindModelsWithImplicitSignalResolution(topModel)
    % 78 83
    % 79 83
    % 80 83
    % 81 83
    % 82 83
    mdlList = flipud(find_mdlrefs(topModel));
    % 84 86
    % 85 86
    for idx=length(mdlList):-1.0:1.0
        thisMdl = mdlList{idx};
        closeThisMdl = false;
        % 89 91
        % 90 91
        if isempty(find_system('Type', 'block_diagram', 'Name', thisMdl))
            load_system(thisMdl);
            closeThisMdl = true;
        end % if
        % 95 97
        % 96 97
        if strcmp(get_param(thisMdl, 'SignalResolutionControl'), 'UseLocalSettings')
            mdlList(idx) = [];
        end % if
        % 100 101
        if closeThisMdl
            bdclose(thisMdl);
        end % if
    end % for
end % function
function l_ConvertTunableVarsToParameterObjects(mdlList)
    % 107 113
    % 108 113
    % 109 113
    % 110 113
    % 111 113
    % 112 113
    l_CallConversionFunction('tunablevars2parameterobjects', mdlList);
end % function
function l_DisableImplicitSignalResolution(mdlList)
    % 116 122
    % 117 122
    % 118 122
    % 119 122
    % 120 122
    % 121 122
    l_CallConversionFunction('disableimplicitsignalresolution', mdlList);
end % function
function l_CallConversionFunction(fcnName, mdlList)
    % 125 129
    % 126 129
    % 127 129
    % 128 129
    if not(iscell(mdlList))
        mdlList = cellhorzcat(mdlList);
    end % if
    % 132 134
    % 133 134
    for idx=1.0:length(mdlList)
        try
            % 136 137
            open_system(mdlList{idx});
            thisMdl = get_param(mdlList{idx}, 'Name');
            % 139 141
            % 140 141
            evalStr = sprintf('%s %s;', fcnName, thisMdl);
            eval(evalStr);
        catch
            % 144 145
            warnTxt = sprintf('Error occurred while converting model: %s\n%s', thisMdl, lasterr);
            warning(warnTxt);
        end % try
        % 148 150
        % 149 150
    end % for
end % function
