function val = isPortOpt(this, idxoptVal)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if eq(idxoptVal, 2.0) || eq(idxoptVal, 4.0)
        val = true;
    else
        if eq(idxoptVal, 4.0) && slfeature('GenericPropagation')
            val = true;
        else
            val = false;
        end % if
    end % if
end % function
