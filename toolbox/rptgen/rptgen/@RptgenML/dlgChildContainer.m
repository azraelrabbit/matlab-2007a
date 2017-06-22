function dlgStruct = dlgChildContainer(this, dlgName, varargin)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    enableIdx = find(strcmp(varargin, 'Enabled'));
    if isempty(enableIdx)
        linkEnable = true;
    else
        linkEnable = varargin{plus(enableIdx(1.0), 1.0)};
        varargin = horzcat(varargin(1.0:minus(enableIdx(1.0), 1.0)), varargin(plus(enableIdx(1.0), 2.0):end));
    end % if
    % 18 20
    r = RptgenML.Root;
    thisChild = this.down;
    i = 0.0;
    childItems = {};
    rowStretch = [];
    % 24 26
    if isa(this, 'RptgenML.LibraryCategory')
        % 26 29
        % 27 29
        viewMethod = 'dlgViewChild';
        viewArg1 = this;
    else
        viewMethod = 'viewChild';
        viewArg1 = r;
    end % if
    % 34 38
    % 35 38
    % 36 38
        while not(isempty(thisChild))
        % 38 40
        if isa(thisChild, 'RptgenML.LibraryComponent')
            nStr = thisChild.DisplayName;
            if not(isempty(thisChild.ComponentInstance))
                try
                    nStr = getName(thisChild.ComponentInstance);
                end % try
            end % if
            dStr = thisChild.getDescription('-deferred');
        else
            if isa(thisChild, 'RptgenML.ComponentMakerData')
                nStr = thisChild.PropertyName;
                dStr = thisChild.Description;
            else
                if isa(thisChild, 'RptgenML.StylesheetEditor')
                    nStr = thisChild.DisplayName;
                    dStr = thisChild.Description;
                else
                    if isa(thisChild, 'rptgen.rptcomponent')
                        nStr = thisChild.getName;
                        dStr = thisChild.getDescription;
                    else
                        if isa(thisChild, 'RptgenML.LibraryRpt')
                            nStr = thisChild.FileName;
                            dStr = rptgen.truncateString(thisChild.getDescription('-deferred'), '', 128.0);
                        else
                            if isa(thisChild, 'RptgenML.StylesheetAttribute')
                                nStr = char(com.mathworks.toolbox.rptgen.xml.StylesheetEditor.formatParameterDisplayID(thisChild.JavaHandle));
                                dStr = rptgen.truncateString(thisChild.Value, '', 128.0);
                            else
                                if isa(thisChild, 'RptgenML.StylesheetHeaderCell')
                                    nStr = thisChild.getDisplayLabel;
                                    dStr = rptgen.truncateString(thisChild.Value, '', 128.0);
                                else
                                    if isa(thisChild, 'RptgenML.StylesheetElement')
                                        nStr = thisChild.getDisplayLabel;
                                        dStr = char(thisChild.DescriptionShort);
                                    else
                                        nStr = thisChild.getDisplayLabel;
                                        dStr = '';
                                    end % if
                                end % if
                            end % if
                        end % if
                    end % if
                end % if
            end % if
        end % if
        i = plus(i, 1.0);
        childItems = horzcat(childItems, cellhorzcat(struct('Type', 'hyperlink', 'Name', nStr, 'Alignment', 1.0, 'ToolTip', xlate('View'), 'Enabled', linkEnable, 'MatlabMethod', viewMethod, 'MatlabArgs', cellhorzcat(cellhorzcat(viewArg1, thisChild)), 'ColSpan', [1.0 1.0], 'RowSpan', horzcat(i, i)), this.dlgText(dStr, 'WordWrap', 1.0, 'ColSpan', [2.0 2.0], 'RowSpan', horzcat(i, i))));
        rowStretch(i) = 0.0;
        % 89 102
        % 90 102
        % 91 102
        % 92 102
        % 93 102
        % 94 102
        % 95 102
        % 96 102
        % 97 102
        % 98 102
        % 99 102
        % 100 102
        thisChild = thisChild.right;
    end % while
    % 103 105
    i = plus(i, 1.0);
    childItems{plus(end, 1.0)} = this.dlgText('', 'ColSpan', [1.0 2.0], 'RowSpan', horzcat(i, i));
    % 106 109
    % 107 109
    rowStretch(i) = 1.0;
    % 109 111
    dlgStruct = this.dlgContainer(childItems, dlgName, 'LayoutGrid', horzcat(i, 2.0), 'ColStretch', [0.0 1.0], 'RowStretch', rowStretch, varargin{:});
    % 111 116
    % 112 116
    % 113 116
    % 114 116
