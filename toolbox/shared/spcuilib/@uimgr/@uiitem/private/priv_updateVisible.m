function priv_updateVisible(h, val)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    hParent = h.up;
    if isempty(hParent)
        updateVisible(h, val);
    else
        canEnforce = CntSem(1.0);
        updateVisible(h, val);
        if canEnforce
            local_enforceItemSeparators(h, val);
        end
        CntSem(0.0);
    end
end
function local_enforceItemSeparators(h, vis)
    % 19 30
    % 20 30
    % 21 30
    % 22 30
    % 23 30
    % 24 30
    % 25 30
    % 26 30
    % 27 30
    % 28 30
    hParent = h.up;
    if not(isempty(hParent))
        hSibling = hParent.down;
        visIdx = 1.0;
        while not(isempty(hSibling)) && not(isequal(hSibling, h))
            visIdx = plus(visIdx, 1.0);
            hSibling = hSibling.right;
        end % while
        % 37 45
        % 38 45
        % 39 45
        % 40 45
        % 41 45
        % 42 45
        % 43 45
        if strcmpi(vis, 'off')
            visIdx = uminus(visIdx);
        end
        % 47 50
        % 48 50
        enforceItemSeparators(hParent, true, false, visIdx);
    end
end
function y = CntSem(op)
    % 53 69
    % 54 69
    % 55 69
    % 56 69
    % 57 69
    % 58 69
    % 59 69
    % 60 69
    % 61 69
    % 62 69
    % 63 69
    % 64 69
    % 65 69
    % 66 69
    % 67 69
    persistent theCount;
    if isempty(theCount)
        theCount = 0.0;
    end
    % 72 74
    if op
        % 74 76
        y = eq(theCount, 0.0);
        theCount = plus(theCount, 1.0);
    else
        % 78 80
        theCount = minus(theCount, 1.0);
    end
end
