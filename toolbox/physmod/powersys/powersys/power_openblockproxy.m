function status = power_openblockproxy(option)
    % 1 26
    % 2 26
    % 3 26
    % 4 26
    % 5 26
    % 6 26
    % 7 26
    % 8 26
    % 9 26
    % 10 26
    % 11 26
    % 12 26
    % 13 26
    % 14 26
    % 15 26
    % 16 26
    % 17 26
    % 18 26
    % 19 26
    % 20 26
    % 21 26
    % 22 26
    % 23 26
    % 24 26
    skipOpen = false;
    % 26 28
    error(nargchk(0.0, 1.0, nargin));
    if lt(nargin, 1.0)
        option = 'mask';
    else
        if strcmpi(option, 'secondary')
            skipOpen = true;
        end
    end
    licenseGood = power_checklicense('true');
    if eq(licenseGood, 1.0) && eq(skipOpen, false)
        open_system(gcbh, option);
    end
    status = licenseGood;
end
