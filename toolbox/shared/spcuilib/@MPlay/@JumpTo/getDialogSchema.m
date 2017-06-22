function dlgstruct = getDialogSchema(this, arg)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    frame.Name = 'Frame number:';
    frame.Type = 'edit';
    frame.ObjectProperty = 'frame';
    frame.RowSpan = [1.0 1.0];
    frame.ColSpan = [1.0 1.0];
    frame.Value = 1.0;
    frame.Mode = false;
    frame.Tag = 'frame';
    % 17 18
    range.Name = sprintf('  (max=%d)', this.maxframe);
    range.Type = 'text';
    range.RowSpan = [1.0 1.0];
    range.ColSpan = [2.0 2.0];
    range.Mode = true;
    % 23 26
    % 24 26
    % 25 26
    prop.Type = 'panel';
    prop.LayoutGrid = [1.0 2.0];
    prop.ColStretch = [1.0 0.0];
    prop.RowSpan = [1.0 1.0];
    prop.ColSpan = [1.0 4.0];
    prop.Items = cellhorzcat(frame, range);
    % 32 36
    % 33 36
    % 34 36
    % 35 36
    wblank2.Type = 'text';
    wblank2.Name = ' ';
    wblank2.RowSpan = [2.0 2.0];
    wblank2.ColSpan = [1.0 1.0];
    wblank2.Visible = true;
    wblank2.MinimumSize = [80.0 10.0];
    % 42 43
    wimport.Type = 'pushbutton';
    wimport.Name = 'OK';
    wimport.Tag = 'pushOK';
    wimport.RowSpan = [2.0 2.0];
    wimport.ColSpan = [2.0 2.0];
    wimport.ObjectMethod = 'handleButtons';
    wimport.MethodArgs = {'OK'};
    wimport.ArgDataTypes = {'string'};
    % 51 52
    wcancel.Type = 'pushbutton';
    wcancel.Name = 'Cancel';
    wcancel.Tag = 'pushCancel';
    wcancel.RowSpan = [2.0 2.0];
    wcancel.ColSpan = [3.0 3.0];
    wcancel.ObjectMethod = 'handleButtons';
    wcancel.MethodArgs = {'Cancel'};
    wcancel.ArgDataTypes = {'string'};
    % 60 61
    wapply.Type = 'pushbutton';
    wapply.Name = 'Apply';
    wapply.Tag = 'pushApply';
    wapply.RowSpan = [2.0 2.0];
    wapply.ColSpan = [4.0 4.0];
    wapply.ObjectMethod = 'handleButtons';
    wapply.MethodArgs = {'Apply'};
    wapply.ArgDataTypes = {'string'};
    % 69 74
    % 70 74
    % 71 74
    % 72 74
    % 73 74
    dlgstruct = this.StdDlgProps;
    dlgstruct.LayoutGrid = [2.0 4.0];
    dlgstruct.RowStretch = [1.0 0.0];
    dlgstruct.ColStretch = [1.0 0.0 0.0 0.0];
    dlgstruct.Items = cellhorzcat(prop, wblank2, wimport, wcancel, wapply);
    dlgstruct.StandaloneButtonSet = {''};
end % function
