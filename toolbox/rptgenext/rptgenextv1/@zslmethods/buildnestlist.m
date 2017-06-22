function nl = buildnestlist(m, currSys, isPeers, childDepth, parentDepth)
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    entry = struct('Name', currSys, 'Children', [], 'isCurrent', logical(1));
    % 14 17
    % 15 17
    entry = LocAddChildren(entry, 1.0, childDepth);
    if isPeers
        withPeers = LocAddPeers(entry);
    else
        withPeers = entry;
    end
    nl = LocAddParents(withPeers, entry, 1.0, parentDepth);
end
function entry = LocAddChildren(entry, currDepth, maxDepth)
    % 25 28
    % 26 28
    if le(currDepth, maxDepth)
        childList = LocGetChild(entry(1.0).Name);
        entry.Children = struct('Name', childList, 'Children', [], 'isCurrent', logical(0));
        % 30 32
        for i=1.0:length(entry.Children)
            entry.Children(i) = LocAddChildren(entry.Children(i), plus(currDepth, 1.0), maxDepth);
            % 33 35
        end % for
    end
end
function entryOut = LocAddPeers(entryIn)
    % 38 41
    % 39 41
    parentSys = get_param(entryIn(1.0).Name, 'Parent');
    % 41 43
    if not(isempty(parentSys))
        peerList = LocGetChild(parentSys);
        % 44 46
        currIndex = find(strcmp(peerList, entryIn(1.0).Name));
        currIndex = currIndex(1.0);
        % 47 49
        entryOut = struct('Name', peerList, 'Children', [], 'isCurrent', logical(0));
        % 49 52
        % 50 52
        entryOut(currIndex) = entryIn;
    else
        entryOut = entryIn;
    end
end
function parent = LocAddParents(peers, current, currDepth, maxDepth)
    % 57 60
    % 58 60
    parent = peers;
    if le(currDepth, maxDepth)
        parentSys = get_param(current(1.0).Name, 'Parent');
        if not(isempty(parentSys))
            parent = struct('Name', parentSys, 'Children', peers, 'isCurrent', logical(0));
            % 64 67
            % 65 67
            parent = LocAddParents(parent, parent, plus(currDepth, 1.0), maxDepth);
        end
    end
end
function childList = LocGetChild(parentSys)
    % 71 75
    % 72 75
    % 73 75
    childList = find_system(parentSys, 'SearchDepth', 1.0, 'BlockType', 'SubSystem');
    % 75 79
    % 76 79
    % 77 79
    parentLoc = find(strcmp(childList, parentSys));
    if not(isempty(parentLoc))
        childList = cellhorzcat(childList{1.0:minus(parentLoc, 1.0)}, childList{plus(parentLoc, 1.0):end});
        % 81 83
    end
end
