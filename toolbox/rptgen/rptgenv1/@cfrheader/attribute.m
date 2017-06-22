function c = attribute(c, action, varargin)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    switch lower(action)
    case 'start'
        c = LocStartGUI(c);
    case 'updatecomp'
        c = LocUpdateComp(c);
    case 'resize'
        c = LocResize(c);
    otherwise
        % 16 18
    end % switch
end % function
function c = LocStartGUI(c)
    % 20 23
    % 21 23
    info = getinfo(c);
    % 23 25
    c.x.sourcetype = uicontrol(c.x.all, 'style', 'text', 'horizontalalignment', 'left');
    % 25 28
    % 26 28
    c.x.sourceedit = uicontrol(c.x.all, 'style', 'edit', 'BackgroundColor', [1.0 1.0 1.0], 'HorizontalAlignment', 'left', 'Callback', horzcat(c.x.getobj, '''updatecomp'');'), 'String', c.att.headertext);
    % 28 35
    % 29 35
    % 30 35
    % 31 35
    % 32 35
    % 33 35
    c.x.weighttext = uicontrol(c.x.all, 'style', 'text', 'HorizontalAlignment', 'left', 'String', 'Header Size');
    % 35 40
    % 36 40
    % 37 40
    % 38 40
    a = getattx(c, 'weight');
    index = find(strcmp(a.enumValues, c.att.weight));
    if gt(length(index), 0.0)
        index = index(1.0);
    else
        index = 1.0;
    end % if
    % 46 48
    c.x.weightpop = uicontrol(c.x.all, 'style', 'popupmenu', 'Callback', horzcat(c.x.getobj, '''updatecomp'');'), 'BackgroundColor', [1.0 1.0 1.0], 'Value', index, 'UserData', a.enumValues, 'String', a.enumNames);
    % 48 74
    % 49 74
    % 50 74
    % 51 74
    % 52 74
    % 53 74
    % 54 74
    % 55 74
    % 56 74
    % 57 74
    % 58 74
    % 59 74
    % 60 74
    % 61 74
    % 62 74
    % 63 74
    % 64 74
    % 65 74
    % 66 74
    % 67 74
    % 68 74
    % 69 74
    % 70 74
    % 71 74
    % 72 74
    c.x.exdtext = uicontrol(c.x.all, 'style', 'text', 'HorizontalAlignment', 'left', 'String', 'Header Preview');
    % 74 78
    % 75 78
    % 76 78
    c.x.exframe = uicontrol(c.x.all, 'style', 'frame', 'BackgroundColor', [1.0 1.0 1.0]);
    % 78 81
    % 79 81
    c.x.exhtext = uicontrol(c.x.all, 'BackgroundColor', [1.0 1.0 1.0], 'style', 'text');
    % 81 85
    % 82 85
    % 83 85
    c = LocResize(c);
end % function
function c = refresh(c)
end % function
function c = LocResize(c)
    % 89 95
    % 90 95
    % 91 95
    % 92 95
    % 93 95
    barht = 15.0;
    pad = 10.0;
    tabwidth = minus(c.x.xext, c.x.xzero);
    % 97 99
    pos = horzcat(plus(c.x.xzero, pad), minus(c.x.ylim, barht), minus(tabwidth, mtimes(2.0, pad)), barht);
    set(c.x.sourcetype, 'Position', pos);
    % 100 102
    pos = horzcat(plus(c.x.xzero, mtimes(3.0, pad)), minus(pos(2.0), barht), minus(tabwidth, mtimes(5.0, pad)), barht);
    set(c.x.sourceedit, 'Position', pos);
    % 103 105
    descwidth = 60.0;
    popwidth = 100.0;
    % 106 108
    pos = horzcat(plus(c.x.xzero, pad), minus(pos(2.0), mtimes(2.0, barht)), descwidth, barht);
    set(c.x.weighttext, 'Position', pos);
    % 109 111
    pos = horzcat(plus(pos(1.0), pos(3.0)), pos(2.0), popwidth, barht);
    set(c.x.weightpop, 'Position', pos);
    % 112 120
    % 113 120
    % 114 120
    % 115 120
    % 116 120
    % 117 120
    % 118 120
    pos = horzcat(plus(c.x.xzero, pad), minus(pos(2.0), mtimes(2.0, barht)), descwidth, barht);
    set(c.x.exdtext, 'Position', pos);
    % 121 123
    frameht = mtimes(5.0, barht);
    pos = horzcat(plus(c.x.xzero, mtimes(2.0, pad)), minus(pos(2.0), frameht), minus(tabwidth, mtimes(4.0, pad)), frameht);
    set(c.x.exframe, 'Position', pos);
    % 125 127
    texht = mtimes(3.0, barht);
    % 127 129
    pos = horzcat(plus(c.x.xzero, mtimes(3.0, pad)), plus(pos(2.0), mrdivide(minus(frameht, texht), 2.0)), minus(tabwidth, mtimes(6.0, pad)), texht);
    set(c.x.exhtext, 'Position', pos);
    % 130 132
    c = LocUpdateComp(c);
end % function
function c = LocUpdateComp(c)
    % 134 138
    % 135 138
    % 136 138
    c.att.headertext = get(c.x.sourceedit, 'String');
    if eq(numsubcomps(c), 0.0)
        % 139 141
        set(c.x.sourcetype, 'String', 'Header text determined from string:');
        set(c.x.sourceedit, 'Enable', 'on');
        set(c.x.exhtext, 'String', c.att.headertext);
    else
        % 144 146
        set(c.x.sourcetype, 'String', 'Header text determined from subcomponents');
        set(c.x.sourceedit, 'Enable', 'off');
        set(c.x.exhtext, 'String', 'An Example Header');
    end % if
    % 149 151
    weightindex = get(c.x.weightpop, 'Value');
    weightvalues = get(c.x.weightpop, 'UserData');
    c.att.weight = weightvalues{weightindex};
    % 153 159
    % 154 159
    % 155 159
    % 156 159
    % 157 159
    basesize = get(c.x.sourcetype, 'Fontsize');
    fontpoints = floor(mtimes(basesize, [2.5 2.5 2.0 1.5 1.0 .5]));
    set(c.x.exhtext, 'FontSize', fontpoints(weightindex), 'HorizontalAlignment', 'left');
    % 161 163
end % function
