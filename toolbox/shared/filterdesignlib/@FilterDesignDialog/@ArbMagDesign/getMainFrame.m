function mainFrame = getMainFrame(this)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    header = getHeaderFrame(this);
    header.RowSpan = [1.0 1.0];
    header.ColSpan = [1.0 1.0];
    % 10 12
    filtresp = getFilterRespFrame(this);
    filtresp.RowSpan = [2.0 2.0];
    filtresp.ColSpan = [1.0 1.0];
    % 14 16
    design = getDesignMethodFrame(this);
    design.RowSpan = [3.0 3.0];
    design.ColSpan = [1.0 1.0];
    % 18 20
    mainFrame.Type = 'panel';
    mainFrame.Items = cellhorzcat(header, filtresp, design);
    mainFrame.LayoutGrid = [5.0 1.0];
    mainFrame.RowStretch = [0.0 0.0 0.0 0.0 3.0];
    mainFrame.Tag = 'Main';
end
function headerFrame = getHeaderFrame(this)
    % 26 30
    % 27 30
    % 28 30
    [irtype_lbl, irtype] = getWidgetSchema(this, 'ImpulseResponse', 'Impulse response:', 'combobox', 1.0, 1.0);
    % 30 32
    irtype.Entries = {'FIR','IIR'};
    irtype.DialogRefresh = true;
    % 33 35
    [order_lbl, order] = getWidgetSchema(this, 'Order', 'Order: ', 'edit', 2.0, 1.0);
    % 35 37
    dorder_lbl.Name = 'Denominator order';
    dorder_lbl.Type = 'checkbox';
    dorder_lbl.Source = this;
    dorder_lbl.Mode = true;
    dorder_lbl.DialogRefresh = true;
    dorder_lbl.RowSpan = [3.0 3.0];
    dorder_lbl.ColSpan = [1.0 1.0];
    dorder_lbl.Enabled = this.Enabled;
    dorder_lbl.Tag = 'SpecifyDenominator';
    % 45 47
    if strcmpi(this.ImpulseResponse, 'iir')
        dorder_lbl.ObjectProperty = 'SpecifyDenominator';
    else
        dorder_lbl.Enabled = false;
    end
    % 51 53
    dorder.Type = 'edit';
    dorder.Source = this;
    dorder.Mode = true;
    dorder.DialogRefresh = true;
    dorder.RowSpan = [3.0 3.0];
    dorder.ColSpan = [2.0 2.0];
    dorder.Enabled = this.Enabled;
    dorder.Tag = 'DenominatorOrder';
    % 60 62
    if this.SpecifyDenominator && strcmpi(this.ImpulseResponse, 'iir')
        dorder.ObjectProperty = 'DenominatorOrder';
    else
        dorder.Enabled = false;
    end
    % 66 68
    ftype_widgets = getFilterTypeWidgets(this, 4.0);
    % 68 70
    headerFrame.Type = 'group';
    headerFrame.Name = 'Filter specifications';
    headerFrame.Items = cellhorzcat(irtype_lbl, irtype, order_lbl, order, dorder_lbl, dorder, ftype_widgets{:});
    % 72 74
    headerFrame.LayoutGrid = [5.0 4.0];
    headerFrame.ColStretch = [0.0 1.0 0.0 1.0];
    headerFrame.Tag = 'FilterSpecsGroup';
