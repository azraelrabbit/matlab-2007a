function topLevelBlocks = ssc_gettoplevelblocks(mdl)
    % 1 16
    % 2 16
    % 3 16
    % 4 16
    % 5 16
    % 6 16
    % 7 16
    % 8 16
    % 9 16
    % 10 16
    % 11 16
    % 12 16
    % 13 16
    % 14 16
    % 15 16
    if not(isa(mdl, 'Simulink.BlockDiagram'))
        mdl = get_param(mdl, 'Object');
    end % if
    % 19 21
    % 20 21
    topLevelBlocks = find_system(mdl.Handle, 'LookUnderMasks', 'on', 'regexp', 'on', 'Type', 'block', 'LinkStatus', 'resolved');
    % 22 24
    % 23 24
end % function
