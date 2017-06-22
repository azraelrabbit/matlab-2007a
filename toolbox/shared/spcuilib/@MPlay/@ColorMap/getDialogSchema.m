function dlgstruct = getDialogSchema(this, arg)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    cmap.Name = 'Colormap:';
    cmap.Type = 'combobox';
    cmap.Editable = true;
    cmap.Entries = {'gray(256)','jet(256)','hot(256)','bone(256)','cool(256)','copper(256)'};
    cmap.ObjectProperty = 'cmapStr';
    cmap.RowSpan = [1.0 1.0];
    cmap.ColSpan = [1.0 2.0];
    cmap.ToolTip = 'Must evaluate to an Nx3 matrix';
    cmap.Mode = false;
    cmap.Enabled = this.isIntensity;
    cmap.Tag = 'cmapStr';
    % 20 24
    % 21 24
    % 22 24
    str = sprintf('Specify range of displayed pixel values [%d to %d]', this.scale_limits);
    % 24 26
    scale.Name = str;
    scale.Type = 'checkbox';
    scale.ObjectProperty = 'userRange';
    scale.RowSpan = [2.0 2.0];
    scale.ColSpan = [1.0 2.0];
    scale.Mode = false;
    scale.DialogRefresh = true;
    scale.Enabled = this.isIntensity;
    scale.Tag = 'userRange';
    % 34 36
    if isempty(this.dialog)
        % 36 38
        enable_minmax = this.isIntensity && this.userRange;
    else
        % 39 44
        % 40 44
        % 41 44
        % 42 44
        enable_minmax = this.isIntensity && this.dialog.getWidgetValue('userRange');
    end
    % 45 47
    smin.Name = 'Min:';
    smin.Type = 'edit';
    smin.ObjectProperty = 'userRangeMin';
    smin.RowSpan = [3.0 3.0];
    smin.ColSpan = [1.0 1.0];
    smin.ToolTip = 'Minimum pixel value';
    smin.Enabled = enable_minmax;
    smin.Mode = false;
    smin.Tag = 'userRangeMin';
    % 55 57
    smax.Name = 'Max:';
    smax.Type = 'edit';
    smax.ObjectProperty = 'userRangeMax';
    smax.RowSpan = [3.0 3.0];
    smax.ColSpan = [2.0 2.0];
    smax.ToolTip = 'Maximum pixel value';
    smax.Enabled = enable_minmax;
    smax.Mode = false;
    smax.Tag = 'userRangeMax';
    % 65 69
    % 66 69
    % 67 69
    cmap_cont.Type = 'panel';
    % 69 71
    cmap_cont.LayoutGrid = [3.0 2.0];
    cmap_cont.Items = cellhorzcat(cmap, scale, smin, smax);
    % 72 78
    % 73 78
    % 74 78
    % 75 78
    % 76 78
    dlgstruct = this.StdDlgProps;
    dlgstruct.Items = cellhorzcat(cmap_cont);
    dlgstruct.PreApplyMethod = 'validate';
end
