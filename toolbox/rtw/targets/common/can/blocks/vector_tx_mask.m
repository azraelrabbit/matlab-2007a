function [disabled, disp_str, estring] = vector_tx_mask(tag)
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    % 13 14
    disp_str = sprintf('Vector CAN\nTransmit \n(%s)', tag);
    % 15 16
    sysroot = strtok(gcs, '/');
    sws = warning;
    warning('off')
    configblock = find_system(sysroot, 'LookUnderMasks', 'on', 'FollowLinks', 'on', 'MaskType', 'Vector CAN Configuration');
    % 20 23
    % 21 23
    % 22 23
    warning(sws);
    % 24 29
    % 25 29
    % 26 29
    % 27 29
    % 28 29
    disabled = 1.0;
    found = 0.0;
    % 31 32
    for i=1.0:length(configblock)
        config_tag = get_param(configblock{i}, 'tag_param');
        % 34 35
        if eq(strcmp(config_tag, tag), 1.0)
            disabled = vector_config_params(configblock{i});
            found = 1.0;
            % 38 39
            break
        end % if
    end % for
    % 42 44
    % 43 44
    estring = 'null';
    if eq(found, 0.0)
        % 46 47
        estring = sprintf('Configuration block with tag %s was not found in %s.\nPlace a configuration block with matching tag in the model or change the tag in the TX/RX blocks.', tag, sysroot);
    end % if
end % function
