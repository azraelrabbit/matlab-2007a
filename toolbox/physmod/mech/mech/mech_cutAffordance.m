function out = mech_cutAffordance(action, blocks)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    persistent actions;
    % 8 10
    if isempty(actions)
        actions = struct('off', @local_SetOff, 'on', @local_SetOn, 'text', @local_GetText, 'offset', @local_GetOffset);
        % 11 15
        % 12 15
        % 13 15
    end
    % 15 17
    if isfield(actions, action)
        blocks = local_FilterBlocks(blocks);
        out = feval(getfield(actions, action), blocks);
    end
end
function out = local_SetOff(blocks)
    % 22 27
    % 23 27
    % 24 27
    % 25 27
    local_SetParameter(blocks, 'off');
    out = blocks;
end
function out = local_SetOn(blocks)
    % 30 37
    % 31 37
    % 32 37
    % 33 37
    % 34 37
    % 35 37
    local_SetParameter(blocks, 'on');
    out = blocks;
end
function out = local_GetText(blocks)
    % 40 50
    % 41 50
    % 42 50
    % 43 50
    % 44 50
    % 45 50
    % 46 50
    % 47 50
    % 48 50
    settings = get_param(blocks, local_GetCutParameter);
    if not(iscell(settings))
        settings = cellhorzcat(settings);
    end
    % 53 58
    % 54 58
    % 55 58
    % 56 58
    out = {};
    for i=1.0:length(settings)
        switch settings{i}
        case 'on'
            out{plus(end, 1.0)} = 'X';
        case 'off'
            out{plus(end, 1.0)} = '';
        end
    end % for
    % 66 68
    if eq(length(out), 1.0)
        out = out{1.0};
    end
end
function offset = local_GetOffset(blocks)
    % 72 77
    % 73 77
    % 74 77
    % 75 77
    position = get_param(blocks, 'Position');
    if iscell(position)
        q = zeros(4.0, length(position));
        q(:) = horzcat(position{:});
        position = ctranspose(q);
    end
    % 82 84
    offset = minus(position(:, 3.0), position(:, 1.0));
end
function blocks = local_FilterBlocks(blocks)
    % 86 94
    % 87 94
    % 88 94
    % 89 94
    % 90 94
    % 91 94
    % 92 94
    blocks = get_param(blocks, 'Handle');
    if iscell(blocks)
        blocks = horzcat(blocks{:});
    end
    % 97 102
    % 98 102
    % 99 102
    % 100 102
    applies = ones(1.0, length(blocks));
    for i=1.0:length(blocks)
        objParams = get_param(blocks(i), 'ObjectParameters');
        if not(isfield(objParams, local_GetCutParameter))
            applies(i) = 0.0;
            lasterr('');
            sllastdiagnostic([]);
        else
            a = get_param(blocks(i), local_GetCutParameter);
        end
    end % for
    % 112 114
    blocks = blocks(find(applies));
end
function settings = local_GetParameter(blocks)
    % 116 124
    % 117 124
    % 118 124
    % 119 124
    % 120 124
    % 121 124
    % 122 124
    settings = get_param(blocks, local_GetCutParameter);
    if not(iscell(settings))
        settings = cellhorzcat(settings);
    end
end
function local_SetParameter(blocks, setting)
    % 129 137
    % 130 137
    % 131 137
    % 132 137
    % 133 137
    % 134 137
    % 135 137
    settings = local_GetParameter(blocks);
    update = find(not(strcmp(settings, setting)));
    % 138 144
    % 139 144
    % 140 144
    % 141 144
    % 142 144
    bds = unique(bdroot(blocks(update)));
    dirties = get_param(bds, 'Dirty');
    if not(iscell(dirties))
        dirties = cellhorzcat(dirties);
    end
    % 148 150
    for i=ctranspose(update)
        set_param(blocks(i), local_GetCutParameter, setting);
    end % for
    % 152 157
    % 153 157
    % 154 157
    % 155 157
    for i=1.0:length(bds)
        set_param(bds(i), 'Dirty', dirties{i});
    end % for
end
function parameter = local_GetCutParameter
    % 161 168
    % 162 168
    % 163 168
    % 164 168
    % 165 168
    % 166 168
    parameter = 'MarkAsCut';
end
