function booleanAnswer = sLSGIsModelReference(system)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    booleanAnswer = false;
    if eq(strcmp(get_param(system, 'Type'), 'block'), true)
        % 11 12
        booleanAnswer = strcmp(get_param(system, 'blockType'), 'ModelReference');
    else
        % 14 15
        % 15 18
        % 16 18
        % 17 18
    end % if
    % 19 20
end % function
