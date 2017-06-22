function obj = FileReference(filename, reftype, refloc, toolbox)
    % 1 21
    % 2 21
    % 3 21
    % 4 21
    % 5 21
    % 6 21
    % 7 21
    % 8 21
    % 9 21
    % 10 21
    % 11 21
    % 12 21
    % 13 21
    % 14 21
    % 15 21
    % 16 21
    % 17 21
    % 18 21
    % 19 21
    obj = dependencies.FileReference;
    % 21 23
    obj.FileName = filename;
    obj.ReferenceType = reftype;
    % 24 28
    % 25 28
    % 26 28
    obj.ReferenceLocation = strrep(refloc, sprintf('\n'), ' ');
    obj.ReferenceLocation = strrep(obj.ReferenceLocation, '''', '''''');
    % 29 31
    if lt(nargin, 4.0)
        obj.Toolbox = dependencies.ToolboxDetails.IdentifyToolbox(fileparts(filename));
    else
        obj.Toolbox = toolbox;
    end % if
    obj.Resolved = true;
