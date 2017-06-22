function profData = exprofile_process_data(rawdata, profileInfo)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    % 11 12
    disp('Processing data, please wait ...');
    disp(' ');
    % 14 16
    % 15 16
    profData = exprofile_unpack(rawdata, profileInfo);
    % 17 19
    % 18 19
    profData = exprofile_plot(profData);
    % 20 22
    % 21 22
    exprofile_report(profData);
end % function
