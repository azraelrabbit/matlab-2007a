function viewFile(h, fileName, viewPriority)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    if lt(nargin, 3.0)
        viewPriority = 2.0;
    end % if
    % 14 17
    % 15 17
    % 16 17
    if ge(h.ViewFiles, viewPriority)
        [fPath, fName, fExt] = fileparts(fileName);
        if isempty(fPath)
            fPath = h.ClassDir;
        end % if
        if isempty(fExt)
            fExt = '.m';
        end % if
        % 25 26
        fileName = fullfile(fPath, horzcat(fName, fExt));
        % 27 28
        edit(fileName);
    end % if
end % function
