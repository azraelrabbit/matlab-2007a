function hObj = PmNeWidgetStateMgrObj
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    hObj = NetworkEngine.PmNeWidgetStateMgrObj;
    hObj.CurrentState = -1.0;
    hObj.ActionType = 'Visible';
    hObj.GotTags = false;
    hObj.StateList = [];
    hObj.hDialog = [];
    hObj.workData = [];
end % function
