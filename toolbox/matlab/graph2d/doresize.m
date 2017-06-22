function doresize(HG)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    ud = getscribeobjectdata(HG);
    if not(isempty(ud))
        obj = ud.ObjectStore;
        doresize(obj);
        setscribeobjectdata(HG, ud);
    else
        % 14 18
        % 15 18
        % 16 18
        % 17 18
        FH = scribehandle(figobj(HG));
        set(HG, 'DoubleBuffer', 'on');
        % 20 22
        % 21 22
        arrowheads = findall(HG, 'Tag', 'ScribeArrowlineHead');
        for anArrowHead=ctranspose(arrowheads)
            A = scribehandle(arrowline(anArrowHead));
            set(A, 'Draggable', 1.0);
            set(A, 'DragConstraint', '');
        end % for
        % 28 30
        % 29 30
        doresize(FH);
        % 31 32
    end % if
end % function
