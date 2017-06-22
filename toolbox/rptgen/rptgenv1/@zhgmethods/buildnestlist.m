function nl = buildnestlist(m, currSys, isPeers, childDepth, parentDepth)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    entry = struct('Name', currSys, 'Children', [], 'isCurrent', logical(1));
    % 7 10
    % 8 10
    entry = LocAddChildren(entry, 1.0, childDepth);
    if isPeers
        withPeers = LocAddPeers(entry);
    else
        withPeers = entry;
    end
    nl = LocAddParents(withPeers, entry, 1.0, parentDepth);
end
function entry = LocAddChildren(entry, currDepth, maxDepth)
    % 18 21
    % 19 21
    if le(currDepth, maxDepth)
        childList = LocGetChild(entry(1.0).Name);
        entry.Children = struct('Name', childList, 'Children', [], 'isCurrent', logical(0));
        % 23 25
        for i=1.0:length(entry.Children)
            entry.Children(i) = LocAddChildren(entry.Children(i), plus(currDepth, 1.0), maxDepth);
            % 26 28
        end % for
    end
end
function entryOut = LocAddPeers(entryIn)
    % 31 34
    % 32 34
    parentSys = get_param(entryIn(1.0).Name, 'Parent');
    % 34 36
    if not(isempty(parentSys))
        peerList = LocGetChild(parentSys);
        % 37 39
        currIndex = find(strcmp(peerList, entryIn(1.0).Name));
        currIndex = currIndex(1.0);
        % 40 42
        entryOut = struct('Name', peerList, 'Children', [], 'isCurrent', logical(0));
        % 42 45
        % 43 45
        entryOut(currIndex) = entryIn;
    else
        entryOut = entryIn;
    end
end
function parent = LocAddParents(peers, current, currDepth, maxDepth)
    % 50 53
    % 51 53
    parent = peers;
    if le(currDepth, maxDepth)
        parentSys = get_param(current(1.0).Name, 'Parent');
        if not(isempty(parentSys))
            parent = struct('Name', parentSys, 'Children', peers, 'isCurrent', logical(0));
            % 57 60
            % 58 60
            parent = LocAddParents(parent, parent, plus(currDepth, 1.0), maxDepth);
        end
    end
end
function childList = LocGetChild(parentSys)
    % 64 68
    % 65 68
    % 66 68
    childList = find_system(parentSys, 'SearchDepth', 1.0, 'BlockType', 'SubSystem');
    % 68 72
    % 69 72
    % 70 72
    parentLoc = find(strcmp(childList, parentSys));
    if not(isempty(parentLoc))
        childList = cellhorzcat(childList{1.0:minus(parentLoc, 1.0)}, childList{plus(parentLoc, 1.0):end});
        % 74 76
    end
end
