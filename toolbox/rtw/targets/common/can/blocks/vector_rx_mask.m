function [frame_type, frame_disp, disabled, dispstr, estring] = vector_rx_mask(tag, frame_type_in, output_time)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    dispstr = sprintf('Vector CAN \nReceive \n(%s)', tag);
    % 11 12
    frame_type = minus(frame_type_in, 1.0);
    if eq(frame_type, 0.0)
        frame_disp = 'Standard';
    else
        frame_disp = 'Extended';
    end % if
    % 18 22
    % 19 22
    % 20 22
    % 21 22
    sysroot = strtok(gcs, '/');
    sws = warning;
    warning('off')
    configblock = find_system(sysroot, 'LookUnderMasks', 'on', 'FollowLinks', 'on', 'MaskType', 'Vector CAN Configuration');
    % 26 29
    % 27 29
    % 28 29
    warning(sws);
    % 30 34
    % 31 34
    % 32 34
    % 33 34
    disabled = 1.0;
    found = 0.0;
    % 36 37
    for i=1.0:length(configblock)
        config_tag = get_param(configblock{i}, 'tag_param');
        % 39 40
        if eq(strcmp(config_tag, tag), 1.0)
            disabled = vector_config_params(configblock{i});
            found = 1.0;
            % 43 44
            break
        end % if
    end % for
    % 47 48
    estring = 'null';
    if eq(found, 0.0)
        % 50 52
        % 51 52
        estring = sprintf('Configuration block with Tag %s was not found in %s.\nPlace a configuration Block with matching tag in the model or change the tag in the TX/RX blocks.', tag, sysroot);
    end % if
end % function
