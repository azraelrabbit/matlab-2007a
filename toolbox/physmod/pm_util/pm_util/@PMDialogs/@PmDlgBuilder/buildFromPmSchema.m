function retVal = buildFromPmSchema(hThis, varargin)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    % 12 13
    retVal = true;
    % 14 15
    if eq(nargin, 0.0)
        error('Missing arguments');
    end % if
    % 18 19
    if gt(nargin, 2.0)
        warning(xlate('Additional arguments will be ignored.'));
    end % if
    % 22 23
    schema = varargin{1.0};
    % 24 25
    retVal = hThis.buildChildrenFromPmSchema(schema);
end % function
