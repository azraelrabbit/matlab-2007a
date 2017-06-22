function dlgStruct = getDialogSchema(this, name)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    w = this.dlgWidget;
    % 7 9
    if strcmp(this.SectionType, 'auto')
        wSectionType = this.dlgText(this.findDisplayName('SectionType', this.getSectionType));
    else
        % 11 14
        % 12 14
        % 13 15
        wSectionType = this.dlgWidget('SectionType');
    end % if
    % 16 19
    % 17 19
    pTitleMode = struct(findprop(classhandle(this), 'isTitleFromSubComponent'));
    pTitleMode.DataType = vertcat(cellhorzcat(true, xlate('Automatic')), cellhorzcat(false, horzcat(xlate('Custom'), ':')));
    % 20 25
    % 21 25
    % 22 25
    % 23 25
    if this.isTitleFromSubComponent
        wSectionTitle = this.dlgText(pTitleMode.Description);
    else
        wSectionTitle = this.dlgWidget('SectionTitle');
        wSectionTitle = rmfield(wSectionTitle, 'Name');
    end % if
    pTitleMode.Description = xlate('Title');
    % 31 33
    dlgStruct = this.dlgMain(name, vertcat(cellhorzcat(this.dlgContainer(vertcat(cellhorzcat(this.dlgWidget(pTitleMode, 'ColSpan', [1.0 1.0], 'RowSpan', [1.0 1.0], 'DialogRefresh', true)), cellhorzcat(this.dlgSet(wSectionTitle, 'ColSpan', [2.0 2.0], 'RowSpan', [1.0 1.0])), cellhorzcat(this.dlgWidget('NumberMode', 'ColSpan', [1.0 1.0], 'RowSpan', [2.0 2.0], 'DialogRefresh', true)), cellhorzcat(this.dlgWidget('Number', 'ColSpan', [2.0 2.0], 'RowSpan', [2.0 2.0], 'Enabled', strcmp(this.NumberMode, 'manual')))), xlate('Section Title'), 'LayoutGrid', [2.0 2.0], 'ColStretch', [0.0 1.0], 'ColSpan', [1.0 1.0], 'RowSpan', [1.0 1.0])), cellhorzcat(this.dlgContainer(vertcat(cellhorzcat(wSectionType)), xlate('Section Type'), 'ColSpan', [1.0 1.0], 'RowSpan', [2.0 2.0]))), 'LayoutGrid', [2.0 1.0], 'RowStretch', [0.0 1.0]);
    % 33 61
    % 34 61
    % 35 61
    % 36 61
    % 37 61
    % 38 61
    % 39 61
    % 40 61
    % 41 61
    % 42 61
    % 43 61
    % 44 61
    % 45 61
    % 46 61
    % 47 61
    % 48 61
    % 49 61
    % 50 61
    % 51 61
    % 52 61
    % 53 61
    % 54 61
    % 55 61
    % 56 61
    % 57 61
    % 58 61
    % 59 61
end % function
