function dlgStruct = loop_getDialogSchema(this, name)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    wLoopType = this.dlgWidget('LoopType', 'DialogRefresh', true, 'RowSpan', [1.0 1.0], 'ColSpan', [1.0 1.0]);
    % 11 15
    % 12 15
    % 13 15
    figContLabel = xlate('Figure Selection');
    % 15 17
    if strcmp(this.LoopType, 'ALL')
        figCont = this.dlgContainer(vertcat(cellhorzcat(wLoopType), cellhorzcat(this.dlgWidget('isDataFigureOnly', 'RowSpan', [2.0 2.0], 'ColSpan', [1.0 1.0], 'DialogRefresh', true))), figContLabel, 'LayoutGrid', [3.0 1.0], 'RowStretch', [0.0 0.0 1.0]);
    else
        % 19 24
        % 20 24
        % 21 24
        % 22 24
        if strcmp(this.LoopType, 'TAG')
            figCont = this.dlgContainer(vertcat(cellhorzcat(wLoopType), cellhorzcat(this.dlgWidget('TagList', 'RowSpan', [2.0 2.0], 'ColSpan', [1.0 1.0], 'DialogRefresh', true)), cellhorzcat(this.dlgWidget('UseRegexp', 'RowSpan', [3.0 3.0], 'ColSpan', [1.0 1.0], 'DialogRefresh', true))), figContLabel, 'LayoutGrid', [3.0 1.0], 'RowStretch', [0.0 1.0 0.0]);
        else
            % 26 34
            % 27 34
            % 28 34
            % 29 34
            % 30 34
            % 31 34
            % 32 34
            % 33 35
            figCont = this.dlgContainer(vertcat(cellhorzcat(wLoopType)), figContLabel, 'LayoutGrid', [3.0 1.0], 'RowStretch', [0.0 1.0 0.0]);
            % 35 38
            % 36 38
        end % if
        % 38 40
    end % if
    figH = this.loop_getLoopObjects;
    figNames = '';
    psHG = rptgen_hg.propsrc_hg_fig;
    for i=1.0:length(figH)
        figNames = horzcat(figNames, psHG.getObjectName(figH(i)), char(10.0));
    end % for
    if not(isempty(figNames)) && eq(figNames(end), char(10.0))
        figNames = figNames(1.0:minus(end, 1.0));
    end % if
    % 49 51
    dlgStruct = vertcat(cellhorzcat(figCont), cellhorzcat(this.dlgContainer(vertcat(cellhorzcat(this.dlgText(figNames))), xlate('Loop Figure List'))));
    % 51 56
    % 52 56
    % 53 56
    % 54 56
end % function
