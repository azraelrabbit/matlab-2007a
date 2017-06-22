function defaultFor(this, block, blockparams, impl, implparams)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if not(ischar(block)) || not(ischar(impl))
        % 8 9
        disp(sprintf('Invalid configuration ''DefaultFor'' statement in file: %s', this.fileName));
        disp(sprintf('Invalid configuration statement: %s', this.fileName));
        display(block);
        display(impl);
    end % if
    % 14 15
    if iscell(blockparams)
        blockparams = cellhorzcat(blockparams);
    end % if
    % 18 19
    if lt(nargin, 5.0) || isempty(implparams)
        implparams = cellhorzcat(cellhorzcat(block));
    else
        if iscell(implparams)
            implparams = cellhorzcat(cat(1.0, cellhorzcat(block), implparams(:)));
        else
            implparams = cellhorzcat(vertcat(cellhorzcat(block), cellhorzcat(implparams)));
        end % if
    end % if
    % 28 35
    % 29 35
    % 30 35
    % 31 35
    % 32 35
    % 33 35
    % 34 35
    newbinding = struct('Scope', '*', 'BlockType', block, 'BlockParams', blockparams, 'Implementation', impl, 'ImplParams', implparams);
    % 36 42
    % 37 42
    % 38 42
    % 39 42
    % 40 42
    % 41 42
    if isempty(this.defaults)
        this.defaults = newbinding;
    else
        this.defaults(plus(end, 1.0)) = newbinding;
    end % if
end % function
