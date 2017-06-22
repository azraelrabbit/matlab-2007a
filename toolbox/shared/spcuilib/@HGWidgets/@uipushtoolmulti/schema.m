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
    pkg = findpackage('HGWidgets');
    this = schema.class(pkg, 'uipushtoolmulti');
    % 21 25
    % 22 25
    % 23 25
    p = schema.prop(this, 'hbutton', 'MATLAB array');
    % 25 29
    % 26 29
    % 27 29
    p = schema.prop(this, 'parent', 'MATLAB array');
    % 29 33
    % 30 33
    % 31 33
    p = schema.prop(this, 'Enable', 'on/off');
    p.FactoryValue = 'on';
    % 34 38
    % 35 38
    % 36 38
    p = schema.prop(this, 'Icons', 'MATLAB array');
    p.FactoryValue = {};
    p.SetFunction = @sf_icons;
    % 40 44
    % 41 44
    % 42 44
    p = schema.prop(this, 'Tooltips', 'MATLAB array');
    p.FactoryValue = {};
    p.SetFunction = @sf_tooltips;
    % 46 50
    % 47 50
    % 48 50
    p = schema.prop(this, 'Separator', 'on/off');
    p.FactoryValue = 'off';
    % 51 55
    % 52 55
    % 53 55
    p = schema.prop(this, 'Selection', 'double');
    p.FactoryValue = 1.0;
    p.SetFunction = @sf_selection;
    % 57 61
    % 58 61
    % 59 61
    p = schema.prop(this, 'ClickedCallback', 'MATLAB array');
    % 61 69
    % 62 69
    % 63 69
    % 64 69
    % 65 69
    % 66 69
    % 67 69
    p = schema.prop(this, 'listeners', 'handle.listener vector');
end % function
function val = sf_tooltips(obj, val)
    % 71 78
    % 72 78
    % 73 78
    % 74 78
    % 75 78
    % 76 78
    if ischar(val)
        val = cellhorzcat(val);
    end % if
    % 80 82
    msg = 'Tooltips must be either a string or a cell-array of strings';
    if not(iscell(val))
        error(msg);
    end % if
    numTips = numel(val);
    for i=1.0:numTips
        if not(ischar(val{i}))
            error(msg);
        end % if
    end % for
    % 91 96
    % 92 96
    % 93 96
    % 94 96
    numIcons = numel(obj.Icons);
    if ne(numTips, numIcons) && gt(numTips, 1.0) && gt(numIcons, 1.0)
        error('Number of Tooltips (%d) and number of Icons (%d) are not compatible.\nThere must be the same number of Tooltips as Icons, or one of these\nmust be a single instance for scalar-expansion.', numTips, numIcons);
        % 98 102
        % 99 102
        % 100 102
    end % if
end % function
function val = sf_icons(obj, val)
    % 104 115
    % 105 115
    % 106 115
    % 107 115
    % 108 115
    % 109 115
    % 110 115
    % 111 115
    % 112 115
    % 113 115
    if isnumeric(val)
        val = cellhorzcat(val);
    end % if
    % 117 119
    msg = 'Icons must be either an array or a cell-array of arrays';
    if not(iscell(val))
        error(msg);
    end % if
    numIcons = numel(val);
    for i=1.0:numIcons
        if not(isnumeric(val{i}))
            error(msg);
        end % if
    end % for
    % 128 133
    % 129 133
    % 130 133
    % 131 133
    numTips = numel(obj.Tooltips);
    if ne(numTips, numIcons) && gt(numTips, 1.0) && gt(numIcons, 1.0)
        error('Number of Icons (%d) and number of Tooltips (%d) are not compatible.\nThere must be the same number of Icons as Tooltips, or one of these\nmust be a single instance for scalar-expansion.', numIcons, numTips);
        % 135 139
        % 136 139
        % 137 139
    end % if
end % function
function val = sf_selection(obj, val)
    % 141 148
    % 142 148
    % 143 148
    % 144 148
    % 145 148
    % 146 148
    maxSel = max(horzcat(1.0, numel(obj.Icons), numel(obj.Tooltips)));
    if lt(val, 1.0) || gt(val, maxSel)
        error('Invalid value of "Selection" - valid range is 1 to %d', maxSel);
    end % if
end % function
