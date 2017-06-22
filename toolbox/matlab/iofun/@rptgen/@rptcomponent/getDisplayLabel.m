function dLabel = getDisplayLabel(c)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    try
        dLabel = getOutlineString(c);
    catch
        try
            dLabel = getName(c);
        catch
            dLabel = class(c);
        end % try
        % 15 16
    end % try
    % 17 18
    if not(c.active)
        dLabel = horzcat('{', dLabel, '}');
    end % if
end % function
