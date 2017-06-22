function dlgStruct = getDialogSchema(this, name)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if not(builtin('license', 'checkout', 'SIMULINK_Report_Gen'))
        dlgStruct = this.buildErrorMessage(name, true);
        return
        % 9 11
    end
    % 11 13
    w = this.dlgWidget;
    % 13 15
    p = struct(findprop(this, 'DateFormat'));
    p.DataType = locDateOpts;
    w.DateFormat = this.dlgWidget(p);
    % 17 19
    dlgStruct = this.dlgMain(name, vertcat(cellhorzcat(this.dlgContainer(vertcat(cellhorzcat(w.isAuthor), cellhorzcat(w.isVersion), cellhorzcat(w.isDate), cellhorzcat(w.isComment)), xlate('Table Columns'))), cellhorzcat(this.dlgContainer(vertcat(cellhorzcat(this.dlgSet(w.isLimitRevisions, 'ColSpan', [1.0 1.0], 'RowSpan', [1.0 1.0], 'DialogRefresh', 1.0)), cellhorzcat(this.dlgSet(w.NumRevisions, 'ColSpan', [2.0 2.0], 'RowSpan', [1.0 1.0], 'Enabled', this.isLimitRevisions)), cellhorzcat(this.dlgSet(w.isLimitDate, 'ColSpan', [1.0 1.0], 'RowSpan', [2.0 2.0], 'DialogRefresh', 1.0)), cellhorzcat(this.dlgSet(w.DateLimit, 'ColSpan', [2.0 2.0], 'RowSpan', [2.0 2.0], 'Enabled', this.isLimitDate))), xlate('Table Rows'), 'LayoutGrid', [2.0 2.0])), cellhorzcat(this.dlgContainer(vertcat(cellhorzcat(this.dlgSet(w.TableTitle, 'ColSpan', [1.0 1.0], 'RowSpan', [1.0 1.0])), cellhorzcat(this.dlgSet(w.SortOrder, 'ColSpan', [1.0 1.0], 'RowSpan', [2.0 2.0])), cellhorzcat(this.dlgSet(w.DateFormat, 'Editable', 1.0, 'ColSpan', [1.0 1.0], 'RowSpan', [3.0 3.0]))), xlate('Table Display'), 'LayoutGrid', [4.0 1.0], 'RowStretch', [0.0 0.0 0.0 1.0]))));
    % 19 56
    % 20 56
    % 21 56
    % 22 56
    % 23 56
    % 24 56
    % 25 56
    % 26 56
    % 27 56
    % 28 56
    % 29 56
    % 30 56
    % 31 56
    % 32 56
    % 33 56
    % 34 56
    % 35 56
    % 36 56
    % 37 56
    % 38 56
    % 39 56
    % 40 56
    % 41 56
    % 42 56
    % 43 56
    % 44 56
    % 45 56
    % 46 56
    % 47 56
    % 48 56
    % 49 56
    % 50 56
    % 51 56
    % 52 56
    % 53 56
    % 54 56
end
function dateOpts = locDateOpts
    % 57 61
    % 58 61
    % 59 61
    persistent DATEVALUES;
    % 61 63
    if isempty(DATEVALUES)
        % 63 65
        DATEVALUES = {'dd-mmm-yyyy HH:MM:SS';'dd-mmm-yyyy';'mm/dd/yy';'mmm';'m';'mm';'mm/dd';'dd';'ddd';'d';'yyyy';'yy';'mmmyy';'HH:MM:SS';'HH:MM:SS PM';'HH:MM';'HH:MM PM';'QQ-YY';'QQ';'dd/mm';'dd/mm/yy';'mmm.dd,yyyy HH:MM:SS';'mmm.dd,yyyy';'mm/dd/yyyy';'dd/mm/yyyy';'yy/mm/dd';'yyyy/mm/dd';'QQ-YYYY';'mmmyyyy';'yyyy-mm-dd';'yyyymmddTHHMMSS';'yyyy-mm-dd HH:MM:SS'};
        % 65 100
        % 66 100
        % 67 100
        % 68 100
        % 69 100
        % 70 100
        % 71 100
        % 72 100
        % 73 100
        % 74 100
        % 75 100
        % 76 100
        % 77 100
        % 78 100
        % 79 100
        % 80 100
        % 81 100
        % 82 100
        % 83 100
        % 84 100
        % 85 100
        % 86 100
        % 87 100
        % 88 100
        % 89 100
        % 90 100
        % 91 100
        % 92 100
        % 93 100
        % 94 100
        % 95 100
        % 96 100
        % 97 100
        % 98 100
        t = now;
        for i=1.0:length(DATEVALUES)
            DATEVALUES{i, 2.0} = sprintf('%s (%s)', DATEVALUES{i, 1.0}, datestr(t, DATEVALUES{i, 1.0}));
        end % for
        % 103 105
        DATEVALUES(plus(end, 1.0), :) = cellhorzcat('inherit', xlate('Use model format'));
        % 105 107
    end
    % 107 109
    dateOpts = DATEVALUES;
end
