function att = v1convert_att(h, att, varargin)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    if strcmp(att.DisplayAs, 'BULLETLIST')
        att.ListStyle = 'itemizedlist';
    else
        att.ListStyle = 'orderedlist';
    end % if
    att = rmfield(att, 'DisplayAs');
end % function
