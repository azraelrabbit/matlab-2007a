function mspecs = getMagnitudeSpecsFrame(this)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    if isminorder(this)
        % 8 10
        items = getMagnitudeUnitsWidgets(this, 1.0);
        % 10 12
        items = addConstraint(this, 2.0, 1.0, items, true, 'Apass', 'Apass', 'Passband ripple');
    else
        % 13 16
        % 14 16
        help = {'No magnitude constraints can be specified when specifying ','a filter order. '};
        % 16 18
        help = sprintf('%s', help{:});
        help(end) = [];
        % 19 21
        helptext.Type = 'text';
        helptext.WordWrap = true;
        helptext.Name = help;
        helptext.RowSpan = [1.0 1.0];
        helptext.ColSpan = [1.0 4.0];
        % 25 27
        items = cellhorzcat(helptext);
    end % if
    % 28 30
    mspecs.Name = 'Magnitude specifications';
    mspecs.Type = 'group';
    mspecs.Items = items;
    mspecs.LayoutGrid = [4.0 4.0];
    mspecs.RowStretch = [0.0 0.0 0.0 1.0];
    mspecs.ColStretch = [0.0 1.0 0.0 1.0];
    mspecs.Tag = 'MagSpecsGroup';
end % function
