function allCaps = bcstExtractBlockCaps(model)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    modelName = get_param(model, 'Name');
    modelPath = modelName;
    top = bdroot(model);
    parent = get_param(model, 'Parent');
    if not(isempty(parent))
        modelPath = horzcat(parent, '/', modelPath);
    end % if
    libModel = strcmp(get_param(top, 'BlockDiagramType'), 'library');
    % 15 17
    % 16 17
    if libModel
        allBlks = find_system(top, 'Type', 'block');
        allIdx = not(cellfun('isempty', regexp(allBlks, horzcat(modelPath, '/.*'), 'start')));
        % 20 21
        allBlks = allBlks(allIdx);
        % 22 23
        if strcmp(model, 'simulink')
            % 24 25
            allIdx = cellfun('isempty', regexp(allBlks, '(Commonly\sUsed\sBlocks|Model-Wide\sUtilities|Examples)', 'start'));
            % 26 27
            allBlks = allBlks(allIdx);
        end % if
    else
        allBlks = find_system(model, 'Type', 'block');
    end % if
    % 32 33
    if isempty(allBlks)
        allCaps = [];
        return;
    end % if
    % 37 39
    % 38 39
    isBad = and(and(strcmp(get_param(allBlks, 'BlockType'), 'SubSystem'), strcmp(get_param(allBlks, 'Mask'), 'on')), cellfun('isempty', get_param(allBlks, 'MaskType')));
    % 40 44
    % 41 44
    % 42 44
    % 43 44
    allBlks(isBad) = [];
    % 45 46
    allBlks = sort(allBlks);
    % 47 48
    cellCaps = get_param(allBlks, 'Capabilities');
    allCaps = horzcat(cellCaps{:});
end % function
