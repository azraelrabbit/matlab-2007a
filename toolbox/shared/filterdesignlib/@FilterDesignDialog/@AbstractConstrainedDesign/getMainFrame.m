function main = getMainFrame(this)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    header = getHeaderFrame(this);
    header.RowSpan = [1.0 1.0];
    header.ColSpan = [1.0 1.0];
    % 11 13
    fspecs = getFrequencySpecsFrame(this);
    fspecs.RowSpan = [2.0 2.0];
    fspecs.ColSpan = [1.0 1.0];
    % 15 17
    mspecs = getMagnitudeSpecsFrame(this);
    mspecs.RowSpan = [3.0 3.0];
    mspecs.ColSpan = [1.0 1.0];
    % 19 21
    design = getDesignMethodFrame(this);
    design.RowSpan = [4.0 4.0];
    design.ColSpan = [1.0 1.0];
    % 23 25
    main.Type = 'panel';
    main.Items = cellhorzcat(header, fspecs, mspecs, design);
    main.LayoutGrid = [5.0 1.0];
    main.RowStretch = [0.0 0.0 0.0 0.0 3.0];
    main.Tag = 'MainPanel';
end % function
