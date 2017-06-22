function dlgstruct = getDialogSchema(h, schemaName)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    tag = 'ConfigSet_TargetBrowser_';
    % 8 18
    % 9 18
    % 10 18
    % 11 18
    % 12 18
    % 13 18
    % 14 18
    % 15 18
    % 16 18
    % 17 18
    lbl.Name = 'System target file:                                          Description:';
    fullname.Name = 'Full name:';
    tmf.Name = 'Template make file:';
    make.Name = 'Make command:';
    title = 'System target file browser: ';
    % 23 25
    % 24 25
    lbl.Type = 'text';
    lbl.Alignment = 1.0;
    % 27 30
    % 28 30
    % 29 30
    list.Type = 'listbox';
    list.Tag = horzcat(tag, 'list');
    list.Entries = get(h, 'tlclist');
    list.ObjectProperty = 'selected';
    list.MultiSelect = 0.0;
    list.FontFamily = 'Courier';
    list.Mode = 1.0;
    list.DialogRefresh = 1.0;
    % 38 39
    tlcfiles = get(h, 'tlcfiles');
    selected = tlcfiles(plus(get(h, 'selected'), 1.0));
    % 41 43
    % 42 43
    fullname.Type = 'text';
    fullname.Tag = horzcat(tag, 'FullName');
    % 45 47
    % 46 47
    if not(isempty(selected))
        fullnameCont.Name = selected.fullName;
    else
        fullnameCont.Name = '';
    end % if
    fullnameCont.Type = 'text';
    fullnameCont.Tag = horzcat(tag, 'FullNameContent');
    % 54 56
    % 55 56
    tmf.Type = 'text';
    tmf.Tag = horzcat(tag, 'TemplateMakefile');
    % 58 60
    % 59 60
    if not(isempty(selected))
        tmfCont.Name = selected.tmf;
    else
        tmfCont.Name = '';
    end % if
    tmfCont.Type = 'text';
    tmfCont.Tag = horzcat(tag, 'TemplateMakefileContent');
    % 67 69
    % 68 69
    make.Type = 'text';
    make.Tag = horzcat(tag, 'MakeCommand');
    % 71 73
    % 72 73
    if not(isempty(selected))
        makeCont.Name = selected.makeCmd;
    else
        makeCont.Name = '';
    end % if
    makeCont.Type = 'text';
    makeCont.Tag = horzcat(tag, 'MakeCommandContent');
    % 80 82
    % 81 82
    hParent = get(h, 'parentSrc');
    model = hParent.getModel;
    if not(isempty(model))
        title = horzcat(title, get_param(model, 'Name'));
    end % if
    % 87 89
    % 88 89
    lbl.RowSpan = [1.0 1.0];
    lbl.ColSpan = [1.0 2.0];
    list.RowSpan = [2.0 2.0];
    list.ColSpan = [1.0 2.0];
    fullname.RowSpan = [3.0 3.0];
    fullname.ColSpan = [1.0 1.0];
    fullnameCont.RowSpan = [3.0 3.0];
    fullnameCont.ColSpan = [2.0 2.0];
    tmf.RowSpan = [4.0 4.0];
    tmf.ColSpan = [1.0 1.0];
    tmfCont.RowSpan = [4.0 4.0];
    tmfCont.ColSpan = [2.0 2.0];
    make.RowSpan = [5.0 5.0];
    make.ColSpan = [1.0 1.0];
    makeCont.RowSpan = [5.0 5.0];
    makeCont.ColSpan = [2.0 2.0];
    dlgstruct.DialogTitle = title;
    dlgstruct.Items = cellhorzcat(lbl, list, fullname, fullnameCont, tmf, tmfCont, make, makeCont);
    dlgstruct.LayoutGrid = [5.0 2.0];
    dlgstruct.RowStretch = [0.0 1.0 0.0 0.0 0.0];
    dlgstruct.ColStretch = [0.0 1.0];
    dlgstruct.PreApplyCallback = 'rtwprivate';
    dlgstruct.PreApplyArgs = {'targetBrowserCloseCB','%dialog','PreApply'};
    dlgstruct.SmartApply = 0.0;
    dlgstruct.HelpMethod = 'helpview([docroot ''/toolbox/rtw/helptargets.map''],''systargfilebrowser'')';
end % function
