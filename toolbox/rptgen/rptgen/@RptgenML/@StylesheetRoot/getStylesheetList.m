function sList = getStylesheetList(this, propName, listAction)
    % 1 19
    % 2 19
    % 3 19
    % 4 19
    % 5 19
    % 6 19
    % 7 19
    % 8 19
    % 9 19
    % 10 19
    % 11 19
    % 12 19
    % 13 19
    % 14 19
    % 15 19
    % 16 19
    % 17 19
    sList = cell(0.0, 2.0);
    if isempty(this.StylesheetLibrary) && gt(nargin, 2.0) && strcmpi(listAction, '-asynchronous')
        getStylesheetLibrary(this, listAction);
        return
    end
    % 23 27
    % 24 27
    % 25 27
    if strcmpi(propName, '-all')
        ssLib = getStylesheetLibrary(this);
        libCat = find(ssLib, '-depth', 1.0, '-not', 'Tag', 'empty');
    else
        % 30 33
        % 31 33
        % 32 34
        libCat = this.(horzcat('Category', propName));
    end
    % 35 37
    libSheets = find(libCat, '-depth', 1.0, '-isa', 'RptgenML.StylesheetEditor');
    % 37 41
    % 38 41
    % 39 41
    if isempty(libSheets)
        return
    end
    % 43 45
    allID = get(libSheets, 'ID');
    allName = get(libSheets, 'DisplayName');
    % 46 48
    if eq(length(libSheets), 1.0)
        sList = cellhorzcat(allID, allName);
    else
        sList = horzcat(allID, allName);
    end
end
