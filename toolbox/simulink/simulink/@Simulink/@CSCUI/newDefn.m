function newDefn(hUI)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    whichDefns = plus(hUI.mainActiveTab, 1.0);
    currIndex = hUI.Index(whichDefns);
    % 7 10
    % 8 10
    switch whichDefns
    case 1.0
        newDefn = Simulink.CSCDefn;
        newType = 'CSC';
    case 2.0
        % 14 16
        newDefn = Simulink.MemorySectionDefn;
        newType = 'MemorySection';
    end % switch
    % 18 20
    newDefn.Name = LocalGetNewName(hUI, whichDefns);
    newDefn.OwnerPackage = hUI.CurrPackage;
    % 21 23
    if eq(whichDefns, 1.0)
        currMSDefn = getCurrMSDefn(hUI);
        if not(isempty(currMSDefn))
            newDefn.MemorySection = currMSDefn.Name;
        else
            newDefn.MemorySection = '(empty)';
        end % if
    end % if
    % 30 36
    % 31 36
    % 32 36
    % 33 36
    % 34 36
    tmpDefns = [];
    for i=1.0:length(hUI.AllDefns{whichDefns})
        if eq(i, plus(currIndex, 1.0))
            tmpDefns = vertcat(tmpDefns, hUI.AllDefns{whichDefns}(i), newDefn);
        else
            tmpDefns = vertcat(tmpDefns, hUI.AllDefns{whichDefns}(i));
        end % if
    end % for
    % 43 45
    if isempty(tmpDefns)
        tmpDefns = newDefn;
    else
        currIndex = plus(currIndex, 1.0);
    end % if
    % 49 51
    hUI.AllDefns{whichDefns} = tmpDefns;
    hUI.Index(whichDefns) = currIndex;
    % 52 55
    % 53 55
    hUI.IsDirty = true;
end % function
function newName = LocalGetNewName(hUI, whichDefns)
    % 57 63
    % 58 63
    % 59 63
    % 60 63
    % 61 63
    existingDefns = hUI.AllDefns{whichDefns};
    existingNames = {};
    if not(isempty(existingDefns))
        tmpStrucAry = existingDefns.get;
        existingNames = cellhorzcat(tmpStrucAry(:).Name);
    end % if
    % 68 70
    switch whichDefns
    case 1.0
        tmpstub = 'NewCSC';
    case 2.0
        % 73 75
        tmpstub = 'NewMS';
    end % switch
    % 76 78
    countTry = 1.0;
        while true
        newName = sprintf('%s_%d', tmpstub, countTry);
        countTry = plus(countTry, 1.0);
        if not(ismember(newName, existingNames))
            break
        end % if
    end % while
end % function
