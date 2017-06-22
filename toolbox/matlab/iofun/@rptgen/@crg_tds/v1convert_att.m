function att = v1convert_att(h, att, varargin)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    att.timeformat = sprintf('%i', att.timeformat);
    % 10 14
    % 11 14
    % 12 14
    % 13 14
    switch att.timesep
    case {'&nbsp;',' '}
        att.timesep = 'SPACE';
    case ''
        att.timesep = 'NONE';
    end % switch
    % 20 24
    % 21 24
    % 22 24
    % 23 24
    switch att.datesep
    case {'&nbsp;',' '}
        att.datesep = 'SPACE';
    case ''
        att.datesep = 'NONE';
    case '//'
        att.datesep = '/';
    end % switch
end % function
