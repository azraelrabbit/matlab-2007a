function list = getPropList(h, filterName)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    switch filterName
    case 'all'
        list = {'Name';'Tag';'Description';'Type';'Parent';'Handle';'HiliteAncestors';'RequirementInfo';'Position';'HorizontalAlignment';'VerticalAlignment';'ForegroundColor';'BackgroundColor';'Text';'DropShadow';'TeXMode';'FontName';'FontSize';'FontWeight';'FontAngle';'Selected';'ClickFcn';'LoadFcn';'DeleteFcn';'UseDisplayTextAsClickCallback';'UserData'};
        % 10 37
        % 11 37
        % 12 37
        % 13 37
        % 14 37
        % 15 37
        % 16 37
        % 17 37
        % 18 37
        % 19 37
        % 20 37
        % 21 37
        % 22 37
        % 23 37
        % 24 37
        % 25 37
        % 26 37
        % 27 37
        % 28 37
        % 29 37
        % 30 37
        % 31 37
        % 32 37
        % 33 37
        % 34 37
        % 35 37
    case 'main'
        % 36 38
        list = {'Description';'Parent';'Text';'ClickFcn'};
        % 39 44
        % 40 44
        % 41 44
        % 42 44
    case 'callback'
        % 43 45
        list = {'ClickFcn';'LoadFcn';'DeleteFcn';'UseDisplayTextAsClickCallback'};
    otherwise
        % 46 51
        % 47 51
        % 48 51
        % 49 51
        % 50 52
        list = {};
    end % switch
