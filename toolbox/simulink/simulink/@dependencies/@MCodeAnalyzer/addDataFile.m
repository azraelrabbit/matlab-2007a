function ref = addDataFile(obj, filename, reftype, refloc, found)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    if lt(nargin, 5.0) || found
        ref = dependencies.FileReference(filename, reftype, refloc);
    else
        ref = dependencies.FileReference.UnresolvedReference(filename, reftype, refloc);
        % 16 18
    end % if
    % 18 20
    obj.DataFiles = vertcat(horzcat(obj.DataFiles), ref);
