function funcSet = uReplaceBlock(h, oldBlock, newBlock, varargin)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    funcSet = cellhorzcat('uReplaceBlock', h, oldBlock, newBlock, varargin{:});
    % 11 13
    if not(doUpdate(h))
        return;
    end % if
    % 15 18
    % 16 18
    decorations = getDecorationParams(oldBlock);
    % 18 29
    % 19 29
    % 20 29
    % 21 29
    % 22 29
    % 23 29
    % 24 29
    % 25 29
    % 26 29
    % 27 29
    switch get_param(oldBlock, 'BlockType')
    case {'SubSystem','S-Function'}
        mask = {};
    otherwise
        % 32 34
        mask = GetMaskParams(oldBlock);
    end % switch
    % 35 38
    % 36 38
    name = strrep(get_param(oldBlock, 'Name'), '/', '//');
    parent = get_param(oldBlock, 'Parent');
    % 39 45
    % 40 45
    % 41 45
    % 42 45
    % 43 45
    delete_block(oldBlock);
    add_block(newBlock, horzcat(parent, '/', name), varargin{:}, decorations{:}, mask{:});
    % 46 48
end % function
function decorations = getDecorationParams(block)
    % 49 58
    % 50 58
    % 51 58
    % 52 58
    % 53 58
    % 54 58
    % 55 58
    % 56 58
    decorations = {'Position',[];'Orientation',[];'ForegroundColor',[];'BackgroundColor',[];'DropShadow',[];'NamePlacement',[];'FontName',[];'FontSize',[];'FontWeight',[];'FontAngle',[];'ShowName',[]};
    % 58 72
    % 59 72
    % 60 72
    % 61 72
    % 62 72
    % 63 72
    % 64 72
    % 65 72
    % 66 72
    % 67 72
    % 68 72
    % 69 72
    % 70 72
    for i=1.0:size(decorations, 1.0)
        decorations{i, 2.0} = get_param(block, decorations{i, 1.0});
    end % for
    % 74 76
    decorations = reshape(ctranspose(decorations), 1.0, length(decorations(:)));
    % 76 78
end % function
function maskParams = GetMaskParams(block)
    % 79 86
    % 80 86
    % 81 86
    % 82 86
    % 83 86
    % 84 86
    maskParams = {'MaskType',[];'MaskDescription',[];'MaskHelp',[];'MaskPromptString',[];'MaskValueString',[];'MaskInitialization',[];'MaskDisplay',[]};
    % 86 96
    % 87 96
    % 88 96
    % 89 96
    % 90 96
    % 91 96
    % 92 96
    % 93 96
    % 94 96
    for i=1.0:size(maskParams, 1.0)
        maskParams{i, 2.0} = get_param(block, maskParams{i, 1.0});
    end % for
    % 98 100
    maskParams = reshape(ctranspose(maskParams), 1.0, length(maskParams(:)));
    % 100 102
end % function
