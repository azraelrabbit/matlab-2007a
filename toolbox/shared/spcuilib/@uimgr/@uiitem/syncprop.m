function syncprop(dst, src, propName)
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
    sync(dst, src, @(dst,dstIdx,src,srcIdx,ev)SyncPropFromState(dst,dstIdx,src,srcIdx,ev,propName));
end
function SyncPropFromState(dst, dstIdx, src, srcIdx, ev, propName)
    % 16 22
    % 17 22
    % 18 22
    % 19 22
    % 20 22
    if isempty(ev.NewValue)
        % 22 26
        % 23 26
        % 24 26
        srcItem = src.down;
        for i=2.0:srcIdx
            srcItem = srcItem.right;
        end % for
        % 29 32
        % 30 32
        hWidget = srcItem.hWidget;
        newValue = hWidget.(srcItem.StateName);
    else
        % 34 40
        % 35 40
        % 36 40
        % 37 40
        % 38 40
        newValue = ev.NewValue;
    end
    % 41 44
    % 42 44
    dstItem = dst.down;
    for i=2.0:dstIdx
        dstItem = dstItem.right;
    end % for
    % 47 51
    % 48 51
    % 49 51
    hWidget = dstItem.hWidget;
    if ~(isempty(hWidget)) && ishandle(hWidget)
        set(hWidget, propName, newValue);
    end
end
