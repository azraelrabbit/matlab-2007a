function A = resize(A)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    ax = get(A, 'MyHGHandle');
    f = get(A, 'Parent');
    % 10 11
    [hitx, hity] = LHittest(ax, f);
    % 12 13
    if isempty(hitx) || isempty(hity)
        A = doclick(A);
    else
        oldPtr = get(f, 'Pointer');
        oldPos = get(ax, 'Position');
        try
            figObjH = getobj(f);
            dragBinH = figObjH.DragObjects;
            myH = get(A, 'MyHandle');
            for aObjH=dragBinH.Items
                if not(eq(aObjH, myH))
                    set(aObjH, 'IsSelected', 0.0);
                end % if
            end % for
            % 27 28
            hitx = hitx(1.0);
            hity = hity(1.0);
            cursors = {'topl','top','topr';'left','','right';'botl','bottom','botr'};
            % 31 33
            % 32 33
            set(f, 'Pointer', cursors{hity, hitx});
            result = selectmoveresize;
            set(f, 'Pointer', oldPtr);
            val = 1.0;
        catch
            set(ax, 'Position', oldPos);
            set(f, 'Pointer', oldPtr);
        end % try
    end % if
end % function
function [hitx, hity] = LHittest(ax, f)
    % 44 49
    % 45 49
    % 46 49
    % 47 49
    % 48 49
    oldUnits = get(horzcat(ax, f), 'Units');
    set(horzcat(ax, f), 'Units', 'pixels');
    pos = get(ax, 'Position');
    pt = get(f, 'CurrentPoint');
    set(horzcat(ax, f), {'Units'}, oldUnits);
    % 54 55
    x = pt(1.0);
    y = pt(2.0);
    % 57 58
    handlesx = vertcat(horzcat(pos(1.0), minus(plus(pos(1.0), mrdivide(pos(3.0), 2.0)), 3.0), minus(plus(pos(1.0), pos(3.0)), 5.0)), horzcat(plus(pos(1.0), 5.0), plus(plus(pos(1.0), mrdivide(pos(3.0), 2.0)), 3.0), plus(pos(1.0), pos(3.0))));
    % 59 62
    % 60 62
    % 61 62
    handlesy = vertcat(horzcat(minus(plus(pos(2.0), pos(4.0)), 5.0), minus(plus(pos(2.0), mrdivide(pos(4.0), 2.0)), 3.0), pos(2.0)), horzcat(plus(pos(2.0), pos(4.0)), plus(plus(pos(2.0), mrdivide(pos(4.0), 2.0)), 3.0), plus(pos(2.0), 5.0)));
    % 63 66
    % 64 66
    % 65 66
    hitx = find(and(ge(x, handlesx(1.0, :)), le(x, handlesx(2.0, :))));
    hity = find(and(ge(y, handlesy(1.0, :)), le(y, handlesy(2.0, :))));
end % function
