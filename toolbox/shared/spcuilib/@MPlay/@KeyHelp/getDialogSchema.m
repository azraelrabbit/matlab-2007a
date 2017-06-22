function dlgstruct = getDialogSchema(this, arg)
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
    % 11 12
    helpStruct = horzcat(this.playbackHelp, GetCommonHelp);
    % 13 16
    % 14 16
    % 15 16
    DDG_Group = {};
    Ngroups = numel(helpStruct);
    for i=1.0:Ngroups
        DDG_Group{1.0, i} = DDG2ColText(helpStruct(i).Title, helpStruct(i).Widgets, i);
        % 20 21
    end % for
    % 22 25
    % 23 25
    % 24 25
    cAll.Type = 'panel';
    cAll.Items = DDG_Group;
    cAll.LayoutGrid = horzcat(Ngroups, 1.0);
    % 28 31
    % 29 31
    % 30 31
    dlgstruct = this.StdDlgProps;
    dlgstruct.ExplicitShow = false;
    dlgstruct.DialogTitle = this.fullTitleStr;
    dlgstruct.Items = cellhorzcat(cAll);
    dlgstruct.StandaloneButtonSet = {'Help','OK'};
end % function
function common_group = GetCommonHelp
    % 38 41
    % 39 41
    % 40 41
    common_group.Title = 'Common';
    common_group.Widgets = {'Insert','Open new MPlay';'C','Change colormap';'N','Change preferences';'V','Display video info';'K','Display keyboard help'};
    % 43 47
    % 44 47
    % 45 47
    % 46 47
end % function
function grp = DDG2ColText(groupName, entries, grpIdx)
    % 49 63
    % 50 63
    % 51 63
    % 52 63
    % 53 63
    % 54 63
    % 55 63
    % 56 63
    % 57 63
    % 58 63
    % 59 63
    % 60 63
    % 61 63
    % 62 63
    numEntries = size(entries, 1.0);
    allW = cell(1.0, mtimes(2.0, numEntries));
    for indx=1.0:numEntries
        % 66 71
        % 67 71
        % 68 71
        % 69 71
        % 70 71
        w.Alignment = 5.0;
        w.Type = 'text';
        w.Name = entries{indx, 2.0};
        w.RowSpan = horzcat(indx, indx);
        w.ColSpan = [1.0 1.0];
        allW{minus(mtimes(2.0, indx), 1.0)} = w;
        % 77 79
        % 78 79
        w.Alignment = 5.0;
        w.Type = 'text';
        w.Name = entries{indx, 1.0};
        w.RowSpan = horzcat(indx, indx);
        w.ColSpan = [2.0 2.0];
        allW{mtimes(2.0, indx)} = w;
    end % for
    % 86 89
    % 87 89
    % 88 89
    grp.Type = 'group';
    grp.Name = groupName;
    grp.Items = allW;
    grp.LayoutGrid = horzcat(numEntries, 2.0);
    grp.RowStretch = horzcat(zeros(1.0, minus(numEntries, 1.0)), 1.0);
    grp.ColStretch = [1.0 1.0];
    grp.RowSpan = horzcat(grpIdx, grpIdx);
    grp.ColSpan = [1.0 1.0];
end % function
