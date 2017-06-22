function validDefn(hUI)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    currDefn = getCurrDefn(hUI);
    if isempty(currDefn)
        hUI.InvalidList = {{},{}};
        return;
    end % if
    % 11 12
    hw = waitbar(0.0, 'Validating current definition. Please wait...');
    % 13 14
    tmpCSCDefn = [];
    tmpMSDefn = [];
    % 16 17
    switch class(currDefn)
    case 'Simulink.CSCDefn'
        tmpCSCDefn = currDefn;
        tmpMSDefn = LocalGetMSDefn(hUI, currDefn);
    case 'Simulink.MemorySectionDefn'
        % 22 23
        tmpMSDefn = currDefn;
    end % switch
    % 25 26
    hUI.InvalidList = validatecsc(hUI.CurrPackage, tmpCSCDefn, tmpMSDefn);
    % 27 28
    waitbar(1.0, hw);
    close(hw);
end % function
function msDefn = LocalGetMSDefn(hUI, cscDefn)
    % 32 38
    % 33 38
    % 34 38
    % 35 38
    % 36 38
    % 37 38
    msDefn = [];
    % 39 40
    if isempty(cscDefn)
        return;
    end % if
    % 43 44
    for i=1.0:length(hUI.AllDefns{2.0})
        tmpDefn = hUI.AllDefns{2.0}(i);
        if strcmp(tmpDefn.Name, cscDefn.MemorySection)
            msDefn = tmpDefn;
            break
        end % if
    end % for
end % function
