function dlgStruct = getDialogSchema(this, name)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    w = this.dlgWidget;
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    switch this.AuthorMode
    case 'none'
        w.Author = this.dlgText(xlate('No author'));
    case 'auto'
        try
            defaultName = char(java.lang.System.getProperty('user.name'));
        catch
            defaultName = '';
        end % try
        w.Author = this.dlgText(defaultName);
    case 'manual'
        % 22 24
    end % switch
    % 24 28
    % 25 28
    % 26 28
    pTitle = this.dlgContainer(vertcat(cellhorzcat(w.Title), cellhorzcat(w.Subtitle)), xlate('Title'), 'RowSpan', [1.0 1.0], 'ColSpan', [1.0 1.0]);
    % 28 34
    % 29 34
    % 30 34
    % 31 34
    % 32 34
    dateVals = {'dd-mmm-yyyy HH:MM:SS';'dd-mmm-yyyy';'mm/dd/yy';'mmm';'m';'mm';'mm/dd';'dd';'ddd';'d';'yyyy';'yy';'mmmyy';'HH:MM:SS';'HH:MM:SS PM';'HH:MM';'HH:MM PM';'QQ-YY';'QQ'};
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
    currDate = now;
    for i=length(dateVals):-1.0:1.0
        dateVals{i, 2.0} = sprintf('%s (%s)', dateVals{i}, datestr(currDate, dateVals{i}));
    end % for
    pDateFormat = struct(findprop(classhandle(this), 'DateFormat'));
    pDateFormat.DataType = dateVals;
    % 61 63
    pOptions = this.dlgContainer(vertcat(cellhorzcat(this.dlgSet(w.Image, 'RowSpan', [1.0 1.0], 'ColSpan', [1.0 3.0])), cellhorzcat(this.dlgSet(w.AuthorMode, 'DialogRefresh', true, 'RowSpan', [2.0 2.0], 'ColSpan', [1.0 1.0])), cellhorzcat(this.dlgSet(w.Author, 'RowSpan', [2.0 2.0], 'ColSpan', [2.0 3.0])), cellhorzcat(this.dlgSet(w.Include_Date, 'Name', horzcat(w.Include_Date.Name, ':'), 'DialogRefresh', true, 'RowSpan', [3.0 3.0], 'ColSpan', [1.0 1.0])), cellhorzcat(this.dlgWidget(pDateFormat, 'Enabled', this.Include_Date, 'Editable', 1.0, 'RowSpan', [3.0 3.0], 'ColSpan', [2.0 3.0])), cellhorzcat(this.dlgSet(w.Include_Copyright, 'Name', horzcat(w.Include_Copyright.Name, ':'), 'DialogRefresh', true, 'RowSpan', [4.0 4.0], 'ColSpan', [1.0 1.0])), cellhorzcat(this.dlgSet(w.Copyright_Holder, 'Enabled', this.Include_Copyright, 'RowSpan', [4.0 4.0], 'ColSpan', [2.0 2.0])), cellhorzcat(this.dlgSet(w.Copyright_Date, 'Enabled', this.Include_Copyright, 'RowSpan', [4.0 4.0], 'ColSpan', [3.0 3.0]))), xlate('Options'), 'LayoutGrid', [4.0 3.0], 'ColStretch', [0.0 1.0 0.0], 'RowSpan', [2.0 2.0], 'ColSpan', [1.0 1.0]);
    % 63 101
    % 64 101
    % 65 101
    % 66 101
    % 67 101
    % 68 101
    % 69 101
    % 70 101
    % 71 101
    % 72 101
    % 73 101
    % 74 101
    % 75 101
    % 76 101
    % 77 101
    % 78 101
    % 79 101
    % 80 101
    % 81 101
    % 82 101
    % 83 101
    % 84 101
    % 85 101
    % 86 101
    % 87 101
    % 88 101
    % 89 101
    % 90 101
    % 91 101
    % 92 101
    % 93 101
    % 94 101
    % 95 101
    % 96 101
    % 97 101
    % 98 101
    % 99 101
    nAbstract = strrep(w.Abstract.Name, ':', '');
    w.Abstract = rmfield(w.Abstract, 'Name');
    w.Abstract.Type = 'editarea';
    pAbstract = this.dlgContainer(cellhorzcat(w.Abstract), nAbstract, 'RowSpan', [3.0 3.0], 'ColSpan', [1.0 1.0]);
    % 104 107
    % 105 107
    nLegal = strrep(w.Legal_Notice.Name, ':', '');
    w.Legal_Notice = rmfield(w.Legal_Notice, 'Name');
    w.Legal_Notice.Type = 'editarea';
    pLegal = this.dlgContainer(cellhorzcat(w.Legal_Notice), nLegal, 'RowSpan', [4.0 4.0], 'ColSpan', [1.0 1.0]);
    % 110 114
    % 111 114
    % 112 114
    dlgStruct = this.dlgMain(name, vertcat(cellhorzcat(pTitle), cellhorzcat(pOptions), cellhorzcat(pAbstract), cellhorzcat(pLegal)), 'LayoutGrid', [4.0 4.0], 'RowStretch', [0.0 0.0 1.0 1.0]);
    % 114 119
    % 115 119
    % 116 119
    % 117 119
