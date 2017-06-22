function pList = getPropList(h, filterName)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    switch filterName
    case 'main'
        pList = {'Children';'FileName';'Name';'Tag'};
        % 10 15
        % 11 15
        % 12 15
        % 13 15
    case 'all'
        % 14 16
        objH = h.getTestObject;
        pList = fieldnames(get(objH));
    case 'gui'
        pList = {'BusyAction';'IntegerHandle';'MenuBar';'NumberTitle';'Resize';'Tag';'UserData';'WindowButtonDownFcn';'ButtonDownFcn';'CloseRequestFcn';'WindowButtonMotionFcn';'WindowButtonUpFcn';'WindowStyle'};
        % 20 34
        % 21 34
        % 22 34
        % 23 34
        % 24 34
        % 25 34
        % 26 34
        % 27 34
        % 28 34
        % 29 34
        % 30 34
        % 31 34
        % 32 34
    case 'print'
        % 33 35
        pList = {'PaperOrientation';'PaperPosition';'PaperPositionMode';'PaperSize';'PaperType';'PaperUnits';'InvertHardcopy'};
    otherwise
        % 36 44
        % 37 44
        % 38 44
        % 39 44
        % 40 44
        % 41 44
        % 42 44
        % 43 45
        pList = {};
    end % switch
