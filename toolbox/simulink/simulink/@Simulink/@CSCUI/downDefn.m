function downDefn(hUI)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    whichDefns = plus(hUI.mainActiveTab, 1.0);
    currIndex = hUI.Index(whichDefns);
    % 7 9
    if eq(currIndex, minus(length(hUI.AllDefns{whichDefns}), 1.0))
        return;
    end % if
    % 11 13
    tmpDefns = [];
    for i=1.0:length(hUI.AllDefns{whichDefns})
        if eq(i, plus(currIndex, 1.0))
            tmp = hUI.AllDefns{whichDefns}(i);
        else
            if eq(i, plus(currIndex, 2.0))
                tmpDefns = vertcat(tmpDefns, hUI.AllDefns{whichDefns}(i), tmp);
            else
                tmpDefns = vertcat(tmpDefns, hUI.AllDefns{whichDefns}(i));
            end % if
        end % if
    end % for
    hUI.AllDefns{whichDefns} = tmpDefns;
    hUI.setIndex(plus(currIndex, 1.0));
    % 26 28
    hUI.IsDirty = true;
end % function
