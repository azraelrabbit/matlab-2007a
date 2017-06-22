function dlgStruct = getDialogSchema(this, name)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if not(builtin('license', 'checkout', 'MATLAB_Report_Gen'))
        dlgStruct = this.buildErrorMessage(name, true);
        return;
    end % if
    % 10 12
    if iscellstr(this.Source)
        p = struct(findprop(classhandle(this), 'Source'));
        p.DataType = 'string vector';
        % 14 16
        wSource = this.dlgWidget(p, 'NameLocation', 2.0, 'Name', xlate('List text:'));
    else
        % 17 20
        % 18 20
        if ischar(this.Source) || isempty(this.Source)
            % 20 22
            p = struct(findprop(classhandle(this), 'Source'));
            p.DataType = 'rgcomponentorparsedstring';
            % 23 25
            wSource = this.dlgWidget(p, 'NameLocation', 2.0, 'Name', xlate('Create list from workspace cell array'));
        else
            % 26 28
            % 27 29
            wSource = this.dlgText(horzcat('Create list from data: ', rptgen.toString(this.Source, 16.0, ' ')));
        end % if
        % 30 32
    end % if
    dlgStruct = this.dlgMain(name, vertcat(cellhorzcat(this.dlgContainer(vertcat(cellhorzcat(wSource), cellhorzcat(this.dlgWidget('ListTitle'))), xlate('List Content'), 'RowSpan', [1.0 1.0], 'ColSpan', [1.0 1.0])), cellhorzcat(this.list_getDialogSchema(name, 'RowSpan', [2.0 2.0], 'ColSpan', [1.0 1.0]))), 'LayoutGrid', [3.0 1.0], 'RowStretch', [0.0 0.0 1.0]);
    % 33 43
    % 34 43
    % 35 43
    % 36 43
    % 37 43
    % 38 43
    % 39 43
    % 40 43
    % 41 43
