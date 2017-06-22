function cacheDialogDetail(hMessageLog)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    d = hMessageLog.dialog;
    % 9 21
    % 10 21
    % 11 21
    % 12 21
    % 13 21
    % 14 21
    % 15 21
    % 16 21
    % 17 21
    % 18 21
    % 19 21
    thisFilteredIndex = d.getWidgetValue('summary');
    unfilteredIndices = d.getUserData('summary');
    idx = unfilteredIndices(plus(1.0, thisFilteredIndex));
    % 23 25
    if isempty(idx)
        % 25 27
        hMessageLog.cache_SelectedDetail = '';
    else
        % 28 31
        % 29 31
        hMergedLog = cacheMergedLog(hMessageLog);
        % 31 36
        % 32 36
        % 33 36
        % 34 36
        m = getMsgByIdx(hMergedLog, idx);
        % 36 38
        switch lower(m.Type)
        case 'info'
            clr = 'blue';
        case 'warn'
            clr = 'orange';
        otherwise
            clr = 'red';
        end % switch
        % 45 55
        % 46 55
        % 47 55
        % 48 55
        % 49 55
        % 50 55
        % 51 55
        % 52 55
        % 53 55
        header = sprintf(horzcat('[%s] %s:%s<br>', '<font color=', clr, '><b><i>%s</i></b></font><br><hr>'), datestr(m.Time, 'dd-mmm-yyyy HH:MM:SS'), capital(m.Type), capital(m.Category), m.Summary);
        % 55 60
        % 56 60
        % 57 60
        % 58 60
        str = horzcat(header, m.Detail);
        % 60 64
        % 61 64
        % 62 64
        hMessageLog.cache_SelectedDetail = str;
    end % if
function m = getMsgByIdx(hMessageLog, idx)
    % 66 73
    % 67 73
    % 68 73
    % 69 73
    % 70 73
    % 71 73
    m = hMessageLog.down('last');
    for i=1.0:idx
        m = m.left;
    end % for
