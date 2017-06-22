function v = getViewer(h)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    v = h.Viewer;
    if isempty(v) || not(ishandle(v))
        % 9 10
        v = DAStudio.Explorer(h);
        v.Title = 'Build Info';
        h.Viewer = v;
        v.setTreeTitle('Build Info');
        % 14 15
    end % if
    show(v);
end % function
