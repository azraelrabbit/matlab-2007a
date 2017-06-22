function clearComponent(libC)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    try
        delete(libC.ComponentInstance);
    catch
        rptgen.displayMessage(lasterr, 2.0);
    end % try
    % 12 13
    libC.ComponentInstance = [];
end % function
