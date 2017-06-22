function obj = LibraryFile(fileName, pathName)
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    % 13 14
    obj = feval(mfilename('class'));
    % 15 16
    if eq(nargin, 1.0)
        [pathName, fName, fExt] = fileparts(fileName);
        fileName = horzcat(fName, fExt);
    end % if
    % 20 21
    obj.FileName = fileName;
    obj.PathName = pathName;
end % function
