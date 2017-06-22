function mech_attach_configset(bd)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    if strcmp(get_param(bd, 'BlockDiagramType'), 'model')
        mech_get_configset(bd);
    end % if
end % function
