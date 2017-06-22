function inst = Find(idx)
    % 1 17
    % 2 17
    % 3 17
    % 4 17
    % 5 17
    % 6 17
    % 7 17
    % 8 17
    % 9 17
    % 10 17
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    if lt(nargin, 1.0)
        idx = [];
    end % if
    shh = 'ShowHiddenHandles';
    shhState = get(0.0, shh);
    set(0.0, shh, 'on');
    inst = getInstances(getOpenMPlayers, idx);
    set(0.0, shh, shhState);
end % function
function h = getOpenMPlayers
    % 26 28
    h = [];
    % 28 31
    % 29 31
    allMPlayFigs = findobj('type', 'figure', 'tag', 'MPlay');
    % 31 34
    % 32 34
    for i=1.0:numel(allMPlayFigs)
        % 34 36
        m = get(allMPlayFigs(i), 'UserData');
        if eq(i, 1.0)
            h = m;
        else
            h(i) = m;
        end % if
    end % for
end % function
function y = getInstances(allObj, userIdx)
    % 44 50
    % 45 50
    % 46 50
    % 47 50
    % 48 50
    if isempty(userIdx)
        % 50 52
        y = allObj;
        return;
    end % if
    % 54 56
    if eq(userIdx, 0.0)
        % 56 58
        y = [];
        % 58 61
        % 59 61
        figFocus = get(0.0, 'CurrentFigure');
        if isempty(figFocus)
            return;
        end % if
        % 64 66
        for i=1.0:numel(allObj)
            if eq(figFocus, allObj(i).widgetsObj.hfig)
                y = allObj(i);
                break
            end % if
        end % for
        return;
    end % if
    % 73 78
    % 74 78
    % 75 78
    % 76 78
    for i=1.0:numel(allObj)
        allInst(i) = allObj(i).instance;
    end % for
    % 80 82
    for i=1.0:numel(userIdx)
        j = find(eq(userIdx(i), allInst));
        if isempty(j)
            error('Specified instance index not found');
        end % if
        iFind(i) = j;
    end % for
    y = allObj(iFind);
end % function
