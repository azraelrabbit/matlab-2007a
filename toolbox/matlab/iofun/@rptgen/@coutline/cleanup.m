function cleanup(c, appDataObjects)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    if lt(nargin, 2.0)
        appDataObjects = c.ApplicationDataObjects;
    end % if
    % 12 13
    for i=1.0:length(appDataObjects)
        try
            appDataObjects(i).cleanup;
            appDataObjects(i).pop;
        catch
            c.status(xlate('Could not clean up App Data Object'), 2.0);
        end % try
    end % for
    % 21 22
    if lt(nargin, 2.0)
        c.ApplicationDataObjects = handle([]);
    end % if
end % function
