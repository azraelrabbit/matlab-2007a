function [node, path, status] = pmsl_extracttreenode(tRoot, reqsCell, isKey, map, isLeaf, getNumBranches, getBranch)
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
    node = [];
    path = [];
    status = true;
    % 19 21
    nCells = numel(reqsCell);
    pm_assert(eq(mod(nCells, 2.0), 0.0), 'req list passed does not have even length');
    nReqs = mrdivide(nCells, 2.0);
    % 23 26
    % 24 26
    for idx=1.0:nReqs
        reqKey = reqsCell{minus(mtimes(2.0, idx), 1.0)};
        if isKey(tRoot, reqKey)
            reqValue = reqsCell{mtimes(2.0, idx)};
            if not(isequal(map(tRoot, reqKey), reqValue))
                status = false;
                break
            end
        else
            status = false;
            break
        end
    end % for
    % 38 40
    if status
        % 40 42
        node = tRoot;
        path = [];
    else
        if not(isLeaf(tRoot))
            n = getNumBranches(tRoot);
            for idx=1.0:n
                [node, path, status] = pmsl_extracttreenode(getBranch(tRoot, idx), reqsCell, isKey, map, isLeaf, getNumBranches, getBranch);
                if status
                    % 49 51
                    path = horzcat(idx, path);
                    break
                end
            end % for
        end
    end
end
