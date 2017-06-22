function dlgStruct = loop_getDialogSchema(this, name)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    wSrc = this.dlgWidget('ObjectSource', 'DialogRefresh', true);
    if not(strcmp(this.ObjectSource, 'direct'))
        % 8 10
        wSrc.Entries = wSrc.Entries(1.0:minus(end, 1.0));
        wSrc.Values = wSrc.Values(1.0:minus(end, 1.0));
    end % if
    % 12 14
    dlgContents = cellhorzcat(wSrc);
    % 14 18
    % 15 18
    % 16 18
    switch this.ObjectSource
    case 'matfile'
        dlgContents = vertcat(dlgContents, vertcat(cellhorzcat(this.dlgWidget('Filename')), cellhorzcat(this.dlgWidget('NameList', 'ForegroundColor', [1.0 1.0 255.0]))));
        % 21 24
        % 22 24
    case 'workspace'
        % 23 25
        dlgContents = vertcat(dlgContents, vertcat(cellhorzcat(this.dlgWidget('NameList', 'ForegroundColor', [1.0 1.0 255.0]))));
        % 26 28
    case 'loopchild'
        % 27 29
        dlgContents = vertcat(dlgContents, vertcat(cellhorzcat(this.dlgWidget('ExcludeRoot')), cellhorzcat(this.dlgWidget('FindArguments'))));
    otherwise
        % 30 33
        % 31 33
        % 32 35
        % 33 35
    end % switch
    % 35 37
    dlgStruct = this.dlgContainer(dlgContents, xlate('Select Object'));
