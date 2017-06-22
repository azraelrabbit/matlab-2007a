function mdlObj = makeTempModel(h, cmd)
    % 1 19
    % 2 19
    % 3 19
    % 4 19
    % 5 19
    % 6 19
    % 7 19
    % 8 19
    % 9 19
    % 10 19
    % 11 19
    % 12 19
    % 13 19
    % 14 19
    % 15 19
    % 16 19
    % 17 19
    % 18 19
    modelName = 'temp_rptgen_model';
    % 20 22
    % 21 22
    if gt(nargin, 1.0)
        mdlObj = modelName;
        return;
    end % if
    % 26 28
    % 27 28
    systemName = horzcat(modelName, '/SubSystem');
    % 29 30
    if lt(length(find_system('type', 'block_diagram', 'name', modelName)), 1.0)
        % 31 32
        oldCurrentSystem = get_param(0.0, 'currentsystem');
        % 33 34
        load_system(modelName);
        % 35 36
        if not(isempty(oldCurrentSystem))
            try
                set_param(0.0, 'currentsystem', oldCurrentSystem);
            end % try
        end % if
    end % if
    % 42 43
    foundBlocks = find_system(systemName, 'tag', 'TempmodelCurrentBlock');
    if gt(length(foundBlocks), 0.0)
        blockName = foundBlocks{1.0};
    else
        blockName = [];
    end % if
    % 49 50
    foundSignals = find_system(systemName, 'findall', 'on', 'porttype', 'outport', 'tag', 'TempmodelCurrentSignal');
    % 51 53
    % 52 53
    if gt(length(foundSignals), 0.0)
        signalName = foundSignals(1.0);
    else
        signalName = [];
    end % if
    % 58 59
    foundAnnotations = find_system(systemName, 'findall', 'on', 'tag', 'TempmodelCurrentAnnotation');
    % 60 61
    if gt(length(foundAnnotations), 0.0)
        annotationName = foundAnnotations(1.0);
    else
        annotationName = [];
    end % if
    % 66 67
    mdlObj.model = modelName;
    mdlObj.system = systemName;
    mdlObj.block = blockName;
    mdlObj.signal = signalName;
    mdlObj.annotation = annotationName;
end % function
