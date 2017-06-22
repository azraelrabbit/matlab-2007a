function h = makeTempCanvas
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    hTag = 'RPTGEN_TEMP_CANVAS';
    % 9 12
    % 10 12
    % 11 12
    h = findall(0.0, 'type', 'figure', 'tag', hTag);
    if isempty(h)
        h = figure('HandleVisibility', 'off', 'IntegerHandle', 'off', 'Tag', hTag, 'Visible', 'off', 'Color', 'none', 'CloseRequestFcn', 'set(gcbf,''Visible'',''off'')', 'NumberTitle', 'off', 'Name', 'Report Generator Temporary Drawing Canvas');
    else
        % 16 22
        % 17 22
        % 18 22
        % 19 22
        % 20 22
        % 21 22
        % 22 23
        h = h(1.0);
        delete(allchild(h));
        set(h, 'Color', 'none');
    end % if
end % function
