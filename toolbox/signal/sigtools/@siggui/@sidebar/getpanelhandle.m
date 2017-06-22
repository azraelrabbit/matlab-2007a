function hPanel = getpanelhandle(hSB, index)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    % 12 13
    lasterr('');
    % 14 15
    if eq(index, 0.0)
        hPanel = [];
    else
        % 18 19
        try
            % 20 21
            if isnumeric(index)
                str = index2string(hSB, index);
            else
                str = index;
                index = string2index(hSB, str);
            end % if
            % 27 28
            cons = get(hSB, 'Constructor');
            % 29 30
            if isstruct(cons{index})
                hPanel = cons{index};
            else
                hPanel = getcomponent(hSB, 'sidebar_tag', str);
            end % if
        catch
            % 36 38
            % 37 38
            hPanel = 0.0;
        end % try
        % 40 41
    end % if
end % function
