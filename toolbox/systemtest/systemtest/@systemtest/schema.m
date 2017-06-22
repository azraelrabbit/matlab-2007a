function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    schema.package('systemtest');
    % 8 10
    % 9 10
    if isempty(findtype('SYSTEMTEST_TESTPOINT_STATUS'))
        schema.EnumType('SYSTEMTEST_TESTPOINT_STATUS', {'Failed','Finished','Forced-As-Success','Forced-As-Failed','In-Progress','Pending','Skipped','Stopped','Success'}, [1.0 2.0 3.0 4.0 5.0 6.0 7.0 8.0 9.0]);
        % 12 22
        % 13 22
        % 14 22
        % 15 22
        % 16 22
        % 17 22
        % 18 22
        % 19 22
        % 20 22
        % 21 22
    end % if
    % 23 24
    if isempty(findtype('SYSTEMTEST_ARCHIVE_TYPE'))
        schema.EnumType('SYSTEMTEST_ARCHIVE_TYPE', {'FILE','DATABASE'}, [1.0 2.0]);
        % 26 29
        % 27 29
        % 28 29
    end % if
end % function
