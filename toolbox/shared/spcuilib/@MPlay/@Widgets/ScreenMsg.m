function y = ScreenMsg(widgetsObj, arg)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    if gt(nargin, 1.0)
        % 11 14
        % 12 14
        htxt = widgetsObj.himageTxt;
        himg = widgetsObj.himage;
        % 15 17
        if ischar(arg) || iscell(arg)
            % 17 21
            % 18 21
            % 19 21
            set(himg, 'vis', 'off');
            % 21 27
            % 22 27
            % 23 27
            % 24 27
            % 25 27
            txt = ReformatText(arg, MaxTextWidth(widgetsObj));
            set(htxt, 'vis', 'on', 'string', txt, 'userdata', arg);
        else
            % 29 33
            % 30 33
            % 31 33
            if islogical(arg)
                % 33 38
                % 34 38
                % 35 38
                % 36 38
                if arg
                    sw_txt = 'on';
                    sw_vid = 'off';
                else
                    sw_txt = 'off';
                    sw_vid = 'on';
                end
                set(htxt, 'vis', sw_txt);
                set(himg, 'vis', sw_vid);
                if sw_txt
                    txt = get(widgetsObj.himageTxt, 'userdata');
                    txt = ReformatText(txt, MaxTextWidth(widgetsObj));
                    set(htxt, 'string', txt);
                end
            else
                error('assert: unsupported option');
            end
        end
    else
        % 56 59
        % 57 59
        y = strcmpi(get(widgetsObj.himageTxt, 'vis'), 'on');
    end
end
function strs = ReformatText(strs, maxchars)
    % 62 68
    % 63 68
    % 64 68
    % 65 68
    % 66 68
    if not(iscell(strs))
        % 68 70
        if isempty(strs)
            strs = '';
        end
        strs = cellhorzcat(strs);
    end
    for i=1.0:numel(strs)
        strs{i} = strtrim(strs{i});
    end % for
    % 77 86
    % 78 86
    % 79 86
    % 80 86
    % 81 86
    % 82 86
    % 83 86
    % 84 86
    i = 1.0;
    while lt(i, numel(strs))
        if not(isempty(strs{i})) && not(isempty(strs{plus(i, 1.0)}))
            % 88 90
            strs(i) = cellhorzcat(horzcat(strs{i}, ' ', strs{plus(i, 1.0)}));
            strs(plus(i, 1.0)) = [];
        else
            i = plus(i, 1.0);
        end
    end % while
    % 95 99
    % 96 99
    % 97 99
    tmp = {};
    for i=1.0:numel(strs)
        % 100 102
        tmp = vertcat(tmp, SplitStr(strs{i}, maxchars));
    end % for
    strs = tmp;
end
function t = SplitStr(s, maxchars)
    % 106 110
    % 107 110
    % 108 110
    if isempty(s)
        t = cellhorzcat(s);
    else
        t = {};
        while gt(numel(s), maxchars)
            % 114 119
            % 115 119
            % 116 119
            % 117 119
            ispace = find(eq(s(1.0:plus(maxchars, 1.0)), ' '));
            if isempty(ispace)
                % 120 123
                % 121 123
                t = vertcat(t, cellhorzcat(horzcat(s(1.0:minus(maxchars, 1.0)), '-')));
                s = s(maxchars:end);
            else
                % 125 128
                % 126 128
                t = vertcat(t, cellhorzcat(s(1.0:minus(ispace(end), 1.0))));
                s = strtrim(s(plus(ispace(end), 1.0):end));
            end
        end % while
        if not(isempty(s))
            t = vertcat(t, cellhorzcat(s));
        end
    end
end
function w = MaxTextWidth(widgetsObj)
    % 137 142
    % 138 142
    % 139 142
    % 140 142
    htxt = widgetsObj.himageTxt;
    hax = widgetsObj.haxis;
    % 143 146
    % 144 146
    hfig = widgetsObj.hfig;
    set(hfig, 'units', 'pix');
    pos = get(hfig, 'pos');
    % 148 159
    % 149 159
    % 150 159
    % 151 159
    % 152 159
    % 153 159
    % 154 159
    % 155 159
    % 156 159
    % 157 159
    set(htxt, 'units', 'pix', 'string', 'm');
    ext = get(htxt, 'extent');
    set(htxt, 'units', 'norm');
    % 161 167
    % 162 167
    % 163 167
    % 164 167
    % 165 167
    w = max(8.0, floor(rdivide(mtimes(.9, pos(3.0)), minus(ext(3.0), 2.0))));
end
