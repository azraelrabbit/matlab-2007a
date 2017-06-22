function split_entity_arch = set_split_entity_arch(this, split_entity_arch)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    if split_entity_arch
        split_entity_arch = false;
        warning(hdlerrormsgid('invalidSetting'), 'Setting SplitEntityArch ''on'' is not supported in Verilog mode.');
        % 12 13
    end % if
end % function
