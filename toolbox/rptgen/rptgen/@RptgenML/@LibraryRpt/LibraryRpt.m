function obj = LibraryRpt(fileName, pathName)
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
    obj = feval(mfilename('class'));
    % 14 16
    if isa(fileName, 'rptgen.coutline')
        [pathName, fName, fExt] = fileparts(fileName.RptFileName);
        % 17 23
        % 18 23
        % 19 23
        % 20 23
        % 21 23
        fileName = horzcat(fName, fExt);
    else
        if eq(nargin, 1.0)
            [pathName, fName, fExt] = fileparts(fileName);
            fileName = horzcat(fName, fExt);
        end
    end
    obj.FileName = fileName;
    obj.pathName = pathName;
end
