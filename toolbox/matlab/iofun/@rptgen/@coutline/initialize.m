function appDataObjects = initialize(this, ignoreObjects)
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
    appDataNames = union({'rptgen.appdata_rg','rptgen_hg.appdata_hg'}, locTraverseForResults(this));
    % 17 19
    % 18 19
    if gt(nargin, 1.0)
        for i=length(ignoreObjects):-1.0:1.0
            ignoreNames{i} = class(ignoreObjects(i));
        end % for
        appDataNames = setdiff(appDataNames, ignoreNames);
    end % if
    % 25 26
    appDataObjects = handle([]);
    for i=length(appDataNames):-1.0:1.0
        try
            appDataObjects(i, 1.0) = feval('push', feval(appDataNames{i}));
            appDataObjects(i, 1.0).initialize;
        catch
            disp('Error initializing App Data Object');
        end % try
    end % for
    % 35 36
    if gt(nargin, 1.0)
        appDataObjects = vertcat(appDataObjects, ignoreObjects(:));
    end % if
end % function
function rez = locTraverseForResults(c)
    % 41 43
    % 42 43
    try
        % 44 45
        rez = c.getAppDataNames;
    catch
        rez = {};
    end % try
    % 49 50
    childHandle = c.down;
        while not(isempty(childHandle))
        if isa(childHandle, 'rptgen.rptcomponent') && childHandle.Active
            rez = union(rez, locTraverseForResults(childHandle));
        end % if
        childHandle = childHandle.right;
    end % while
end % function
