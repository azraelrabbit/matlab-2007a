function tag = drive_gentag(object)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    fullname = getfullname(object);
    fullname = strrep(fullname, horzcat(getfullname(bdroot(object)), '/'), '');
    tag = sprintf('drive_%x', double(pm_crc(fullname)));
end % function
