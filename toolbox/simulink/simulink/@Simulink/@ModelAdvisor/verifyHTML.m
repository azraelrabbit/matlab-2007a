function [success, message] = verifyHTML(this, htmlName)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    success = false;
    message = '';
    % 10 11
    if not(exist(this.AtticData.DiagnoseRightFrame, 'file'))
        message = 'No report was found';
        success = false;
        return;
    end % if
    % 16 18
    % 17 18
    if this.BaselineMode
        [success, message] = this.exportReport(htmlName);
        return;
    end % if
    % 22 24
    % 23 24
    if not(exist(htmlName, 'file'))
        message = 'Can not found specified html file';
        success = false;
        return;
    end % if
    % 29 31
    % 30 31
    current_rptContents = loc_RemoveLineNumber(locShuffleReport(this.AtticData.DiagnoseRightFrame));
    saved_rptContents = locShuffleReport(htmlName);
    % 33 34
    if not(strcmp(current_rptContents, saved_rptContents))
        message = 'Mismatch of Model Advisor. If it is valid change, please updated baseline report as well.';
        success = false;
    else
        success = true;
    end % if
end % function
function rptContents = locShuffleReport(reportName)
    % 42 44
    % 43 44
    rptContents = fileread(reportName);
    % 45 46
    rptContents = rptContents(strfind(rptContents, '<hr>'):end);
    % 47 50
    % 48 50
    % 49 50
    rptContents = regexprep(rptContents, '<A NAME="CheckRecord_(\w*)"</A>', '<A NAME="CheckRecord_SerialNumber"</A>');
    % 51 52
    rptContents = regexprep(rptContents, '<!-- mdladv_ignore_start -->(.*?)<!-- mdladv_ignore_finish -->', '');
    % 53 54
    rptContents = regexprep(rptContents, '<a href="matlab: modeladvisorprivate hiliteSystem (\w*) (\w*)">', '<a href="matlab: modeladvisorprivate hiliteSystem $1 SerialNumber">');
end % function
function [msg, i] = loc_RemoveLineNumber(msg)
    % 57 58
    [i, j] = regexp(msg, ' at [0-9]+', 'once');
    if not(isempty(i))
        msg(i:j) = [];
    end % if
end % function
