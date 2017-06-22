function hObj = PmWidgetStateMgrObj
    % 1 5
    % 2 5
    % 3 5
    % 4 5
    hObj = PMDialogs.PmWidgetStateMgrObj;
    hObj.CurrentState = -1.0;
    hObj.ActionType = 'Visible';
    hObj.GotTags = false;
    hObj.StateList = [];
    hObj.hDialog = [];
    hObj.workData = [];
end % function
