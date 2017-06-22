function enforceItemSeparators(h, descend, ignoreRenderedState, visIdx)
    % 1 25
    % 2 25
    % 3 25
    % 4 25
    % 5 25
    % 6 25
    % 7 25
    % 8 25
    % 9 25
    % 10 25
    % 11 25
    % 12 25
    % 13 25
    % 14 25
    % 15 25
    % 16 25
    % 17 25
    % 18 25
    % 19 25
    % 20 25
    % 21 25
    % 22 25
    % 23 25
    if lt(nargin, 2.0)
        descend = false;
    end
    if lt(nargin, 3.0)
        ignoreRenderedState = false;
    end
    % 30 34
    % 31 34
    % 32 34
    setWidgetProp(h, 'Separator');
    % 34 45
    % 35 45
    % 36 45
    % 37 45
    % 38 45
    % 39 45
    % 40 45
    % 41 45
    % 42 45
    % 43 45
    if lt(nargin, 4.0)
        visIdx = 0.0;
    end
    childObjOrder = computeChildOrder(h, ignoreRenderedState, visIdx);
    if isempty(childObjOrder)
        return
    end
    % 51 54
    % 52 54
    set(childObjOrder(1.0), 'isFirstPlace', true);
    set(childObjOrder(2.0:end), 'isFirstPlace', false);
    % 55 58
    % 56 58
    hChildVect = handle([]);
    for theChild=childObjOrder
        % 59 80
        % 60 80
        % 61 80
        % 62 80
        % 63 80
        % 64 80
        % 65 80
        % 66 80
        % 67 80
        % 68 80
        % 69 80
        % 70 80
        % 71 80
        % 72 80
        % 73 80
        % 74 80
        % 75 80
        % 76 80
        % 77 80
        % 78 80
        isRenderableWidget = not(theChild.isGroup) || (not(theChild.SkipSeparatorComp) && not(isempty(theChild.WidgetFcn)));
        % 80 82
        if isRenderableWidget
            % 82 88
            % 83 88
            % 84 88
            % 85 88
            % 86 88
            hChildVect(plus(end, 1.0)) = theChild;
        end
    end % for
    childRenderableNum = numel(hChildVect);
    childNonrenderableNum = minus(numel(childObjOrder), childRenderableNum);
    % 92 111
    % 93 111
    % 94 111
    % 95 111
    % 96 111
    % 97 111
    % 98 111
    % 99 111
    % 100 111
    % 101 111
    % 102 111
    % 103 111
    % 104 111
    % 105 111
    % 106 111
    % 107 111
    % 108 111
    % 109 111
    if gt(childRenderableNum, 0.0)
        % 111 117
        % 112 117
        % 113 117
        % 114 117
        % 115 117
        firstChild = hChildVect(1.0);
        % 117 123
        % 118 123
        % 119 123
        % 120 123
        % 121 123
        if firstChild.isFirstPlace && isInTopGroup(firstChild)
            sFirst = 'off';
        else
            sFirst = 'on';
        end
        % 127 129
        if eq(childNonrenderableNum, 0.0)
            sRest = 'off';
        else
            sRest = 'on';
        end
        set(firstChild, 'Separator', sFirst);
        set(hChildVect(2.0:end), 'Separator', sRest);
        % 135 140
        % 136 140
        % 137 140
        % 138 140
        for theItem=hChildVect
            setWidgetProp(theItem, 'Separator');
        end % for
    end
    % 143 146
    % 144 146
    if descend
        for theChild=childObjOrder
            if theChild.isGroup
                enforceItemSeparators(theChild, descend, ignoreRenderedState);
            end
        end % for
    end
end
