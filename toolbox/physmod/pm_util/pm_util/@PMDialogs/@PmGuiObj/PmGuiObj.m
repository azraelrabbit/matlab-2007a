function hObj = PmGuiObj
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    hObj = PMDialogs.PmGuiObj;
    hObj.Name = 'DefaultName';
    hObj.assignObjId();
    hObj.CreateInstanceFcn = PMDialogs.PmCreateInstance;
end % function
