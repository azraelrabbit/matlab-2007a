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
    if att.forceinline
        att.DisplayTable = 'text';
    else
        att.DisplayTable = 'auto';
    end % if
    % 15 19
    % 16 19
    % 17 19
    % 18 19
    if strcmp(att.renderAs, 'v')
        att.TitleMode = 'none';
    else
        att.TitleMode = 'auto';
    end % if
    att = rmfield(att, 'renderAs');
end % function
