function y = OptionText(h, idx, str)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    error(nargchk(2.0, 3.0, nargin));
    CheckOptionIndex(h, idx);
    % 13 18
    % 14 18
    % 15 18
    % 16 18
    % 17 18
    hTxt = h.hOptionText(idx);
    % 19 20
    if lt(nargin, 3.0)
        % 21 24
        % 22 24
        % 23 24
        y = get(hTxt, 'OptionOrigString');
    else
        % 26 30
        % 27 30
        % 28 30
        % 29 30
        set(hTxt, 'OptionOrigString', str);
        % 31 32
        if strcmpi(get(hTxt, 'OptionTruncate'), 'on')
            % 33 35
            % 34 35
            renderTextWithEllipsis(h, idx, str);
        else
            % 37 39
            % 38 39
            set(hTxt, 'string', str);
        end % if
    end % if
end % function
function renderTextWithEllipsis(hStatusBar, idx, str)
    % 44 47
    % 45 47
    % 46 47
    hOptionText = hStatusBar.hOptionText(idx);
    pos_dx = get(hOptionText, 'pos');
    pos_dx = pos_dx(3.0);
    % 50 52
    % 51 52
    set(hOptionText, 'string', str);
    ext = get(hOptionText, 'extent');
    if gt(ext(3.0), pos_dx)
        truncateUsingEllipsis(hOptionText, pos_dx, str);
    end % if
end % function
function truncateUsingEllipsis(hOptionText, pos_dx, str)
    % 59 71
    % 60 71
    % 61 71
    % 62 71
    % 63 71
    % 64 71
    % 65 71
    % 66 71
    % 67 71
    % 68 71
    % 69 71
    % 70 71
    set(hOptionText, 'vis', 'off');
    % 72 75
    % 73 75
    % 74 75
    str(minus(end, 2.0):end) = '...';
    % 76 81
    % 77 81
    % 78 81
    % 79 81
    % 80 81
        while gt(numel(str), 3.0)
        set(hOptionText, 'string', str);
        ext = get(hOptionText, 'extent');
        if le(ext(3.0), pos_dx)
            break
        end % if
        str(minus(end, 3.0)) = [];
    end % while
    if le(numel(str), 3.0)
        str = '';
    end % if
    % 92 93
    set(hOptionText, 'string', str, 'vis', 'on');
end % function
