function responsetype = set_responsetype(this, responsetype)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    set(this, 'privResponseType', responsetype);
    % 9 10
    updateMethod(this);
end % function
