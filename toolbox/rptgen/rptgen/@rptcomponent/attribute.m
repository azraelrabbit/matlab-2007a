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
    case 'editenter'
        c = LocEditEnter(c);
    case 'popselect'
        c = LocPopSelect(c);
    case 'mindisplaysize'
        c = MinDisplaySize(c);
    case 'lbselect'
        c = LocLBSelect(c);
    case 'refresh'
        c = LocRefresh(c);
    case 'resize'
        c = LocResize(c);
    otherwise
        % 24 26
    end
end
function c = LocStartGUI(c)
    % 28 31
    % 29 31
    info = getinfo(c);
    x = subsref(c, substruct('.', 'x'));
    % 32 34
    info = getinfo(c);
    if isstruct(info.att)
        x.attstr = fieldnames(info.att);
    else
        x.attstr = {};
    end
    % 39 41
    c = subsasgn(c, substruct('.', 'x'), x);
    x.lbstruct = LocMakeLBStruct(c);
    c = subsasgn(c, substruct('.', 'x'), x);
    % 43 45
    lbstring = locgetlbstring(c);
    % 45 47
    x.desctext = uicontrol(x.all, 'style', 'text', 'string', horzcat(info.Name, ': ', info.Desc), 'HorizontalAlignment', 'left');
    % 47 52
    % 48 52
    % 49 52
    % 50 52
    x.listbox = uicontrol(x.all, 'style', 'listbox', 'string', ctranspose(lbstring), 'FontName', fixedwidthfont(c), 'Callback', horzcat(x.getobj, '''lbselect'');'), 'BackgroundColor', [1.0 1.0 1.0], 'Value', 1.0);
    % 52 60
    % 53 60
    % 54 60
    % 55 60
    % 56 60
    % 57 60
    % 58 60
    x.editbox = uicontrol(x.all, 'HorizontalAlignment', 'left', 'TooltipString', 'Edit attribute values here', 'BackgroundColor', [1.0 1.0 1.0]);
    % 60 65
    % 61 65
    % 62 65
    % 63 65
    c = subsasgn(c, substruct('.', 'x'), x);
    % 65 67
    c = LocLBSelect(c);
    c = LocResize(c);
end
function c = LocRefresh(c)
end
function c = LocResize(c)
    % 72 79
    % 73 79
    % 74 79
    % 75 79
    % 76 79
    % 77 79
    pad = 10.0;
    x = subsref(c, substruct('.', 'x'));
    % 80 83
    % 81 83
    tabwidth = minus(x.xext, x.xzero);
    tabht = minus(x.ylim, x.yorig);
    % 84 86
    barht = 15.0;
    descHt = min(mtimes(2.0, barht), mtimes(tabht, .1));
    % 87 89
    listHt = min(minus(minus(minus(tabht, mtimes(2.0, pad)), descHt), barht), mtimes(barht, plus(length(x.attstr), 2.0)));
    % 89 91
    pos = horzcat(plus(x.xzero, pad), minus(x.ylim, descHt), minus(tabwidth, mtimes(2.0, pad)), descHt);
    set(x.desctext, 'Position', pos);
    % 92 94
    pos(4.0) = listHt;
    pos(2.0) = minus(pos(2.0), pos(4.0));
    set(x.listbox, 'Position', pos);
    % 96 98
    pos(4.0) = barht;
    pos(2.0) = minus(pos(2.0), barht);
    set(x.editbox, 'Position', pos);
end
function ms = MinDisplaySize(c)
    % 102 106
    % 103 106
    % 104 106
    ms = [40.0 60.0];
end
function c = LocPopSelect(c)
    % 108 111
    % 109 111
    x = subsref(c, substruct('.', 'x'));
    % 111 114
    % 112 114
    menustring = get(x.editbox, 'String');
    menuvals = get(x.editbox, 'UserData');
    index = get(x.editbox, 'Value');
    % 116 118
    currattindex = get(x.listbox, 'Value');
    % 118 120
    c = subsasgn(c, substruct('.', 'att', '.', x.attstr{currattindex}), menuvals{index});
    % 120 124
    % 121 124
    % 122 124
    x.lbstruct = setfield(x.lbstruct, x.attstr{currattindex}, menustring{index});
    % 124 128
    % 125 128
    % 126 128
    c = subsasgn(c, substruct('.', 'x'), x);
    % 128 130
    set(x.listbox, 'string', locgetlbstring(c))
end
function c = LocEditEnter(c)
    % 132 135
    % 133 135
    x = subsref(c, substruct('.', 'x'));
    % 135 137
    currattindex = get(x.listbox, 'Value');
    % 137 140
    % 138 140
    stringval = get(x.editbox, 'String');
    type = get(x.editbox, 'UserData');
    % 141 144
    % 142 144
    [washval, ok] = locstr2val(stringval, type);
    % 144 146
    if ok
        c = subsasgn(c, substruct('.', 'att', '.', x.attstr{currattindex}), washval);
        % 147 151
        % 148 151
        % 149 151
        x.lbstruct = setfield(x.lbstruct, x.attstr{currattindex}, stringval);
    else
        oldval = subsref(c, substruct('.', 'att', '.', x.attstr{currattindex}));
        set(x.editbox, 'String', oldval);
    end
    % 155 157
    c = subsasgn(c, substruct('.', 'x'), x);
    % 157 159
    set(x.listbox, 'string', locgetlbstring(c))
end
function c = LocLBSelect(c)
    % 161 164
    % 162 164
    x = subsref(c, substruct('.', 'x'));
    % 164 166
    info = getinfo(c);
    % 166 168
    currattindex = get(x.listbox, 'Value');
    % 168 170
    if not(isempty(x.attstr))
        val = subsref(c, substruct('.', 'att', '.', x.attstr{currattindex}));
        attx = getattx(c, x.attstr{currattindex});
        switch lower(attx.UIcontrol)
        case {'popupmenu','listbox','radiobutton','checkbox'}
            c = LocPopup(c, attx.enumNames, attx.enumValues, val);
        case {'edit','slider'}
            c = LocEdit(c, attx, val);
        end
    else
        set(x.listbox, 'Enable', 'off')
        set(x.editbox, 'Style', 'edit', 'Enable', 'off')
    end
    % 182 184
    c = subsasgn(c, substruct('.', 'x'), x);
end
function c = LocPopup(c, menutext, menuvals, val)
    % 186 190
    % 187 190
    % 188 190
    x = subsref(c, substruct('.', 'x'));
    % 190 192
    index = findinlist(c, menuvals, val);
    if lt(index, 1.0)
        index = 1.0;
    end
    % 195 197
    set(x.editbox, 'Style', 'popupmenu', 'Enable', 'on', 'String', menutext, 'Callback', horzcat(x.getobj, '''popselect'');'), 'Value', index, 'UserData', menuvals);
    % 197 205
    % 198 205
    % 199 205
    % 200 205
    % 201 205
    % 202 205
    % 203 205
    c = subsasgn(c, substruct('.', 'x'), x);
end
function c = LocEdit(c, attx, val)
    % 207 212
    % 208 212
    % 209 212
    % 210 212
    x = subsref(c, substruct('.', 'x'));
    % 212 215
    % 213 215
    [str, type] = locVal2Str(val, attx.Type);
    % 215 217
    if strcmpi(type, 'OTHER')
        edenable = 'off';
    else
        edenable = 'on';
    end
    % 221 223
    set(x.editbox, 'Style', 'edit', 'String', str, 'Callback', horzcat(x.getobj, '''editenter'');'), 'Enable', edenable, 'UserData', type);
    % 223 228
    % 224 228
    % 225 228
    % 226 228
end
function lbStruct = LocMakeLBStruct(c)
    % 229 233
    % 230 233
    % 231 233
    x = subsref(c, substruct('.', 'x'));
    % 233 235
    info = getinfo(c);
    % 235 237
    lbStruct = {};
    % 237 239
    for i=1.0:length(x.attstr)
        att = x.attstr{i};
        val = subsref(c, substruct('.', 'att', '.', x.attstr{i}));
        attx = getattx(c, x.attstr{i});
        % 242 244
        switch upper(attx.Type)
        case 'LOGICAL'
            if val
                stringval = 'True';
            else
                stringval = 'False';
            end
        case 'ENUM'
            index = findinlist(c, attx.enumValues, val);
            if lt(index, 1.0)
                [stringval, type] = locVal2Str(val);
            else
                stringval = attx.enumNames{index};
            end
        otherwise
            [stringval, type] = locVal2Str(val, attx.Type);
        end
        % 260 262
        lbStruct = setfield(lbStruct, att, stringval);
    end % for
end
function ListString = locgetlbstring(c)
    % 265 269
    % 266 269
    % 267 269
    x = subsref(c, substruct('.', 'x'));
    % 269 272
    % 270 272
    ListString = makepvstring(c, x.lbstruct);
end
function [string, type] = locVal2Str(val, type)
    % 274 278
    % 275 278
    % 276 278
    if lt(nargin, 2.0)
        if islogical(val)
            type = 'LOGICAL';
        else
            if isnumeric(val)
                type = 'NUMBER';
            else
                if ischar(val)
                    type = 'STRING';
                else
                    if iscell(val)
                        type = 'CELL';
                    else
                        type = 'OTHER';
                    end
                end
            end
        end
    end
    switch upper(type)
    case 'STRING'
        string = strrep(val, sprintf('\n'), ' ');
    case {'NUMBER','LOGICAL'}
        if gt(size(val, 1.0), 1.0)
            [string, type] = locVal2Str(val, 'OTHER');
        else
            string = num2str(val);
        end
    case 'ENUM'
        [string, type] = locVal2Str(val);
    case 'CELL'
        string = '{';
        for i=1.0:size(val, 1.0)
            for j=1.0:size(val, 2.0)
                [tempstr, temptype] = locVal2Str(val{i, j});
                switch upper(temptype)
                case 'STRING'
                    string = horzcat(string, ' ''', tempstr, ''' ');
                case 'NUMBER'
                    string = horzcat(string, ' [', tempstr, '] ');
                case 'LOGICAL'
                    string = horzcat(string, ' logical([', tempstr, ']) ');
                case 'CELL'
                    string = horzcat(string, ' ', tempstr, ' ');
                case 'OTHER'
                    string = horzcat(string, ' ', tempstr, ' ');
                    type = 'OTHER';
                end
            end % for
            string = horzcat(string, ' ; ');
        end % for
        string = horzcat(string, '}');
    case 'OTHER'
        eval('w=whos(''val'');')
        string = horzcat('[', num2str(w.size(1.0)), 'x', num2str(w.size(2.0)), ' ', w.class, ']');
    end
end
function [val, ok] = locstr2val(str, type)
    val = '';
    ok = logical(1);
    switch type
    case 'STRING'
        val = str;
    case 'NUMBER'
        val = str2double(str);
    case 'CELL'
        try
            val = eval(str);
        catch
            ok = logical(0);
        end % try
    end
end
