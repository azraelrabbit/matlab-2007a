function dlgStruct = atGetDialogSchema(this, name)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    manualHeader = strcmp(this.HeaderType, 'manual');
    % 9 11
    if strcmp(this.TitleType, 'name') && not(isempty(findprop(this, 'NameType')))
        wTitle = rmfield(this.dlgWidget('NameType'), 'Name');
    else
        % 13 15
        wTitle = this.dlgWidget('Title', 'Enabled', strcmp(this.TitleType, 'manual'));
        % 15 17
    end % if
    % 17 19
    wHeaderType = this.dlgWidget('HeaderType', 'DialogRefresh', true, 'RowSpan', [2.0 2.0], 'ColSpan', [2.0 3.0]);
    % 19 23
    % 20 23
    % 21 23
    wHeaderTypeTitle = this.dlgText(wHeaderType.Name, 'RowSpan', [2.0 2.0], 'ColSpan', [1.0 1.0]);
    % 23 26
    % 24 26
    wHeaderType = rmfield(wHeaderType, 'Name');
    % 26 31
    % 27 31
    % 28 31
    % 29 31
    wTitleType = this.dlgWidget('TitleType', 'DialogRefresh', true, 'RowSpan', [1.0 1.0], 'ColSpan', [2.0 2.0]);
    % 31 35
    % 32 35
    % 33 35
    wTitleTypeTitle = this.dlgText(wTitleType.Name, 'RowSpan', [1.0 1.0], 'ColSpan', [1.0 1.0]);
    % 35 38
    % 36 38
    wTitleType = rmfield(wTitleType, 'Name');
    % 38 41
    % 39 41
    dlgStruct = this.dlgContainer(vertcat(cellhorzcat(wTitleTypeTitle), cellhorzcat(wTitleType), cellhorzcat(this.dlgSet(wTitle, 'RowSpan', [1.0 1.0], 'ColSpan', [3.0 3.0])), cellhorzcat(wHeaderTypeTitle), cellhorzcat(wHeaderType), cellhorzcat(this.dlgWidget('HeaderColumn1', 'Enabled', manualHeader, 'RowSpan', [3.0 3.0], 'ColSpan', [2.0 2.0])), cellhorzcat(this.dlgWidget('HeaderColumn2', 'Enabled', manualHeader, 'RowSpan', [3.0 3.0], 'ColSpan', [3.0 3.0])), cellhorzcat(this.dlgWidget('RemoveEmpty', 'RowSpan', [4.0 4.0], 'ColSpan', [1.0 3.0]))), xlate('Display Options'), 'LayoutGrid', [4.0 3.0]);
    % 41 60
    % 42 60
    % 43 60
    % 44 60
    % 45 60
    % 46 60
    % 47 60
    % 48 60
    % 49 60
    % 50 60
    % 51 60
    % 52 60
    % 53 60
    % 54 60
    % 55 60
    % 56 60
    % 57 60
    % 58 60
end % function
