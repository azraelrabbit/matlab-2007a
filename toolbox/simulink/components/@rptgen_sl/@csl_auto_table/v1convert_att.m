function att = v1convert_att(h, att, varargin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    att.ShowNamePrompt = att.isNamePrompt;
    att = rmfield(att, 'isNamePrompt');
    % 8 12
    % 9 12
    % 10 12
    att.Title = att.TitleString;
    att = rmfield(att, 'TitleString');
    % 13 15
    switch att.TitleType
    case 'blkname'
        att.TitleType = 'name';
    case 'other'
        att.TitleType = 'manual';
    end % switch
    % 20 22
    switch att.HeaderType
    case 'blkname'
        att.HeaderType = 'typename';
    end % switch
    % 25 28
    % 26 28
    att.ObjectType = 'Block';
