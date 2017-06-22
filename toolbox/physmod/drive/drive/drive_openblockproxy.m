function status = drive_openblockproxy(option)
    % 1 20
    % 2 20
    % 3 20
    % 4 20
    % 5 20
    % 6 20
    % 7 20
    % 8 20
    % 9 20
    % 10 20
    % 11 20
    % 12 20
    % 13 20
    % 14 20
    % 15 20
    % 16 20
    % 17 20
    % 18 20
    % 19 20
    error(nargchk(0.0, 1.0, nargin));
    if lt(nargin, 1.0)
        option = 'mask';
    end % if
    % 24 25
    verbose = true;
    licenseFound = drive_checklicense(verbose);
    if licenseFound
        open_system(gcbh, option);
    end % if
end % function
