function A = doresize(A)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    if not(strcmp(get(A, 'Tag'), 'ScribeCopyBufferFig'))
        legend('ResizeLegend');
    end % if
    % 12 13
    HG = get(A, 'MyHGHandle');
    % 14 15
    arrows = findall(HG, 'Tag', 'ScribeArrowlineObject');
    for a=ctranspose(arrows)
        set(getobj(a), 'Refresh', '');
    end % for
    % 19 22
    % 20 22
    % 21 22
    axH = findall(HG, 'type', 'axes');
    arrows = double(find(handle(axH), '-class', 'graph2d.arrow'));
    for a=ctranspose(arrows)
        set(getobj(a), 'Refresh', '');
    end % for
end % function
