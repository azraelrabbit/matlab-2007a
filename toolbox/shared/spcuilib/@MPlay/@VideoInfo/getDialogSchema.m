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
    infoStruct = horzcat(GetCommonInfo(this), this.playbackInfo);
    % 13 18
    % 14 18
    % 15 18
    % 16 18
    % 17 18
    infoStruct = local_MergeGroups(infoStruct);
    % 19 22
    % 20 22
    % 21 22
    DDG_Group = {};
    Ngroups = numel(infoStruct);
    for i=1.0:Ngroups
        DDG_Group{1.0, i} = DDG2ColText(infoStruct(i).Title, infoStruct(i).Widgets, i);
        % 26 27
    end % for
    % 28 31
    % 29 31
    % 30 31
    cAll.Type = 'panel';
    cAll.Items = DDG_Group;
    cAll.LayoutGrid = horzcat(Ngroups, 1.0);
    % 34 37
    % 35 37
    % 36 37
    dlgstruct = this.StdDlgProps;
    dlgstruct.ExplicitShow = false;
    dlgstruct.DialogTitle = this.fullTitleStr;
    dlgstruct.Items = cellhorzcat(cAll);
    dlgstruct.StandaloneButtonSet = {'Help','OK'};
end % function
function group = local_MergeGroups(infoStruct)
    % 44 49
    % 45 49
    % 46 49
    % 47 49
    % 48 49
    w = {};
    for i=1.0:numel(infoStruct)
        w = vertcat(w, horzcat(infoStruct(i).Widgets));
    end % for
    group.Title = 'Video Info';
    group.Widgets = w;
end % function
function common_group = GetCommonInfo(this)
    % 57 60
    % 58 60
    % 59 60
    common_group.Title = 'Common';
    common_group.Widgets = vertcat(cellhorzcat('Source type', this.sourceType), cellhorzcat('Source name', this.sourceLocation), cellhorzcat('Frame size', this.imagesize), cellhorzcat('Color format', this.colorSpace), cellhorzcat('Source rate', this.frameRate), cellhorzcat('Source type', this.dataType), cellhorzcat('Display type', this.dataTypeDst));
    % 62 68
    % 63 68
    % 64 68
    % 65 68
    % 66 68
    % 67 68
end % function
function grp = DDG2ColText(groupName, entries, grpIdx)
    % 70 84
    % 71 84
    % 72 84
    % 73 84
    % 74 84
    % 75 84
    % 76 84
    % 77 84
    % 78 84
    % 79 84
    % 80 84
    % 81 84
    % 82 84
    % 83 84
    numEntries = size(entries, 1.0);
    allW = cell(1.0, mtimes(2.0, numEntries));
    for indx=1.0:numEntries
        % 87 92
        % 88 92
        % 89 92
        % 90 92
        % 91 92
        w.Type = 'text';
        w.Name = horzcat(entries{indx, 1.0}, ':');
        w.Alignment = 5.0;
        w.Bold = 0.0;
        w.RowSpan = horzcat(indx, indx);
        w.ColSpan = [1.0 1.0];
        allW{minus(mtimes(2.0, indx), 1.0)} = w;
        % 99 101
        % 100 101
        w.Type = 'text';
        w.Name = horzcat('  ', entries{indx, 2.0});
        w.Alignment = 5.0;
        w.Bold = 0.0;
        w.RowSpan = horzcat(indx, indx);
        w.ColSpan = [2.0 2.0];
        allW{mtimes(2.0, indx)} = w;
    end % for
    % 109 112
    % 110 112
    % 111 112
    grp.Type = 'group';
    grp.Name = groupName;
    grp.Items = allW;
    grp.LayoutGrid = horzcat(numEntries, 2.0);
    grp.RowStretch = horzcat(zeros(1.0, minus(numEntries, 1.0)), 1.0);
    grp.ColStretch = [1.0 1.0];
    grp.RowSpan = horzcat(grpIdx, grpIdx);
    grp.ColSpan = [1.0 1.0];
end % function
