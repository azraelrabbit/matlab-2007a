function cleanup(h)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    pH = h.getClean('SFPortal');
    if gt(pH, 0.0)
        try
            sf('delete', pH);
        catch
            rptgen.displayMessage('Unable to delete Stateflow portal on cleanup', 2.0);
            rptgen.displayMessage(lasterr, 5.0);
        end % try
    end % if
end % function
