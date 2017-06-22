function dlgstruct = getInputDataPropertyDialogSchema(hIdp, name)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    NameLbl.Name = 'Name:';
    NameLbl.Type = 'text';
    NameLbl.RowSpan = [1.0 1.0];
    NameLbl.ColSpan = [1.0 1.0];
    NameLbl.Tag = 'NameLbl';
    % 12 14
    NameWgt.Type = 'edit';
    NameWgt.ObjectProperty = 'Name';
    NameWgt.Mode = 1.0;
    NameWgt.RowSpan = [1.0 1.0];
    NameWgt.ColSpan = [2.0 2.0];
    % 18 25
    % 19 25
    % 20 25
    % 21 25
    % 22 25
    % 23 25
    ClassLbl.Name = 'Class:';
    ClassLbl.Type = 'text';
    ClassLbl.RowSpan = [2.0 2.0];
    ClassLbl.ColSpan = [1.0 1.0];
    ClassLbl.Tag = 'ClassLbl';
    % 29 31
    Class.Name = '';
    Class.RowSpan = [2.0 2.0];
    Class.ColSpan = [2.0 2.0];
    Class.Tag = 'Class';
    classValue = get(hIdp, 'Class');
    switch lower(classValue)
    case {'fi','embedded.fi'}
        Class.Type = 'text';
        Class.Name = 'embedded.fi';
    case 'struct'
        Class.Type = 'text';
        Class.Name = 'struct';
    otherwise
        Class.Type = 'combobox';
        classes = ctranspose(set(hIdp, 'Class'));
        charClasses = char(classes);
        charClasses(1.0:length(classes)) = upper(charClasses(1.0:length(classes)));
        classes = cellstr(charClasses);
        Class.Entries = ctranspose(classes);
        Class.ObjectProperty = 'Class';
        Class.Mode = 1.0;
        Class.DialogRefresh = 1.0;
    end % switch
    % 53 59
    % 54 59
    % 55 59
    % 56 59
    % 57 59
    SizeLbl.Name = 'Size:';
    SizeLbl.Type = 'text';
    SizeLbl.RowSpan = [3.0 3.0];
    SizeLbl.ColSpan = [1.0 1.0];
    SizeLbl.Tag = 'SizeLbl';
    % 63 65
    Size.Name = '';
    Size.Type = 'edit';
    Size.RowSpan = [3.0 3.0];
    Size.ColSpan = [2.0 2.0];
    Size.Tag = 'Size';
    % 69 71
    val = hIdp.Size;
    if isempty(val)
        val = [1.0 1.0];
    end % if
    Size.Value = horzcat('[', num2str(val), ']');
    Size.Mode = 1.0;
    Size.Visible = 1.0;
    Size.MatlabMethod = 'emlrt';
    Size.MatlabArgs = {'callproc','idpDlgCBRedirect','%dialog','%source','%value','%tag'};
    % 79 85
    % 80 85
    % 81 85
    % 82 85
    % 83 85
    Complexity.Name = 'Complex';
    Complexity.Type = 'checkbox';
    Complexity.RowSpan = [4.0 4.0];
    Complexity.ColSpan = [1.0 2.0];
    Complexity.Tag = 'Complex';
    Complexity.Mode = 1.0;
    % 90 92
    classValue = get(hIdp, 'Class');
    switch lower(classValue)
    case 'struct'
        Complexity.Visible = 0.0;
    otherwise
        Complexity.ObjectProperty = 'Complex';
        Complexity.Visible = 1.0;
    end % switch
    fimathTab = [];
    ntTab = [];
    switch lower(classValue)
    case {'fi','embedded.fi'}
        try
            if isempty(hIdp.fimath)
                hIdp.fimath = fimath;
            end % if
            % 107 109
        end % try
        try
            if isempty(hIdp.numerictype)
                hIdp.numerictype = numerictype;
            end % if
            % 113 115
        end % try
        % 115 136
        % 116 136
        % 117 136
        % 118 136
        % 119 136
        % 120 136
        % 121 136
        % 122 136
        % 123 136
        % 124 136
        % 125 136
        % 126 136
        % 127 136
        % 128 136
        % 129 136
        % 130 136
        % 131 136
        % 132 136
        % 133 136
        % 134 136
    end % switch
    % 136 142
    % 137 142
    % 138 142
    % 139 142
    % 140 142
    generalTab.Name = 'General';
    generalTab.LayoutGrid = [16.0 2.0];
    generalTab.RowStretch = [0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 1.0];
    generalTab.Source = hIdp;
    generalTab.Items = cellhorzcat(NameLbl, NameWgt, ClassLbl, Class, SizeLbl, Size, Complexity);
    % 146 148
    tabs.Name = 'Tabs';
    tabs.Type = 'tab';
    tabs.Tabs = cellhorzcat(generalTab);
    if not(isempty(fimathTab))
        tabs.Tabs{plus(end, 1.0)} = fimathTab;
    end % if
    if not(isempty(ntTab))
        tabs.Tabs{plus(end, 1.0)} = ntTab;
    end % if
    % 156 158
    panel.Name = '';
    panel.Type = 'panel';
    panel.Items = cellhorzcat(tabs);
    % 160 162
    dlgstruct.DialogTitle = horzcat('Data Property: ', hIdp.Name);
    dlgstruct.Items = cellhorzcat(panel);
    dlgstruct.SmartApply = true;
