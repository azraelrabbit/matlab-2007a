function dlgStruct = getDialogSchema(this, name)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    descPanelContent{1.0} = this.dlgText(xlate('This is the main interface for the Report Generator Stylesheet Editor.  Open an existing stylesheet from the list or create a new one.'), 'WordWrap', true, 'RowSpan', [1.0 1.0], 'ColSpan', [1.0 2.0]);
    % 8 12
    % 9 12
    % 10 12
    % 11 12
    rowCount = 1.0;
    % 13 18
    % 14 18
    % 15 18
    % 16 18
    % 17 18
    ssNew = vertcat(cellhorzcat('-NEW_HTML', xlate('New HTML'), xlate('Custom HTML stylesheet')), cellhorzcat('-NEW_HTML_CHUNKED', xlate('New multi-page HTML'), xlate('Custom multi-page HTML stylesheet')), cellhorzcat('-NEW_FO', xlate('New FO (PDF)'), xlate('Custom Formatting Objects stylesheet for PDF conversions')), cellhorzcat('-NEW_DSSSL', xlate('New DSSSL (RTF)'), xlate('Custom DSSSL stylesheet for RTF conversions')));
    % 19 27
    % 20 27
    % 21 27
    % 22 27
    % 23 27
    % 24 27
    % 25 27
    % 26 27
    stylesheetCount = size(ssNew, 1.0);
    for i=1.0:stylesheetCount
        cbk = horzcat('rpteditstyle(''', ssNew{i, 1.0}, ''');');
        % 30 31
        descPanelContent = vertcat(descPanelContent, vertcat(cellhorzcat(struct('Type', 'pushbutton', 'FilePath', fullfile(matlabroot, 'toolbox/rptgen/resources/Stylesheet.png'), 'MatlabMethod', cbk, 'RowSpan', horzcat(plus(i, 1.0), plus(i, 1.0)), 'ToolTip', ssNew{i, 2.0}, 'ColSpan', [1.0 1.0])), cellhorzcat(struct('Type', 'hyperlink', 'Name', ssNew{i, 2.0}, 'MatlabMethod', cbk, 'ToolTip', ssNew{i, 3.0}, 'RowSpan', horzcat(plus(i, 1.0), plus(i, 1.0)), 'ColSpan', [2.0 2.0]))));
        % 32 45
        % 33 45
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
        % 44 45
    end % for
    % 46 47
    dlgStruct = this.dlgMain(name, vertcat(cellhorzcat(this.dlgContainer(descPanelContent, xlate('Getting Started'), 'RowSpan', [1.0 1.0], 'ColSpan', [1.0 1.0], 'LayoutGrid', horzcat(plus(stylesheetCount, 1.0), 2.0), 'ColStretch', [0.0 1.0])), cellhorzcat(RptgenML.dlgChildContainer(this, xlate('Open Stylesheets'), 'RowSpan', [2.0 2.0], 'ColSpan', [1.0 1.0]))), 'DialogTitle', xlate('Stylesheet Editor'));
    % 48 57
    % 49 57
    % 50 57
    % 51 57
    % 52 57
    % 53 57
    % 54 57
    % 55 57
    % 56 57
end % function
