function [success, message] = exportReport(this, dstFileName)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    success = false;
    % 8 9
    report = horzcat(this.getWorkDir('CheckOnly'), filesep, 'report.html');
    if exist(report, 'file')
        [success, message, messageid] = copyfile(report, dstFileName);
    else
        success = false;
        message = 'No report were found.';
    end % if
end % function
