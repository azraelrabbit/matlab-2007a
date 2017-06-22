function newA = copyobj(A, HGParent)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    try
        newA = A;
        newA.editline = copyobj(newA.editline, HGParent);
        newA.fullline = get(newA, 'MyHGHandle');
        % 12 13
        C = copyobj(horzcat(A.arrowhead, A.line), HGParent);
        newA.arrowhead = C(1.0);
        newA.line = C(2.0);
        % 16 17
        newUIContextMenu = get(newA.fullline, 'UIContextMenu');
        set(horzcat(newA.arrowhead, newA.line), 'UIContextMenu', newUIContextMenu);
        % 19 21
        % 20 21
        ad = getappdata(A.arrowhead, 'ScribeArrowData');
        ad{1.0} = newA.line;
        ad{4.0} = newA.fullline;
        setappdata(newA.arrowhead, 'ScribeArrowData', ad);
        setappdata(newA.arrowhead, 'ScribeButtonDownHGObj', newA.fullline);
        setappdata(newA.line, 'ScribeButtonDownHGObj', newA.fullline);
        set(horzcat(newA.arrowhead, newA.line, newA.fullline), 'UserData', sprintf('%d', newA.fullline));
    catch
        % 29 30
        error('error copying arrowline')
    end % try
end % function
