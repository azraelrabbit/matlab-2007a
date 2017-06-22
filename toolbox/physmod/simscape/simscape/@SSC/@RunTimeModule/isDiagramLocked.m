function isLocked = isDiagramLocked(this, obj)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    isLocked = strcmp(get_param(ssc_bdroot(obj.Handle), 'Lock'), 'on');
end % function
