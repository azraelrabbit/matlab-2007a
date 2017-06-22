function schema
    % 1 20
    % 2 20
    % 3 20
    % 4 20
    % 5 20
    % 6 20
    % 7 20
    % 8 20
    % 9 20
    % 10 20
    % 11 20
    % 12 20
    % 13 20
    % 14 20
    % 15 20
    % 16 20
    % 17 20
    % 18 20
    pkg = findpackage('spcwidgets');
    this = schema.class(pkg, 'uitoggletool');
    % 21 27
    % 22 27
    % 23 27
    % 24 27
    % 25 27
    schema.prop(this, 'ClickedCallback', 'MATLAB array');
    % 27 31
    % 28 31
    % 29 31
    p = schema.prop(this, 'Enable', 'on/off');
    p.FactoryValue = 'on';
    % 32 36
    % 33 36
    % 34 36
    p = schema.prop(this, 'Icons', 'MATLAB array');
    p.FactoryValue = {};
    p.SetFunction = @sf_icons;
    % 38 40
    schema.prop(this, 'OffCallback', 'MATLAB array');
    % 40 42
    schema.prop(this, 'OnCallback', 'MATLAB array');
    % 42 46
    % 43 46
    % 44 46
    schema.prop(this, 'Parent', 'MATLAB array');
    % 46 50
    % 47 50
    % 48 50
    p = schema.prop(this, 'Separator', 'on/off');
    p.FactoryValue = 'off';
    % 51 55
    % 52 55
    % 53 55
    p = schema.prop(this, 'State', 'on/off');
    p.FactoryValue = 'off';
    % 56 60
    % 57 60
    % 58 60
    schema.prop(this, 'Tag', 'string');
    % 60 64
    % 61 64
    % 62 64
    p = schema.prop(this, 'Tooltips', 'MATLAB array');
    p.FactoryValue = {};
    p.SetFunction = @sf_tooltips;
    % 66 68
    p = schema.prop(this, 'Type', 'string');
    p.FactoryValue = 'spcwidgets.uitoggletool';
    p.SetFunction = @sf_type;
    % 70 74
    % 71 74
    % 72 74
    p = schema.prop(this, 'Visible', 'on/off');
    p.FactoryValue = 'on';
    % 75 83
    % 76 83
    % 77 83
    % 78 83
    % 79 83
    % 80 83
    % 81 83
    p = schema.prop(this, 'hbutton', 'MATLAB array');
    p.Visible = 'off';
    p.AccessFlags.PublicSet = 'off';
    % 85 93
    % 86 93
    % 87 93
    % 88 93
    % 89 93
    % 90 93
    % 91 93
    p = schema.prop(this, 'listeners', 'handle.listener vector');
    p.Visible = 'off';
    p.AccessFlags.PublicSet = 'off';
end % function
function val = sf_tooltips(obj, val)
    % 97 104
    % 98 104
    % 99 104
    % 100 104
    % 101 104
    % 102 104
    if ischar(val)
        val = cellhorzcat(val);
    end % if
    % 106 108
    msg = {'spcwidgets:MustBeStringVector','Tooltips must be either a string or a cell-array of strings'};
    % 108 110
    if not(iscell(val))
        error(msg{:});
    end % if
    numTips = numel(val);
    for i=1.0:numTips
        if not(ischar(val{i}))
            error(msg{:});
        end % if
    end % for
    % 118 123
    % 119 123
    % 120 123
    % 121 123
    numIcons = numel(obj.Icons);
    if ne(numTips, numIcons) && gt(numTips, 1.0) && gt(numIcons, 1.0)
        error('spcwidgets:NumTooltipsAndIcons', 'Number of Tooltips (%d) and number of Icons (%d) are not compatible.\nThere must be the same number of Tooltips as Icons, or one of these\nmust be a single instance for scalar-expansion.', numTips, numIcons);
        % 125 130
        % 126 130
        % 127 130
        % 128 130
    end % if
end % function
function val = sf_icons(obj, val)
    % 132 143
    % 133 143
    % 134 143
    % 135 143
    % 136 143
    % 137 143
    % 138 143
    % 139 143
    % 140 143
    % 141 143
    if isnumeric(val)
        val = cellhorzcat(val);
    end % if
    % 145 147
    msg = {'spcwidgets:InvalidIcons','Icons must be either an array or a cell-array of arrays'};
    % 147 149
    if not(iscell(val))
        error(msg{:});
    end % if
    numIcons = numel(val);
    for i=1.0:numIcons
        if not(isnumeric(val{i}))
            error(msg{:});
        end % if
    end % for
    % 157 162
    % 158 162
    % 159 162
    % 160 162
    numTips = numel(obj.Tooltips);
    if ne(numTips, numIcons) && gt(numTips, 1.0) && gt(numIcons, 1.0)
        error('spcwidgets:NumTooltipsAndIcons', 'Number of Icons (%d) and number of Tooltips (%d) are not compatible.\nThere must be the same number of Icons as Tooltips, or one of these\nmust be a single instance for scalar-expansion.', numIcons, numTips);
        % 164 169
        % 165 169
        % 166 169
        % 167 169
    end % if
end % function
function val = sf_type(obj, val)
    % 171 173
    if not(isempty(obj.Type))
        error('Property is read-only.');
    end % if
end % function
