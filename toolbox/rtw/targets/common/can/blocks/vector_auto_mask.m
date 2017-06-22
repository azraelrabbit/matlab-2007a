function varargout = vector_auto_mask(action, block, varargin)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    % 11 12
    switch lower(action)
    case 'init'
        % 14 15
        varargout{1.0} = i_init(block, varargin{1.0});
    case 'channel_callback'
        % 17 18
        disabled = i_isBlockDisabled(block);
        switch disabled
        case 1.0
            i_disable(block);
        case 0.0
            i_enable(block);
        end % switch
    case 'update_timing_params_callback'
        i_update_bit_timing_params(block);
    end % switch
    return;
end % function
function disabled = i_isBlockDisabled(block)
    % 31 33
    % 32 33
    channel_param = get_param(block, 'channel_param');
    if strcmp(channel_param, 'None')
        % 35 36
        disabled = 1.0;
    else
        % 38 39
        disabled = 0.0;
    end % if
    return;
end % function
function out = i_init(block, in)
    % 44 50
    % 45 50
    % 46 50
    % 47 50
    % 48 50
    % 49 50
    bit_rate = in.bit_rate;
    nq = in.nq;
    sample_point = in.sample_point;
    tag = in.tag;
    % 54 56
    % 55 56
    [presc, tseg1, tseg2] = i_automatic_bit_timings(bit_rate, sample_point, nq);
    % 57 62
    % 58 62
    % 59 62
    % 60 62
    % 61 62
    sysroot = strtok(block, '/');
    sws = warning;
    warning('off')
    configblock = find_system(sysroot, 'LookUnderMasks', 'on', 'FollowLinks', 'on', 'MaskType', 'Vector CAN Configuration');
    % 66 69
    % 67 69
    % 68 69
    warning(sws);
    % 70 72
    % 71 72
    estring = 'null';
    for i=1.0:length(configblock)
        % 74 75
        if eq(strcmp(get_param(configblock{i}, 'Name'), get_param(block, 'Name')), 1.0)
            continue;
        end % if
        if eq(strcmp(get_param(configblock{i}, 'tag_param'), tag), 1.0)
            % 79 81
            % 80 81
            estring = sprintf('Another configuration block exists with tag %s. \n Change the tag in one of the configuration blocks and associate the required TX and RX blocks with that tag.', tag);
        end % if
    end % for
    % 84 86
    % 85 86
    out.presc = presc;
    out.tseg1 = tseg1;
    out.tseg2 = tseg2;
    out.disabled = i_isBlockDisabled(block);
    out.estring = estring;
    return;
end % function
function [presc, tseg1, tseg2] = i_automatic_bit_timings(bit_rate, sample_point, nq)
    % 94 97
    % 95 97
    % 96 97
    fsys = 1.6e+07;
    % 98 100
    % 99 100
    [propseg, pseg1, pseg2, presc, sample] = can_bit_timing(mrdivide(fsys, 2.0), bit_rate, nq, sample_point);
    tseg1 = plus(propseg, pseg1);
    tseg2 = pseg2;
    return;
end % function
function i_exit_bit_timing_callback(block)
    % 106 109
    % 107 109
    % 108 109
    set_param(block, 'presc', '');
    set_param(block, 'tseg1', '');
    set_param(block, 'tseg2', '');
    return;
end % function
function i_update_bit_timing_params(block)
    % 115 117
    % 116 117
    bit_rate = str2num(get_param(block, 'bit_rate'));
    sample_point = str2num(get_param(block, 'sample_point'));
    nq = str2num(get_param(block, 'nq'));
    % 120 121
    if isempty(bit_rate) || isempty(sample_point) || isempty(nq)
        % 122 123
        i_exit_bit_timing_callback(block);
        return;
    end % if
    % 126 128
    % 127 128
    [presc, tseg1, tseg2] = i_automatic_bit_timings(bit_rate, sample_point, nq);
    % 129 130
    set_param(block, 'presc', num2str(presc));
    set_param(block, 'tseg1', num2str(tseg1));
    set_param(block, 'tseg2', num2str(tseg2));
    return;
end % function
function i_enable(block)
    simUtil_maskParam('enable', block, 'bit_rate');
    simUtil_maskParam('enable', block, 'nq');
    simUtil_maskParam('enable', block, 'sample_point');
    simUtil_maskParam('enable', block, 'sjw');
    simUtil_maskParam('enable', block, 'sam');
    simUtil_maskParam('disable', block, 'presc');
    simUtil_maskParam('disable', block, 'tseg1');
    simUtil_maskParam('disable', block, 'tseg2');
end % function
function i_disable(block)
    simUtil_maskParam('disable', block, 'bit_rate');
    simUtil_maskParam('disable', block, 'nq');
    simUtil_maskParam('disable', block, 'sample_point');
    simUtil_maskParam('disable', block, 'presc');
    simUtil_maskParam('disable', block, 'sjw');
    simUtil_maskParam('disable', block, 'tseg1');
    simUtil_maskParam('disable', block, 'tseg2');
    simUtil_maskParam('disable', block, 'sam');
end % function
