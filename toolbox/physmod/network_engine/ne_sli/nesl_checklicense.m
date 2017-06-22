function [licenseFound, errorStruct] = nesl_checklicense(hBlock)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    error(nargchk(1.0, 1.0, nargin, 'struct'));
    % 12 13
    licenseFound = true;
    errorStruct = [];
    % 15 19
    % 16 19
    % 17 19
    % 18 19
    if not(nesl_isbuildinglib)
        % 20 21
        licenseFound = false;
        % 22 26
        % 23 26
        % 24 26
        % 25 26
        verbose = false;
        [licenseFound, errorStruct] = ssc_checklicense(verbose);
    end % if
    % 29 30
end % function
