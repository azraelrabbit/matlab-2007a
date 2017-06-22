function [allOnIdx, v] = findOnItems(h)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    v_requested = gt(nargout, 1.0);
    if v_requested
        v = {};
    end % if
    allOnIdx = [];
    i = 1.0;
    hChild = h.down;
        while not(isempty(hChild))
        theWidget = hChild.hWidget;
        if ishandle(theWidget)
            val = get(theWidget, hChild.StateName);
            if strcmp(val, 'on')
                allOnIdx(plus(end, 1.0)) = i;
            end % if
            if v_requested
                v{plus(end, 1.0)} = val;
            end % if
        end % if
        hChild = hChild.right;
        i = plus(i, 1.0);
    end % while
end % function
