function mech_initIO(iob)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    iob = get_param(iob, 'Handle');
    % 9 10
    if mech_compiled(iob)
        return;
    end % if
    % 13 14
    data = local_BlockParamsToData(iob);
    % 15 16
    cGcs = get_param(0.0, 'CurrentSystem');
    set_param(0.0, 'CurrentSystem', iob);
    % 18 22
    % 19 22
    % 20 22
    % 21 22
    width = data.width;
    if eq(width, 0.0)
        width = 1.0;
    end % if
    local_SetWidth(iob, width);
    % 27 32
    % 28 32
    % 29 32
    % 30 32
    % 31 32
    tag = data.tag;
    if data.active
        if isempty(tag)
            error('physmod:mech:mech_initIO:BlockActiveTagMustBeNonempty', 'if block is active tag must be non-empty');
            % 36 37
        end % if
        local_Activate(iob, tag);
    else
        local_Deactivate(iob, width);
    end % if
    % 42 43
    set_param(0.0, 'CurrentSystem', cGcs);
    set_param(cGcs, 'CurrentBlock', iob);
end % function
function data = local_BlockParamsToData(iob)
    % 47 48
    data = struct('tag', feature('SimMechanicsTagManager', iob), 'active', strcmp(get_param(iob, 'ActiveIO'), 'on'), 'width', str2num(get_param(iob, 'Width')));
    % 49 50
end % function
function local_Activate(iob, tag)
    % 52 56
    % 53 56
    % 54 56
    % 55 56
    signalBlk = horzcat(getfullname(iob), '/', MSB_SIGNAL_BLOCK);
    switch lower(get_param(signalBlk, 'BlockType'))
    case 'constant'
        newBlkType = 'From';
        params = cellhorzcat('GotoTag', tag);
    case 'terminator'
        newBlkType = 'Goto';
        params = cellhorzcat('GotoTag', tag, 'TagVisibility', 'global');
    otherwise
        newBlkType = '';
        params = cellhorzcat('GotoTag', tag);
    end % switch
    % 68 69
    newBlk = local_SwapSignalBlock(iob, newBlkType, params{:});
end % function
function local_Deactivate(iob, width)
    % 72 74
    % 73 74
    signalBlk = horzcat(getfullname(iob), '/', MSB_SIGNAL_BLOCK);
    switch lower(get_param(signalBlk, 'BlockType'))
    case 'from'
        newBlkType = 'Constant';
        params = {};
    case 'goto'
        newBlkType = 'Terminator';
        params = {};
    otherwise
        newBlkType = '';
        params = {};
    end % switch
    % 86 87
    newBlk = local_SwapSignalBlock(iob, newBlkType, params{:});
    % 88 92
    % 89 92
    % 90 92
    % 91 92
    if strcmp(get_param(newBlk, 'BlockType'), 'Constant')
        set_param(newBlk, 'Value', mat2str(zeros(1.0, width)));
    end % if
end % function
function newBlk = local_SwapSignalBlock(iob, newBlkType, varargin)
    % 97 100
    % 98 100
    % 99 100
    signalBlk = horzcat(getfullname(iob), '/', MSB_SIGNAL_BLOCK);
    if isempty(newBlkType)
        if not(isempty(varargin))
            set_param(signalBlk, varargin{:});
        end % if
        newBlk = signalBlk;
    else
        pos = get_param(signalBlk, 'Position');
        delete_block(signalBlk);
        % 109 110
        newBlk = add_block(horzcat('built-in/', newBlkType), signalBlk, 'Position', pos, varargin{:});
    end % if
end % function
function local_SetWidth(iob, width)
    % 114 116
    % 115 116
    inputPort = find_system(iob, 'LookUnderMasks', 'all', 'FollowLinks', 'on', 'Name', 'SIZED_INPUT_PORT');
    % 117 120
    % 118 120
    % 119 120
    if not(isempty(inputPort))
        set_param(inputPort, 'PortDimensions', num2str(width));
    end % if
end % function
function str = MSB_SIGNAL_BLOCK
    % 125 127
    % 126 127
    str = 'MSB_SIGNAL_BLOCK';
end % function
