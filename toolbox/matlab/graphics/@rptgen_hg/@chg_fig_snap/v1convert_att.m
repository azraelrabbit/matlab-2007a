function att = v1convert_att(h, att, varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if isempty(att.PaperOrientation)
        att.PaperOrientation = 'inherit';
    end % if
    % 11 12
    if isempty(att.isResizeFigure)
        att.isResizeFigure = 'inherit';
    end % if
    % 15 16
    if isempty(att.InvertHardcopy)
        att.InvertHardcopy = 'inherit';
    end % if
    % 19 20
    att.Title = att.ImageTitle;
    att = rmfield(att, 'ImageTitle');
end % function
