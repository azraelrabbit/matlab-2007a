function schema
    % 1 18
    % 2 18
    % 3 18
    % 4 18
    % 5 18
    % 6 18
    % 7 18
    % 8 18
    % 9 18
    % 10 18
    % 11 18
    % 12 18
    % 13 18
    % 14 18
    % 15 18
    % 16 18
    pkg = findpackage('spcwidgets');
    this = schema.class(pkg, 'uipushtool');
    % 19 26
    % 20 26
    % 21 26
    % 22 26
    % 23 26
    % 24 26
    p = schema.prop(this, 'AutoCycle', 'on/off');
    p.FactoryValue = 'off';
    % 27 31
    % 28 31
    % 29 31
    schema.prop(this, 'ClickedCallback', 'MATLAB array');
    % 31 35
    % 32 35
    % 33 35
    p = schema.prop(this, 'Enable', 'on/off');
    p.FactoryValue = 'on';
    % 36 40
    % 37 40
    % 38 40
    p = schema.prop(this, 'Icons', 'MATLAB array');
    p.FactoryValue = {};
    p.SetFunction = @sf_icons;
    % 42 46
    % 43 46
    % 44 46
    p = schema.prop(this, 'Parent', 'MATLAB array');
    % 46 50
    % 47 50
    % 48 50
    p = schema.prop(this, 'Selection', 'double');
    p.FactoryValue = 1.0;
    p.SetFunction = @sf_selection;
    % 52 56
    % 53 56
    % 54 56
    p = schema.prop(this, 'Separator', 'on/off');
    p.FactoryValue = 'off';
    % 57 61
    % 58 61
    % 59 61
    schema.prop(this, 'Tag', 'string');
    % 61 65
    % 62 65
    % 63 65
    p = schema.prop(this, 'Tooltips', 'MATLAB array');
    p.FactoryValue = {};
    p.SetFunction = @sf_tooltips;
    % 67 69
    p = schema.prop(this, 'Type', 'string');
    p.FactoryValue = 'spcwidgets.uipushtool';
    p.SetFunction = @sf_type;
    % 71 75
    % 72 75
    % 73 75
    p = schema.prop(this, 'Visible', 'on/off');
    p.FactoryValue = 'on';
    % 76 84
    % 77 84
    % 78 84
    % 79 84
    % 80 84
    % 81 84
    % 82 84
    p = schema.prop(this, 'hbutton', 'MATLAB array');
    p.Visible = 'off';
    p.AccessFlags.PublicSet = 'off';
    % 86 94
    % 87 94
    % 88 94
    % 89 94
    % 90 94
    % 91 94
    % 92 94
    p = schema.prop(this, 'listeners', 'handle.listener vector');
    p.Visible = 'off';
    p.AccessFlags.PublicSet = 'off';
end % function
function val = sf_tooltips(obj, val)
    % 98 105
    % 99 105
    % 100 105
    % 101 105
    % 102 105
    % 103 105
    if ischar(val)
        val = cellhorzcat(val);
    end % if
    % 107 109
    msg = {'spcwidgets:MustBeStringVector','Tooltips must be either a string or a cell-array of strings'};
    % 109 111
    if not(iscell(val))
        error(msg{:});
    end % if
    numTips = numel(val);
    for i=1.0:numTips
        if not(ischar(val{i}))
            error(msg{:});
        end % if
    end % for
    % 119 124
    % 120 124
    % 121 124
    % 122 124
    numIcons = numel(obj.Icons);
    if ne(numTips, numIcons) && gt(numTips, 1.0) && gt(numIcons, 1.0)
        error('spcwidgets:NumTooltipsAndIcons', 'Number of Tooltips (%d) and number of Icons (%d) are not compatible.\nThere must be the same number of Tooltips as Icons, or one of these\nmust be a single instance for scalar-expansion.', numTips, numIcons);
        % 126 131
        % 127 131
        % 128 131
        % 129 131
    end % if
end % function
function val = sf_icons(obj, val)
    % 133 144
    % 134 144
    % 135 144
    % 136 144
    % 137 144
    % 138 144
    % 139 144
    % 140 144
    % 141 144
    % 142 144
    if isnumeric(val)
        val = cellhorzcat(val);
    end % if
    % 146 148
    msg = {'spcwidgets:InvalidIcons','Icons must be either an array or a cell-array of arrays'};
    % 148 150
    if not(iscell(val))
        error(msg{:});
    end % if
    numIcons = numel(val);
    for i=1.0:numIcons
        if not(isnumeric(val{i}))
            error(msg{:});
        end % if
    end % for
    % 158 163
    % 159 163
    % 160 163
    % 161 163
    numTips = numel(obj.Tooltips);
    if ne(numTips, numIcons) && gt(numTips, 1.0) && gt(numIcons, 1.0)
        error('spcwidgets:NumTooltipsAndIcons', 'Number of Icons (%d) and number of Tooltips (%d) are not compatible.\nThere must be the same number of Icons as Tooltips, or one of these\nmust be a single instance for scalar-expansion.', numIcons, numTips);
        % 165 170
        % 166 170
        % 167 170
        % 168 170
    end % if
end % function
function val = sf_selection(obj, val)
    % 172 179
    % 173 179
    % 174 179
    % 175 179
    % 176 179
    % 177 179
    maxSel = max(horzcat(1.0, numel(obj.Icons), numel(obj.Tooltips)));
    if lt(val, 1.0) || gt(val, maxSel)
        error('spcwidgets:InvalidSelection', 'Invalid Selection value - valid range is 1 to %d', maxSel);
        % 181 183
    end % if
end % function
function val = sf_type(obj, val)
    % 185 187
    if not(isempty(obj.Type))
        error('Property is read-only.');
    end % if
end % function
