function checkSignalIndices(this, indices)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if any(lt(indices, 1.0)) || any(gt(indices, minus(this.NextSignalIndex, 1.0)))
        error(hdlerrormsgid('internalsignalerror'), 'Index not in symbol table')
    end % if
end % function
