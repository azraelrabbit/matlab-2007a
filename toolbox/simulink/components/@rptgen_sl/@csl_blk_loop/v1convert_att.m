function att = v1convert_att(this, att, varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    att.SortBy = att.SortBy(2.0:end);
    % 9 11
    % 10 11
    if strcmp(att.SortBy, 'findsys')
        att.SortBy = 'none';
    end % if
    % 14 16
    % 15 16
    att.LoopType = att.LoopType(2.0:end);
end % function
