function removeDefn(hUI)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    whichDefns = plus(hUI.mainActiveTab, 1.0);
    currIndex = hUI.Index(whichDefns);
    currDefn = hUI.AllDefns{whichDefns}(plus(currIndex, 1.0));
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    % 13 14
    oldLen = length(hUI.AllDefns{whichDefns});
    if le(oldLen, 1.0)
        errordlg('The entry list must contain at least one item.', 'Custom Storage Class Designer', 'non-modal');
        % 17 18
        return;
    end % if
    % 20 26
    % 21 26
    % 22 26
    % 23 26
    % 24 26
    % 25 26
    found = find(hUI.AllDefns{whichDefns}, 'Name', currDefn.Name);
    isUniq = lt(length(found), 2.0);
    % 28 29
    if isUniq && eq(whichDefns, 2.0)
        % 30 32
        % 31 32
        found = [];
        if not(isempty(hUI.AllDefns{1.0}))
            found = find(hUI.AllDefns{1.0}, 'MemorySection', currDefn.Name);
        end % if
        inUse = gt(length(found), 0.0);
        % 37 38
        if inUse
            errordlg('The entry is still in use by at least one CSC definition. Remove disallowed.', 'Custom Storage Class Designer', 'non-modal');
            % 40 41
            return;
        end % if
    end % if
    % 44 45
    tmpDefns = [];
    for i=1.0:oldLen
        if ne(i, plus(currIndex, 1.0))
            tmpDefns = vertcat(tmpDefns, hUI.AllDefns{whichDefns}(i));
        end % if
    end % for
    % 51 52
    hUI.AllDefns{whichDefns} = tmpDefns;
    % 53 54
    newLen = length(hUI.AllDefns{whichDefns});
    if gt(currIndex, 0.0) && gt(currIndex, minus(newLen, 1.0))
        hUI.setIndex(minus(currIndex, 1.0));
    end % if
    % 58 60
    % 59 60
    hUI.IsDirty = true;
end % function
