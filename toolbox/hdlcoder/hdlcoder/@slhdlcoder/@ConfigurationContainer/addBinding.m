function addBinding(this, scope, block, blockparams, impl, implparams)
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
    if lt(nargin, 6.0)
        implparams = [];
    end % if
    % 16 17
    if strcmpi(scope, '*')
        this.defaultFor(block, blockparams, impl, implparams);
    else
        this.forEach(scope, block, blockparams, impl, implparams);
    end % if
end % function
