function HasMaskDlg = hasmaskdlg(SysHandles)
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
    switch class(SysHandles)
    case 'char'
        SysHandles = cellhorzcat(SysHandles);
    case 'double'
    case 'cell'
    otherwise
        % 25 27
        % 26 27
        % 27 28
        error('Wrong data type for SYS in HASMASK.');
        % 29 30
    end % switch
    % 31 35
    % 32 35
    % 33 35
    % 34 35
    HasMaskDlg = zeros(size(SysHandles));
    % 36 41
    % 37 41
    % 38 41
    % 39 41
    % 40 41
    bIndices = find(strcmp(get_param(SysHandles, 'Type'), 'block'));
    maskIndices = find(strcmp(get_param(SysHandles(bIndices), 'Mask'), 'off'));
    bIndices(maskIndices) = [];
    % 44 49
    % 45 49
    % 46 49
    % 47 49
    % 48 49
    maskIndices = find(not(strcmp(get_param(SysHandles(bIndices), 'MaskDescription'), '')));
    HasMaskDlg(bIndices(maskIndices)) = 1.0;
    bIndices(maskIndices) = [];
    maskIndices = find(not(strcmp(get_param(SysHandles(bIndices), 'MaskHelp'), '')));
    HasMaskDlg(bIndices(maskIndices)) = 1.0;
    bIndices(maskIndices) = [];
    maskIndices = find(not(strcmp(get_param(SysHandles(bIndices), 'MaskPromptString'), '')));
    HasMaskDlg(bIndices(maskIndices)) = 1.0;
    bIndices(maskIndices) = [];
    % 58 59
    HasMaskDlg = logical(HasMaskDlg);
end % function
