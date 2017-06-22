function dlgstruct = InputDataPropertyDialog(hIdp, name)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    ClassLbl.Name = 'Class:';
    ClassLbl.Type = 'text';
    ClassLbl.RowSpan = [1.0 1.0];
    ClassLbl.ColSpan = [1.0 1.0];
    ClassLbl.Tag = 'ClassLbl';
    % 14 15
    Class.Name = '';
    Class.RowSpan = [1.0 1.0];
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
    % 38 44
    % 39 44
    % 40 44
    % 41 44
    % 42 44
    % 43 44
    SizeLbl.Name = 'Size:';
    SizeLbl.Type = 'text';
    SizeLbl.RowSpan = [2.0 2.0];
    SizeLbl.ColSpan = [1.0 1.0];
    SizeLbl.Tag = 'SizeLbl';
    % 49 50
    Size.Name = '';
    Size.Type = 'edit';
    Size.RowSpan = [2.0 2.0];
    Size.ColSpan = [2.0 2.0];
    Size.Tag = 'Size';
    Size.ObjectProperty = 'Size';
    Size.Mode = 1.0;
    Size.Visible = 1.0;
    % 58 63
    % 59 63
    % 60 63
    % 61 63
    % 62 63
    Complexity.Name = 'Complex';
    Complexity.Type = 'checkbox';
    Complexity.RowSpan = [3.0 3.0];
    Complexity.ColSpan = [1.0 2.0];
    Complexity.Tag = 'Complex';
    Complexity.ObjectProperty = 'Complex';
    Complexity.Mode = 1.0;
    Complexity.Visible = 1.0;
    % 71 72
    classValue = get(hIdp, 'Class');
    switch lower(classValue)
    case {'fi','embedded.fi'}
        try
            if isempty(hIdp.fimath)
                hIdp.fimath = fimath;
            end % if
            % 79 80
        end % try
        try
            if isempty(hIdp.numerictype)
                hIdp.numerictype = numerictype;
            end % if
            % 85 86
        end % try
    case 'struct'
        Complexity.Visible = 0.0;
    end % switch
    % 90 94
    % 91 94
    % 92 94
    % 93 94
    dlgstruct.DialogTitle = horzcat('Data Property: ', hIdp.Name);
    dlgstruct.Items = cellhorzcat(ClassLbl, Class, SizeLbl, Size, Complexity);
    % 96 97
    dlgstruct.LayoutGrid = [16.0 2.0];
    dlgstruct.RowStretch = [0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 1.0];
    dlgstruct.ColStretch = [0.0 1.0];
    dlgstruct.SmartApply = true;
    dlgstruct.HelpMethod = 'helpview';
    dlgstruct.HelpArgs = cellhorzcat(horzcat(docroot, '/toolbox/fixedpoint/ug/bqdcd5l.html'));
end % function
