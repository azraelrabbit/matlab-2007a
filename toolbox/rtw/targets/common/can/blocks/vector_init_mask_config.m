function vector_init_mask_config(action, block, varargin)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    switch lower(action)
    case 'channel'
        disabled = vector_config_params(block);
        switch disabled
        case 1.0
            local_disable(block);
        case 0.0
            local_enable(block);
            % 20 22
            vector_init_mask_config('timing', block);
        end
    case 'timing'
        d = get_param(block, 'manual_bit_timings');
        switch d
        case 'on'
            local_enable_manual_bit_timing(block);
        case 'off'
            local_disable_manual_bit_timing(block);
            % 30 33
            % 31 33
            baud_rate = get_param(block, 'baud_rate');
            local_update_displayed_values(baud_rate);
        end
    case 'baud_rate'
        % 36 40
        % 37 40
        % 38 40
        man_bit_timings = get_param(block, 'manual_bit_timings');
        if eq(strcmp(man_bit_timings, 'off'), 1.0)
            baud_rate = get_param(block, 'baud_rate');
            local_update_displayed_values(baud_rate);
        end
    case 'copyfcn_callback'
        % 45 48
        % 46 48
        newline = sprintf('\n');
        warnstring = horzcat('The Vector CAN Configuration block has been superseded. ', 'The new block allows the specification of arbitrary CAN bit ', 'rates in the mask.', newline, newline, 'Please use the new block from the CAN Drivers (Vector) library.');
        % 49 53
        % 50 53
        % 51 53
        warndlg(warnstring, 'Vector CAN Configuration Superseded');
        % 53 56
        % 54 56
    end
end
function local_update_displayed_values(baud_rate)
    switch baud_rate
    case '1 MBaud'
        presc = 1.0;
        sjw = 1.0;
        tseg1 = 4.0;
        tseg2 = 3.0;
        sam = 0.0;
    case '500 kBaud'
        presc = 1.0;
        sjw = 1.0;
        tseg1 = 8.0;
        tseg2 = 7.0;
        sam = 0.0;
    case '100 kBaud'
        presc = 4.0;
        sjw = 4.0;
        tseg1 = 12.0;
        tseg2 = 7.0;
        sam = 1.0;
    case '10 kBaud'
        presc = 32.0;
        sjw = 4.0;
        tseg1 = 16.0;
        tseg2 = 8.0;
        sam = 1.0;
    end
    % 84 86
    set_param(gcb, 'presc_in', num2str(presc));
    set_param(gcb, 'sjw_in', num2str(sjw));
    set_param(gcb, 'tseg1_in', num2str(tseg1));
    set_param(gcb, 'tseg2_in', num2str(tseg2));
    if eq(sam, 0.0)
        set_param(gcb, 'sam_in', '1 sample per bit');
    else
        if eq(sam, 1.0)
            set_param(gcb, 'sam_in', '3 samples per bit');
        end
    end
end
function local_enable_manual_bit_timing(block)
    simUtil_maskParam('hide', block, 'baud_rate');
    simUtil_maskParam('enable', block, 'presc_in');
    simUtil_maskParam('enable', block, 'sjw_in');
    simUtil_maskParam('enable', block, 'tseg1_in');
    simUtil_maskParam('enable', block, 'tseg2_in');
    simUtil_maskParam('enable', block, 'sam_in');
end
function local_disable_manual_bit_timing(block)
    % 106 108
    simUtil_maskParam('show', block, 'baud_rate');
    simUtil_maskParam('disable', block, 'presc_in');
    simUtil_maskParam('disable', block, 'sjw_in');
    simUtil_maskParam('disable', block, 'tseg1_in');
    simUtil_maskParam('disable', block, 'tseg2_in');
    simUtil_maskParam('disable', block, 'sam_in');
end
function local_enable(block)
    % 115 118
    % 116 118
    simUtil_maskParam('enable', block, 'baud_rate');
    simUtil_maskParam('enable', block, 'manual_bit_timings');
    simUtil_maskParam('enable', block, 'presc_in');
    simUtil_maskParam('enable', block, 'sjw_in');
    simUtil_maskParam('enable', block, 'tseg1_in');
    simUtil_maskParam('enable', block, 'tseg2_in');
    simUtil_maskParam('enable', block, 'sam_in');
end
function local_disable(block)
    simUtil_maskParam('disable', block, 'baud_rate');
    simUtil_maskParam('disable', block, 'manual_bit_timings');
    simUtil_maskParam('disable', block, 'presc_in');
    simUtil_maskParam('disable', block, 'sjw_in');
    simUtil_maskParam('disable', block, 'tseg1_in');
    simUtil_maskParam('disable', block, 'tseg2_in');
    simUtil_maskParam('disable', block, 'sam_in');
end
