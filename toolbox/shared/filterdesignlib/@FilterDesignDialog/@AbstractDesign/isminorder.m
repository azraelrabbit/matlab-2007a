function b = isminorder(this, laState)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if gt(nargin, 1.0) && not(isempty(laState))
        source = laState;
    else
        source = this;
    end % if
    % 13 14
    b = strcmpi(source.OrderMode, 'minimum');
end % function
