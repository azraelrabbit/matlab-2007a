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
    this = schema.class(pkg, 'uitoggletoolmulti');
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
    p = schema.prop(this, 'State', 'on/off');
    p.FactoryValue = 'off';
    % 56 60
    % 57 60
    % 58 60
    p = schema.prop(this, 'oncallback', 'MATLAB array');
    p = schema.prop(this, 'offcallback', 'MATLAB array');
    p = schema.prop(this, 'clickedcallback', 'MATLAB array');
    % 62 70
    % 63 70
    % 64 70
    % 65 70
    % 66 70
    % 67 70
    % 68 70
    p = schema.prop(this, 'listeners', 'handle.listener vector');
end % function
function val = sf_tooltips(obj, val)
    % 72 79
    % 73 79
    % 74 79
    % 75 79
    % 76 79
    % 77 79
    if ischar(val)
        val = cellhorzcat(val);
    end % if
    % 81 83
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
    % 92 97
    % 93 97
    % 94 97
    % 95 97
    numIcons = numel(obj.Icons);
    if ne(numTips, numIcons) && gt(numTips, 1.0) && gt(numIcons, 1.0)
        error('Number of Tooltips (%d) and number of Icons (%d) are not compatible.\nThere must be the same number of Tooltips as Icons, or one of these\nmust be a single instance for scalar-expansion.', numTips, numIcons);
        % 99 103
        % 100 103
        % 101 103
    end % if
end % function
function val = sf_icons(obj, val)
    % 105 116
    % 106 116
    % 107 116
    % 108 116
    % 109 116
    % 110 116
    % 111 116
    % 112 116
    % 113 116
    % 114 116
    if isnumeric(val)
        val = cellhorzcat(val);
    end % if
    % 118 120
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
    % 129 134
    % 130 134
    % 131 134
    % 132 134
    numTips = numel(obj.Tooltips);
    if ne(numTips, numIcons) && gt(numTips, 1.0) && gt(numIcons, 1.0)
        error('Number of Icons (%d) and number of Tooltips (%d) are not compatible.\nThere must be the same number of Icons as Tooltips, or one of these\nmust be a single instance for scalar-expansion.', numIcons, numTips);
        % 136 140
        % 137 140
        % 138 140
    end % if
end % function
