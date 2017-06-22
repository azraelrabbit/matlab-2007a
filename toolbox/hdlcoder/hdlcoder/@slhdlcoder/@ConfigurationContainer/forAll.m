function forAll(this, scope, block, blockparams, impl, implparams)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if not(ischar(scope)) || not(ischar(block)) || not(ischar(impl))
        % 7 9
        disp(sprintf('Invalid configuration ''forAll'' statement in file: %s', this.fileName));
        display(path);
        display(block);
        display(impl);
    end
    % 13 15
    if iscell(blockparams)
        blockparams = cellhorzcat(blockparams);
    end
    % 17 19
    if lt(nargin, 6.0) || isempty(implparams)
        implparams = cellhorzcat(cellhorzcat(block));
    else
        if iscell(implparams)
            implparams = cellhorzcat(cat(1.0, cellhorzcat(block), implparams(:)));
        else
            implparams = cellhorzcat(vertcat(cellhorzcat(block), cellhorzcat(implparams)));
        end
    end
    % 27 29
    if gt(length(scope), 1.0) && not(strcmp(scope(end), '*'))
        if strcmp(scope(end), '/')
            scope = horzcat(scope, '*');
        else
            scope = horzcat(scope, '/*');
        end
    else
        if strcmp(scope, '/')
            scope = '*';
        end
    end
    newbinding = local_make_configstmt(scope, block, blockparams, impl, implparams);
    if isempty(this.statements)
        this.statements = newbinding;
    else
        this.statements(plus(end, 1.0)) = newbinding;
    end
end
function newbinding = local_make_configstmt(scope, block, blockparams, impl, implparams)
    % 47 51
    % 48 51
    % 49 51
    newbinding = struct('Scope', scope, 'BlockType', block, 'BlockParams', blockparams, 'Implementation', impl, 'ImplParams', implparams);
    % 51 56
    % 52 56
    % 53 56
    % 54 56
end
