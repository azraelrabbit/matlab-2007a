function att = v1convert_att(h, att, varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if isfield(att, 'LoopType')
        att.LoopType = att.LoopType(2.0:end);
        % 10 11
    end % if
end % function
