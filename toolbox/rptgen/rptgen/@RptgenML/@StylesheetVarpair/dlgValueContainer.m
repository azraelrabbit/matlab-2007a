function dlgStruct = dlgValueContainer(this, varargin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if isLibrary(this)
        % 7 9
        globalEnable = 0.0;
    else
        % 10 12
        globalEnable = 1.0;
    end
    % 13 15
    pValue = 'Varvalue';
    optBoolean = {'#t';'#f'};
    % 16 20
    % 17 20
    % 18 20
    if any(strcmp(optBoolean, this.(pValue)))
        pValue = struct(findprop(this, pValue));
        pValue.DataType = horzcat(optBoolean, vertcat(cellhorzcat(xlate('true (#t)')), cellhorzcat(xlate('false (#f)'))));
        % 22 26
        % 23 26
        % 24 26
    end
    % 26 28
    idStr = horzcat(this.Varname, ' - ', this.DescriptionShort);
    % 28 30
    dlgStruct = this.dlgContainer(vertcat(cellhorzcat(this.dlgText(idStr, 'WordWrap', 1.0, 'ColSpan', [1.0 2.0], 'RowSpan', [1.0 1.0])), cellhorzcat(this.dlgWidget('Varname', 'Visible', false, 'ColSpan', [1.0 2.0], 'RowSpan', [2.0 2.0], 'Enabled', globalEnable)), cellhorzcat(this.dlgWidget(pValue, 'ColSpan', [1.0 2.0], 'RowSpan', [3.0 3.0], 'DialogRefresh', 1.0, 'Enabled', globalEnable))), xlate('Value'), 'LayoutGrid', [4.0 2.0], 'RowStretch', [0.0 0.0 0.0 1.0], 'ColStretch', [1.0 0.0], varargin{:});
    % 30 47
    % 31 47
    % 32 47
    % 33 47
    % 34 47
    % 35 47
    % 36 47
    % 37 47
    % 38 47
    % 39 47
    % 40 47
    % 41 47
    % 42 47
    % 43 47
    % 44 47
    % 45 47
end
