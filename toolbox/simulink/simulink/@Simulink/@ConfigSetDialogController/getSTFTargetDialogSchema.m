function dlgstruct = getSTFTargetDialogSchema(h, schemaName)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    dlgstruct = [];
    % 7 9
    hSrc = h.getSourceObject;
    hConfigSet = hSrc.getConfigSet;
    % 10 13
    % 11 13
    if not(isempty(hConfigSet)) && strcmp(hConfigSet.ShowRTWWidgets, 'off')
        if strcmp(schemaName, 'tab')
            dlgstruct.nTabs = 0.0;
            dlgstruct.Tabs = [];
            return;
        end % if
    end % if
    % 19 21
    dlgData = get(hSrc, 'DialogData');
    % 21 23
    tabIndex = 0.0;
    widget = [];
    widget.Tabs = [];
    % 25 29
    % 26 29
    % 27 29
    hParentSTF = getComponent(hSrc, 'Target');
    if not(isempty(hParentSTF)) && strcmp(get(hSrc, 'ForcedBaseTarget'), 'off')
        parentSTFDlg = getDialogSchema(hParentSTF, 'tab');
        if not(isempty(parentSTFDlg))
            if isfield(parentSTFDlg, 'nTabs') && gt(parentSTFDlg.nTabs, 0.0)
                for i=1.0:parentSTFDlg.nTabs
                    tabIndex = plus(tabIndex, 1.0);
                    widget.Tabs{tabIndex} = parentSTFDlg.Tabs{i};
                    if not(isfield(parentSTFDlg.Tabs{i}, 'Source'))
                        widget.Tabs{tabIndex}.Source = hParentSTF;
                    end % if
                end % for
            else
                tabIndex = plus(tabIndex, 1.0);
                widget.Tabs{tabIndex}.Items = parentSTFDlg.Items;
                widget.Tabs{tabIndex}.Name = parentSTFDlg.Name;
                if not(isfield(parentSTFDlg, 'Source'))
                    widget.Tabs{tabIndex}.Source = hParentSTF;
                end % if
            end % if
        end % if
    end % if
    % 50 53
    % 51 53
    if not(isempty(dlgData))
        for i=1.0:dlgData.tabs.nTabs
            tabIndex = plus(tabIndex, 1.0);
            widget.Tabs{tabIndex} = dlgData.tabs.Tabs{i};
            widget.Tabs{tabIndex}.Source = hSrc;
            widget.Tabs{tabIndex}.LayoutGrid = horzcat(plus(length(widget.Tabs{tabIndex}.Items), 1.0), 1.0);
            widget.Tabs{tabIndex}.RowStretch = zeros(1.0, plus(length(widget.Tabs{tabIndex}.Items), 1.0));
            widget.Tabs{tabIndex}.RowStretch(plus(length(widget.Tabs{tabIndex}.Items), 1.0)) = 1.0;
            % 60 63
            % 61 63
            widget.Tabs{tabIndex}.Items{1.0}.RowSpan = [1.0 1.0];
            % 63 65
            if not(isempty(widget.Tabs{tabIndex}.Items))
                for j=1.0:length(widget.Tabs{tabIndex}.Items{1.0}.Items)
                    if isfield(widget.Tabs{tabIndex}.Items{1.0}.Items{j}, 'ObjectProperty') && not(isempty(widget.Tabs{tabIndex}.Items{1.0}.Items{j}.ObjectProperty))
                        % 67 69
                        try
                            widget.Tabs{tabIndex}.Items{1.0}.Items{j}.Enabled = double(not(hSrc.isReadonlyProperty(widget.Tabs{tabIndex}.Items{1.0}.Items{j}.ObjectProperty)));
                            % 70 72
                        end % try
                    end % if
                end % for
            end % if
        end % for
    end % if
    % 77 79
    if strcmp(schemaName, 'tab')
        widget.nTabs = tabIndex;
        dlgstruct = widget;
        dlgstruct.Name = 'Custom Target';
    else
        if not(isempty(dlgData))
            widget.Name = 'tab';
            widget.Type = 'tab';
        else
            widget = [];
            widget.Name = 'System target file cannot be found!';
            widget.Type = 'text';
        end % if
        % 91 93
        dlgstruct.DialogTitle = 'Custom Target';
        dlgstruct.Items = cellhorzcat(widget);
        dlgstruct.PreApplyCallback = 'slprivate';
        dlgstruct.PreApplyArgs = cellhorzcat('configDlgAction', '%dialog', h, 'postApply', 'STFTarget');
    end % if
end % function
