function att = v1convert_att(h, att, varargin)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    if isempty(att.PaperOrientation)
        att.PaperOrientation = 'inherit';
    end % if
    % 12 13
    if isfield(att, 'TitleString')
        att.Title = att.TitleString;
        att = rmfield(att, 'TitleString');
    end % if
    % 17 18
    if isfield(att, 'CaptionString')
        att.Caption = att.CaptionString;
        att = rmfield(att, 'CaptionString');
    end % if
    % 22 23
    if isfield(att, 'CaptionType')
        % 24 25
        att.CaptionType = att.CaptionType(2.0:end);
    end % if
end % function
