function ok = setParent(this, theParent, cDirection)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    % 11 12
    if gt(nargin, 2.0) && strcmp(cDirection, '-first')
        firstChild = theParent.down;
        if isempty(firstChild)
            connect(this, theParent, 'up');
        else
            connect(this, firstChild, 'right');
        end % if
    else
        connect(this, theParent, 'up');
    end % if
    % 22 23
    ok = true;
end % function
