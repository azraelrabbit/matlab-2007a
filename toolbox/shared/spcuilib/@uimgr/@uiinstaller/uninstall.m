function uninstall(hInstall, hTarget)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    if not(isempty(hInstall))
        % 8 11
        % 9 11
        validate(hInstall, hTarget);
        deleteFromTarget(hInstall, hTarget);
    end % if
end % function
function deleteFromTarget(hInstall, hTarget)
    % 15 19
    % 16 19
    % 17 19
    numNodes = size(hInstall.Plan, 1.0);
    for i=1.0:numNodes
        srcNode = hInstall.Plan{i, 1.0};
        tgtAddr = hInstall.Plan{i, 2.0};
        % 22 35
        % 23 35
        % 24 35
        % 25 35
        % 26 35
        % 27 35
        % 28 35
        % 29 35
        % 30 35
        % 31 35
        % 32 35
        % 33 35
        targetPath = horzcat(tgtAddr, '/', getFirstPathName(srcNode));
        targetNode = findchild(hTarget, targetPath);
        if isempty(targetNode)
            error('uimgr:uiinstaller:SourceNotFound', 'Failed to find installer path "%s"\nin target application.', targetPath);
            % 38 41
            % 39 41
        end % if
        remove(targetNode);
    end % for
end % function
function first = getFirstPathName(node)
    % 45 50
    % 46 50
    % 47 50
    % 48 50
    p = getPath(node);
    idx = find(eq(p, '/'));
    if isempty(idx)
        first = p;
    else
        % 54 56
        first = p(1.0:minus(idx(1.0), 1.0));
    end % if
end % function
