function hObj = PmMechVectorCoordSys(varargin)
    % 1 28
    % 2 28
    % 3 28
    % 4 28
    % 5 28
    % 6 28
    % 7 28
    % 8 28
    % 9 28
    % 10 28
    % 11 28
    % 12 28
    % 13 28
    % 14 28
    % 15 28
    % 16 28
    % 17 28
    % 18 28
    % 19 28
    % 20 28
    % 21 28
    % 22 28
    % 23 28
    % 24 28
    % 25 28
    % 26 28
    % 27 28
    hObj = MECH.PmMechVectorCoordSys;
    hObj.CreateInstanceFcn = PMDialogs.PmCreateInstance;
    % 30 31
    if ne(nargin, 0.0) && ne(nargin, 8.0)
        error(xlate('Wrong number of input arguments (need 0 or 7 arguments)'));
    end % if
    % 34 35
    if ishandle(varargin{1.0})
        hObj.BlockHandle = varargin{1.0};
    else
        error(xlate('Expecting handle for first argument.'));
    end % if
    % 40 41
    hObj.Label = varargin{2.0};
    hObj.LabelAttrb = int32(varargin{3.0});
    eBoxLabel = varargin{4.0};
    eBoxParamName = varargin{5.0};
    csLabel = varargin{6.0};
    csParamName = varargin{7.0};
    csItems = varargin{8.0};
    % 48 49
    csChoices = {};
    switch csItems
    case 0.0
        csChoices = cellhorzcat(xlate('World'), xlate('Base'), xlate('Follower'));
    case 1.0
        csChoices = cellhorzcat(xlate('World'), xlate('Base'));
    case 2.0
        csChoices = cellhorzcat(xlate('World'), xlate('Follower'));
    end % switch
    % 58 60
    % 59 60
    subAttrib = 0.0;
    % 61 62
    switch hObj.LabelAttrb
    case 0.0
        subAttrib = 0.0;
    case 1.0
        subAttrib = 0.0;
    case 2.0
        subAttrib = 0.0;
    case 3.0
        subAttrib = 2.0;
    case 4.0
        subAttrib = 2.0;
    end % switch
    % 74 75
    hPosEdit = PMDialogs.PmEditBox(hObj.BlockHandle, eBoxLabel, eBoxParamName, subAttrib);
    hCsSelect = PMDialogs.PmDropDown(hObj.BlockHandle, csLabel, csParamName, csChoices, subAttrib);
    hObj.Items = horzcat(hPosEdit, hCsSelect);
end % function
