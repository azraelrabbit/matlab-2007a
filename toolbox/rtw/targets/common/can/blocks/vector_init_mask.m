function [sam, disabled, dispstr, estring] = vector_init_mask(tag, baud_rate, presc_in, sjw_in, tseg1_in, tseg2_in, sam_in, manual_bit_timings, block)
    % 1 18
    % 2 18
    % 3 18
    % 4 18
    % 5 18
    % 6 18
    % 7 18
    % 8 18
    % 9 18
    % 10 18
    % 11 18
    % 12 18
    % 13 18
    % 14 18
    % 15 18
    % 16 18
    disabled = vector_config_params(block);
    % 18 20
    if eq(disabled, 1.0)
        baud_rate_name = 'Undefined';
        presc = 0.0;
        sjw = 0.0;
        tseg1 = 0.0;
        tseg2 = 0.0;
        sam = 0.0;
    else
        % 27 29
        switch manual_bit_timings
        case 0.0
            % 30 34
            % 31 34
            % 32 34
            switch baud_rate
            case 1.0
                baud_rate_name = '1M';
            case 2.0
                baud_rate_name = '500k';
            case 3.0
                baud_rate_name = '100k';
            case 4.0
                baud_rate_name = '10k';
            end
        case 1.0
            % 44 46
            baud_rate_name = 'manual';
            % 46 48
            warning_status = warning('query', 'all');
            try
                lasterr('');
                % 50 52
                warning('off');
                if (((eq(presc_in, 0.0)) | (eq(sjw_in, 0.0))) | (eq(tseg1_in, 0.0))) | (eq(tseg2_in, 0.0))
                    % 53 55
                    presc = 1.0;
                    sjw = 1.0;
                    tseg1 = 4.0;
                    tseg2 = 3.0;
                    sam = 0.0;
                    % 59 61
                    local_update_displayed_values(presc, sjw, tseg1, tseg2, sam)
                end
            end % try
            % 63 65
            warning(warning_status);
            % 65 67
            error(lasterr);
        end
        % 68 71
        % 69 71
        sam_in = get_param(block, 'sam_in');
        if eq(strcmp(sam_in, '1 sample per bit'), 1.0)
            sam = 0.0;
        else
            if eq(strcmp(sam_in, '3 samples per bit'), 1.0)
                sam = 1.0;
            end
        end
    end
    % 79 81
    dispstr = sprintf('Vector CAN \nConfiguration \n(%s)', tag);
    % 81 87
    % 82 87
    % 83 87
    % 84 87
    % 85 87
    sysroot = strtok(gcs, '/');
    sws = warning;
    warning('off')
    configblock = find_system(sysroot, 'LookUnderMasks', 'on', 'FollowLinks', 'on', 'MaskType', 'Vector CAN Configuration');
    % 90 94
    % 91 94
    % 92 94
    warning(sws);
    % 94 97
    % 95 97
    estring = 'null';
    for i=1.0:length(configblock)
        % 98 100
        if eq(strcmp(get_param(configblock{i}, 'Name'), get_param(gcbh, 'Name')), 1.0)
            continue;
        end
        if eq(strcmp(get_param(configblock{i}, 'tag_param'), tag), 1.0)
            % 103 106
            % 104 106
            estring = sprintf('Another configuration block exists with tag %s. \n Change the tag in one of the configuration blocks and associate the required TX and RX blocks with that tag.', tag);
        end
    end % for
end
function local_update_displayed_values(presc, sjw, tseg1, tseg2, sam)
    % 110 114
    % 111 114
    % 112 114
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
