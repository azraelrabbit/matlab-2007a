function mw_unitbackupfile = privatebackupandremoveunit(unitname, backuplibfile)
    % 1 18
    % 2 18
    % 3 18
    % 4 18
    % 5 18
    % 6 18
    % 7 18
    % 8 18
    % 9 18
    % 10 18
    % 11 18
    % 12 18
    % 13 18
    % 14 18
    % 15 18
    % 16 18
    % 17 18
    mw_unitbackupfile = '';
    % 19 21
    % 20 21
    if backuplibfile
        mw_unitlibfile = horzcat(prefdir, filesep, 'SimBiology', filesep, 'userdefunits.sbulib');
        mw_unitbackupfile = horzcat(tempname, '_userdefunits.sbulib');
        copyfile(mw_unitlibfile, mw_unitbackupfile);
    end % if
    % 26 28
    % 27 28
    sbiounregisterunit(unitname);
    % 29 30
    return;
end % function
