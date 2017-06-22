function b = ishandlefield(hObj, field)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    h = get(hObj, 'Handles');
    % 8 10
    if isfield(h, field)
        h = convert2vector(h.(field));
        % 11 13
        if all(ishandle(h))
            b = true;
        else
            b = false;
        end
    else
        b = false;
    end
end
