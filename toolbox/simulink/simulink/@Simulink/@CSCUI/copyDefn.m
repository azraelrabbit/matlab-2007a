function copyDefn(hUI)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    whichDefns = plus(hUI.mainActiveTab, 1.0);
    currIndex = hUI.Index(whichDefns);
    currDefn = hUI.AllDefns{whichDefns}(plus(currIndex, 1.0));
    % 8 11
    % 9 11
    copyDefn = LocalCopyObj(currDefn);
    copyDefn.Name = LocalGetCopyName(hUI, whichDefns, currDefn.Name);
    copyDefn.OwnerPackage = hUI.CurrPackage;
    % 13 19
    % 14 19
    % 15 19
    % 16 19
    % 17 19
    tmpDefns = [];
    for i=1.0:length(hUI.AllDefns{whichDefns})
        if eq(i, plus(currIndex, 1.0))
            tmpDefns = vertcat(tmpDefns, hUI.AllDefns{whichDefns}(i), copyDefn);
        else
            tmpDefns = vertcat(tmpDefns, hUI.AllDefns{whichDefns}(i));
        end % if
    end % for
    % 26 28
    if isempty(tmpDefns)
        tmpDefns = copyDefn;
    else
        currIndex = plus(currIndex, 1.0);
    end % if
    % 32 34
    hUI.AllDefns{whichDefns} = tmpDefns;
    hUI.Index(whichDefns) = currIndex;
    % 35 38
    % 36 38
    hUI.IsDirty = true;
end % function
function copyobjs = LocalCopyObj(origobjs)
    % 40 47
    % 41 47
    % 42 47
    % 43 47
    % 44 47
    % 45 47
    copyobjs = [];
    % 47 49
    for i=1.0:length(origobjs)
        orig = origobjs(i);
        hclass = classhandle(orig);
        hprops = hclass.Properties;
        % 52 54
        tmp = copy(orig);
        for p=1.0:length(hprops)
            propname = hprops(p).Name;
            proptype = hprops(p).DataType;
            propval = get(orig, propname);
            % 58 60
            if strcmp(proptype, 'handle')
                tmpsub = LocalCopyObj(propval);
                set(tmp, propname, tmpsub);
            end % if
        end % for
        % 64 66
        copyobjs = vertcat(copyobjs, tmp);
    end % for
end % function
function copyName = LocalGetCopyName(hUI, whichDefns, origName)
    % 69 75
    % 70 75
    % 71 75
    % 72 75
    % 73 75
    existingDefns = hUI.AllDefns{whichDefns};
    existingNames = {};
    if not(isempty(existingDefns))
        tmpStrucAry = existingDefns.get;
        existingNames = cellhorzcat(tmpStrucAry(:).Name);
    end % if
    % 80 82
    tmpstub = origName;
    % 82 84
    countTry = 1.0;
        while true
        copyName = sprintf('%s_%d', tmpstub, countTry);
        countTry = plus(countTry, 1.0);
        if not(ismember(copyName, existingNames))
            break
        end % if
    end % while
end % function
