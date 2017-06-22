function att = v1convert_att(h, att, varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    att.PrintSize = att.PaperSize;
    att = rmfield(att, 'PaperSize');
    % 10 12
    % 11 12
    att.PrintUnits = att.PaperUnits;
    att = rmfield(att, 'PaperUnits');
    % 14 16
    % 15 16
    if isempty(att.PaperOrientation)
        att.PaperOrientation = 'inherit';
    end % if
    % 19 26
    % 20 26
    % 21 26
    % 22 26
    % 23 26
    % 24 26
    % 25 26
    if isfield(att, 'isInvertHardcopy')
        if att.isInvertHardcopy
            att.InvertHardcopy = 'on';
        else
            att.InvertHardcopy = 'off';
        end % if
        att = rmfield(att, 'isInvertHardcopy');
    end % if
    % 34 35
    if isfield(att, 'CaptionType')
        att.CaptionType = att.CaptionType(2.0:end);
        % 37 38
    end % if
end % function
