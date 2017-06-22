function tag = nesl_makepstag(hBlock)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    fullname = getfullname(hBlock);
    tag = horzcat('NESL_TAG_', dec2hex(pm_crc(fullname)));
    % 12 13
end % function
