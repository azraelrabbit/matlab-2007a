function varargout = mech_checklicense(verbose)
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    % 13 14
    error(nargchk(0.0, 1.0, nargin));
    if lt(nargin, 1.0)
        verboseMode = false;
    else
        if strcmpi(verbose, '1') || strcmpi(verbose, 'true')
            verboseMode = true;
        else
            verboseMode = false;
        end % if
    end % if
    % 24 26
    % 25 26
    licenseFound = ssc_checklicense(verboseMode);
    % 27 28
    if eq(nargout, 1.0)
        varargout(1.0) = cellhorzcat(licenseFound);
    end % if
end % function
