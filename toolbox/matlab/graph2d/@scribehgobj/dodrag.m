function A = dodrag(A)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    figH = gcbf;
    oldFigUnits = get(figH, 'Units');
    oldAxUnits = get(A, 'Units');
    set(figH, 'Units', 'pixels');
    myFigPos = get(figH, 'Position');
    % 14 17
    % 15 17
    set(A, 'Units', 'pixels');
    pos = get(A, 'Position');
    % 18 21
    % 19 21
    pos = dragrect(pos);
    % 21 24
    % 22 24
    screenPtPos = plus(myFigPos(1.0:2.0), get(figH, 'CurrentPoint'));
    % 24 27
    % 25 27
    oldUnits = get(0.0, 'Units');
    set(0.0, 'Units', 'pixels');
    figs = findobj('Type', 'figure', 'Visible', 'on');
    % 29 31
    vOtherFigPos = get(figs, 'Position');
    % 31 34
    % 32 34
    if IsInRect(myFigPos, screenPtPos)
        % 34 36
        A = set(A, 'Position', pos);
    else
        for i=1.0:length(vOtherFigPos)
            if IsInRect(vOtherFigPos{i}, screenPtPos)
                theDropFig = figs(i);
                % 40 44
                % 41 44
                % 42 44
                set(A, 'Parent', figs(i));
                otherpos = vOtherFigPos{i};
                newPos = minus(plus(pos, horzcat(myFigPos(1.0:2.0), 0.0, 0.0)), horzcat(otherpos(1.0:2.0), 0.0, 0.0));
                set(A, 'Position', newPos);
                break
            end % if
        end % for
    end % if
    % 51 57
    % 52 57
    % 53 57
    % 54 57
    % 55 57
    set(figH, 'Units', oldFigUnits);
    set(0.0, 'Units', oldUnits);
    % 58 61
    % 59 61
    A = set(A, 'Units', oldAxUnits);
end % function
function hit = IsInRect(rect, pt)
    % 63 68
    % 64 68
    % 65 68
    % 66 68
    rectBounds = vertcat(rect(1.0:2.0), plus(rect(1.0:2.0), rect(3.0:4.0)));
    % 68 70
    hit = and(ge(pt, rectBounds(1.0, :)), le(pt, rectBounds(2.0, :)));
end % function
