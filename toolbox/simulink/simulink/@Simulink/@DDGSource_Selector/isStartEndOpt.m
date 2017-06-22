function val = isStartEndOpt(this, idxoptVal)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if eq(idxoptVal, 5.0) && slfeature('GenericPropagation')
        val = true;
    else
        val = false;
    end % if
    % 12 13
end % function
