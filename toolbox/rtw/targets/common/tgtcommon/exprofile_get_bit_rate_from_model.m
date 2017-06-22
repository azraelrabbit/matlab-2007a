function config_for_class = exprofile_get_bit_rate_from_model(modelName, profiling_blocks)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    model_open = find_system('type', 'block_diagram', 'BlockDiagramType', 'model', 'Name', modelName);
    if lt(length(model_open), 1.0)
        error(horzcat('The model ', modelName, ' is not open. To determine the bit-rate used by this model ', 'execution profiling, the model must be open. Please open the model.'));
        % 17 19
    end
    % 19 21
    block_h_list = {};
    for i=1.0:length(profiling_blocks)
        % 22 24
        block_h = find_system(modelName, 'FollowLinks', 'on', 'LookUnderMasks', 'on', 'MaskType', profiling_blocks(i).block_mask_id);
        % 24 26
        found_block = gt(length(block_h), 0.0);
        block_h_list = horzcat(block_h_list, block_h);
        % 27 29
        if found_block
            % 29 31
            config_class = profiling_blocks(i).class;
        end
    end % for
    % 33 35
    if lt(length(block_h_list), 1.0)
        % 35 37
        msg = sprintf('Failed to find any execution profiling block,\n\n');
        for i=1.0:length(profiling_blocks)
            msg = sprintf(horzcat(msg, profiling_blocks(i).block_mask_id, '\n'))
        end % for
        msg = sprintf(horzcat(msg, '\nin model ', modelName, '. ', 'Please add an execution profiling block to the model then rebuild and ', 're-download if you wish to use execution profiling.'));
        % 41 44
        % 42 44
        error(msg);
    end
    if gt(length(block_h_list), 1.0)
        error(horzcat('More than 1 Execution Profiling block was found in the model ', modelName, '.'));
    end
    % 48 51
    % 49 51
    targetClass = RTWConfigurationCB('get_target', block_h_list);
    config_for_class = targetClass.findConfigForClass(config_class);
end
