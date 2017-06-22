function main = getMainFrame(this)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    [order_lbl, order] = getOrderWidgets(this, 1.0, false);
    % 9 12
    % 10 12
    order.Type = 'combobox';
    order.Entries = {'4','6','8','10'};
    order.Editable = true;
    % 14 17
    % 15 17
    [bands_lbl, bands] = getWidgetSchema(this, 'BandsPerOctave', 'Bands per octave: ', 'combobox', 2.0, 1.0);
    % 17 21
    % 18 21
    % 19 21
    bands.Editable = true;
    bands.Entries = {'1','3','6','12','24'};
    bands.DialogRefresh = true;
    bands.Tunable = true;
    bands_lbl.Tunable = true;
    % 25 27
    items = getFrequencyUnitsWidgets(this, 3.0);
    items{2.0}.DialogRefresh = true;
    items{2.0}.Entries = items{2.0}.Entries(2.0:3.0);
    items{4.0}.DialogRefresh = true;
    % 30 33
    % 31 33
    [centerfreq_lbl, centerfreq] = getWidgetSchema(this, 'F0', 'Center frequency: ', 'combobox', 4.0, 1.0);
    % 33 36
    % 34 36
    if isfdtbxinstalled
        % 36 39
        % 37 39
        validFreqs = validfrequencies(getFDesign(this, this));
        entries = cell(1.0, length(validFreqs));
        for indx=1.0:length(validFreqs)
            entries{indx} = num2str(validFreqs(indx), 5.0);
        end % for
    else
        entries = {'1000'};
    end % if
    % 46 49
    % 47 49
    entries = convertfrequnits(entries, 'Hz', this.FrequencyUnits);
    % 49 51
    centerfreq.Editable = true;
    centerfreq.Entries = entries;
    centerfreq.Tunable = true;
    % 53 55
    centerfreq_lbl.Tunable = true;
    % 55 57
    items = cellhorzcat(bands_lbl, bands, order_lbl, order, items{:}, centerfreq_lbl, centerfreq);
    % 57 59
    fspecs.Type = 'group';
    fspecs.Name = 'Filter specifications';
    fspecs.Items = items;
    fspecs.LayoutGrid = [3.0 4.0];
    fspecs.ColStretch = [0.0 1.0 0.0 1.0];
    fspecs.RowSpan = [1.0 1.0];
    fspecs.ColSpan = [1.0 1.0];
    fspecs.Tag = 'MainGroup';
    % 66 68
    design = getDesignMethodFrame(this);
    design.RowSpan = [2.0 2.0];
    design.ColSpan = [1.0 1.0];
    % 70 72
    main.Type = 'panel';
    main.Items = cellhorzcat(fspecs, design);
end % function
