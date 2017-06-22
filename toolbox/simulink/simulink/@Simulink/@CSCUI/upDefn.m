function upDefn(hUI)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    whichDefns = plus(hUI.mainActiveTab, 1.0);
    currIndex = hUI.Index(whichDefns);
    % 7 9
    if eq(currIndex, 0.0)
        return;
    end % if
    % 11 13
    tmpDefns = [];
    for i=1.0:length(hUI.AllDefns{whichDefns})
        if eq(i, currIndex)
            tmp = hUI.AllDefns{whichDefns}(i);
        else
            if eq(i, plus(currIndex, 1.0))
                tmpDefns = vertcat(tmpDefns, hUI.AllDefns{whichDefns}(i), tmp);
            else
                tmpDefns = vertcat(tmpDefns, hUI.AllDefns{whichDefns}(i));
            end % if
        end % if
    end % for
    hUI.AllDefns{whichDefns} = tmpDefns;
    hUI.setIndex(minus(currIndex, 1.0));
    % 26 28
    hUI.IsDirty = true;
end % function
