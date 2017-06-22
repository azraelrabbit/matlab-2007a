function mech_setup_sfun(sfun_name, blocks)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    blocks = find_system(blocks, 'LookUnderMasks', 'all', 'FollowLinks', 'on', 'BlockType', 'S-Function');
    % 8 12
    % 9 12
    % 10 12
    % 11 12
    for i=1.0:length(blocks)
        set_param(blocks(i), 'FunctionName', sfun_name);
    end % for
end % function
