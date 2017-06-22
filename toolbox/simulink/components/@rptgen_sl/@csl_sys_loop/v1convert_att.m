function att = v1convert_att(h, att, varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if strcmp(att.SortBy, '$alphabetical')
        % 9 10
        att.SortBy = 'systemalpha';
    else
        % 12 13
        att.SortBy = att.SortBy(2.0:end);
    end % if
    % 15 17
    % 16 17
    att.LoopType = att.LoopType(2.0:end);
end % function