end
function filtresp = getFilterRespFrame(this)
    % 78 81
    % 79 81
    [nbands_lbl, nbands] = getWidgetSchema(this, 'NumberOfBands', 'Number of bands: ', 'combobox', 1.0, 1.0);
    % 81 83
    nbands.Entries = {'1','2','3','4','5','6','7','8','9','10'};
    nbands.DialogRefresh = true;
    % 84 86
    if ~(this.isfir) && ~(strcmpi(this.ResponseType, 'amplitudes'))
        % 86 88
        nbands_lbl.Enabled = false;
        nbands.Enabled = false;
    end
    % 90 92
    [response_lbl, response] = getWidgetSchema(this, 'ResponseType', 'Specify response as: ', 'combobox', 2.0, 1.0);
    % 92 94
    response.DialogRefresh = true;
    % 94 96
    if ~(this.isfir) && gt(this.NumberOfBands, 0.0)
        % 96 98
        response_lbl.Enabled = false;
        response.Enabled = false;
    end
    % 100 102
    items = cellhorzcat(nbands_lbl, nbands, response_lbl, response);
    % 102 104
    items = getFrequencyUnitsWidgets(this, 3.0, items);
    items{minus(end, 3.0)}.Tunable = false;
    items{minus(end, 2.0)}.Tunable = false;
    items{minus(end, 1.0)}.Tunable = false;
    items{end}.Tunable = false;
    items{end}.DialogRefresh = true;
    % 109 111
    spacer.Type = 'text';
    spacer.Name = ' ';
    spacer.RowSpan = [4.0 4.0];
    spacer.ColSpan = [1.0 4.0];
    % 114 116
    band_label.Type = 'text';
    band_label.Name = 'Band properties';
    band_label.RowSpan = [5.0 5.0];
    band_label.ColSpan = [1.0 4.0];
    % 119 121
    band_table = getBandTable(this);
    band_table.RowSpan = [6.0 6.0];
    band_table.ColSpan = [1.0 4.0];
    % 123 125
    items = cellhorzcat(items{:}, spacer, band_label, band_table);
    % 125 127
    filtresp.Type = 'group';
    filtresp.Name = 'Response specifications';
    filtresp.Items = items;
    filtresp.LayoutGrid = [6.0 4.0];
    filtresp.ColStretch = [0.0 0.0 0.0 4.0];
    filtresp.Tag = 'FilterSpecsGroup';
end
function band_table = getBandTable(this)
    % 134 137
    % 135 137
    nBands = plus(this.NumberOfBands, 1.0);
    switch lower(this.responseType)
    case 'amplitudes'
        colHeaders = cellhorzcat(sprintf('Frequencies'), sprintf('Amplitudes'));
    case 'magnitudes and phases'
        % 141 143
        colHeaders = cellhorzcat(sprintf('Frequencies'), sprintf('Magnitudes'), sprintf('Phases'));
        % 144 146
    case 'frequency response'
        % 145 147
        colHeaders = cellhorzcat(sprintf('Frequencies'), sprintf('Frequency Response'));
        % 147 149
    end
    nCols = length(colHeaders);
    % 150 152
    rowHeaders = cell(1.0, nBands);
    for indx=1.0:nBands
        rowHeaders{indx} = sprintf('%d', indx);
    end % for
    % 155 157
    band_table.Type = 'table';
    band_table.Tag = 'BandTable';
    band_table.Size = horzcat(nBands, nCols);
    band_table.ColHeader = colHeaders;
    band_table.RowHeader = rowHeaders;
    band_table.Grid = true;
    band_table.RowHeaderWidth = 2.0;
    band_table.ColumnCharacterWidth = repmat(mrdivide(36.0, nCols), 1.0, nCols);
    band_table.ValueChangedCallback = @(hdlg,row,col,value)onValueChanged(this,row,col,value);
    % 165 167
    band_table.Editable = this.Enabled;
    band_table.Tunable = true;
    % 168 170
    data = cell(nBands, nCols);
    for indx=1.0:nBands
        data(indx, :) = getTableRowSchema(this.(sprintf('Band%d', indx)), this.ResponseType, indx);
        % 172 174
    end % for
    % 174 176
    band_table.Data = data;
end
function onValueChanged(this, row, col, value)
    % 178 181
    % 179 181
    prop = sprintf('Band%d', plus(row, 1.0));
    % 181 183
    hBand = get(this, prop);
    % 183 185
    switch col
    case 0.0
        set(hBand, 'Frequencies', value);
        updateMethod(this);
    case 1.0
        switch this.ResponseType
        case 'Amplitudes'
            set(hBand, 'Amplitudes', value);
        case 'Magnitudes and phases'
            set(hBand, 'Magnitudes', value);
        case 'Frequency response'
            set(hBand, 'FreqResp', value);
        end
    case 2.0
        set(hBand, 'Phases', value);
    end
end
