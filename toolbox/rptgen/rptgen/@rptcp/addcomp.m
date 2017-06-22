function addedPointers = addcomp(currSelect, toAdd, leaveInPlace)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if lt(nargin, 3.0)
        leaveInPlace = logical(0);
    end
    % 9 13
    % 10 13
    % 11 13
    addList = LocAddList(toAdd);
    % 13 15
    % 14 16
    if (gt(numsubcomps(currSelect), 0.0)) | (isa(currSelect, 'coutline'))
        % 16 19
        % 17 19
        addedPointers = LocAdd(double(currSelect), addList, leaveInPlace);
    else
        parentIndex = double(getparent(currSelect));
        oldChildren = get(parentIndex, 'children');
        AddUnderLoc = rank(currSelect);
        % 23 25
        addedPointers = LocAdd(double(parentIndex), addList, leaveInPlace);
        % 25 27
        set(parentIndex, 'Children', vertcat(oldChildren(1.0:AddUnderLoc), horzcat(addedPointers.h), oldChildren(plus(AddUnderLoc, 1.0):end)));
        % 27 31
        % 28 31
        % 29 31
    end
end
function children = LocAdd(parent, children, isCopy)
    % 33 36
    % 34 36
    if isCopy
        children = copyobj(children, parent);
        children = validate(rptcp(children));
    else
        set(children, 'Parent', parent);
        children = rptcp(children);
    end
end
function addList = LocAddList(toAdd)
    % 44 51
    % 45 51
    % 46 51
    % 47 51
    % 48 51
    % 49 51
    if isa(toAdd, 'rptcp')
        addList = toAdd.h;
    else
        if isa(toAdd, 'cell')
            addList = [];
            for i=1.0:length(toAdd)
                addList = horzcat(addList, LocAddList(toAdd{i}));
            end % for
        else
            if ishandle(toAdd)
                addList = toAdd;
            else
                addList = [];
            end
        end
    end
    alSize = size(addList);
    if gt(alSize(2.0), alSize(1.0))
        addList = ctranspose(addList);
    end
end
