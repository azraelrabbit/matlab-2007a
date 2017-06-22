function dlgStruct = getDialogSchema(this, name)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    if strcmp(this.Source, 'M')
        wSrc = this.dlgWidget('Filename');
    else
        try
            vStr = horzcat('Value: ', rptgen.toString(this.getDisplayValue(this.getDisplayName), 24.0));
        catch
            % 14 16
            vStr = lasterr;
            strLoc = findstr(vStr, char(10.0));
            if not(isempty(strLoc))
                vStr = sprintf('Warning: %s', vStr(plus(strLoc(1.0), 1.0):end));
                % 19 21
            end % if
        end % try
        wSrc = this.dlgText(vStr);
    end % if
    % 24 26
    wSrcType = this.dlgWidget('Source', 'DialogRefresh', true);
    % 26 29
    % 27 29
    if strcmp(this.Source, 'direct')
        srcPanel = this.dlgContainer(vertcat(cellhorzcat(wSrcType), cellhorzcat(wSrc)), xlate('Source'));
    else
        % 31 34
        % 32 34
        % 33 35
        wSrcType.Entries = wSrcType.Entries(1.0:minus(end, 1.0));
        wSrcType.Values = wSrcType.Values(1.0:minus(end, 1.0));
        srcPanel = this.dlgContainer(vertcat(cellhorzcat(this.dlgWidget('Variable', 'DialogRefresh', true)), cellhorzcat(wSrcType), cellhorzcat(wSrc)), xlate('Source'));
        % 37 43
        % 38 43
        % 39 43
        % 40 43
        % 41 43
    end % if
    % 43 45
    dlgStruct = this.dlgMain(name, vertcat(cellhorzcat(this.dlgSet(srcPanel, 'RowSpan', [1.0 1.0], 'ColSpan', [1.0 1.0])), cellhorzcat(this.vdGetDialogSchema(name, 'RowSpan', [2.0 2.0], 'ColSpan', [1.0 1.0]))), 'LayoutGrid', [3.0 1.0], 'RowStretch', [0.0 0.0 1.0]);
    % 45 50
    % 46 50
    % 47 50
    % 48 50
