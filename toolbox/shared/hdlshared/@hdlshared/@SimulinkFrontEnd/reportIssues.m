function checks = reportIssues(this)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    noErrors = 0.0;
    noWarnings = 0.0;
    % 7 9
    for ii=1.0:length(this.FEChecks)
        switch this.FEChecks(ii).level
        case 'Error'
            noErrors = plus(noErrors, 1.0);
            % 12 14
            displayIssue(this.FEChecks(ii).level, this.FEChecks(ii).path, this.FEChecks(ii).message);
            % 15 19
            % 16 19
            % 17 19
        case 'Warning'
            % 18 20
            noWarnings = plus(noWarnings, 1.0);
            % 20 22
            displayIssue(this.FEChecks(ii).level, this.FEChecks(ii).path, this.FEChecks(ii).message);
            % 23 27
            % 24 27
            % 25 27
        case 'Message'
            % 26 29
            % 27 29
            displayIssue(this.FEChecks(ii).level, this.FEChecks(ii).path, this.FEChecks(ii).message);
        otherwise
            % 30 34
            % 31 34
            % 32 34
            % 33 36
            % 34 36
            error(hdlcodererrormsgid('unknownerrstruct'), 'Internal Error: Invalid error message structure logged by frontend');
            % 36 38
        end % switch
    end % for
    % 39 41
    if gt(noErrors, 0.0)
        error(hdlcodererrormsgid('frontendissues'), 'Aborting HDL code generation due to above errors');
        % 42 44
    end % if
function displayIssue(level, blkpath, msg)
    % 45 50
    % 46 50
    % 47 50
    % 48 50
    hilitename = horzcat('''', blkpath, '''');
    crs = find(eq(hilitename, char(10.0)));
    hilitename(crs) = ' ';
    % 52 54
    modelLink = sprintf('<a href="matlab:hilite(get_param(''%s'',''object''),''none'');hilite_system(%s)">%s</a>', get_param(bdroot, 'Name'), hilitename, hilitename);
    % 54 58
    % 55 58
    % 56 58
    disp(sprintf('%s: %s\n   %s', level, modelLink, msg));
