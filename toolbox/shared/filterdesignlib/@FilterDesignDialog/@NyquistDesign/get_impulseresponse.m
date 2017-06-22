function impulseresponse = get_impulseresponse(this, impulseresponse)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    try
        bandvalue = evaluatevars(this.Band);
    catch
        bandvalue = 3.0;
    end % try
    % 13 14
    if eq(bandvalue, 2.0)
        if isempty(impulseresponse)
            impulseresponse = 'FIR';
        end % if
    else
        impulseresponse = 'FIR';
    end % if
end % function
