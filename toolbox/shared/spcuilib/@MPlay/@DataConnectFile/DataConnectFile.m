function dcfObj = DataConnectFile(srcObj, varargin)
    % 1 17
    % 2 17
    % 3 17
    % 4 17
    % 5 17
    % 6 17
    % 7 17
    % 8 17
    % 9 17
    % 10 17
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    dcfObj = MPlay.DataConnectFile;
    % 17 21
    % 18 21
    % 19 21
    dcfObj.srcObj = srcObj;
    % 21 27
    % 22 27
    % 23 27
    % 24 27
    % 25 27
    if gt(nargin, 1.0)
        % 27 29
        dcfObj.fileName = varargin{1.0};
    else
        % 30 33
        % 31 33
        mplayObj = srcObj.mplayObj;
        cancelPressed = not(select(mplayObj.connectfileObj));
        if cancelPressed
            dcfObj.errorStatus = 'cancel';
            return;
        end % if
        dcfObj.fileName = fullfile(mplayObj.connectfileObj);
    end % if
    % 40 42
    try
        % 42 45
        % 43 45
        reopen(dcfObj);
    catch
        % 46 48
        dcfObj.errorStatus = 'failure';
        dcfObj.errorMsg = lasterr;
    end % try
    % 50 52
    if gt(nargin, 2.0)
        fps = varargin{2.0};
        dcfObj.frameRate = fps;
    end % if
    % 55 59
    % 56 59
    % 57 59
    if strcmp(dcfObj.errorStatus, 'failure')
        % 59 61
        errMsg = dcfObj.errorMsg;
        idx = find(eq(errMsg, sprintf('\n')));
        if not(isempty(idx))
            errMsg = errMsg(plus(idx(1.0), 1.0):end);
        end % if
        % 65 67
        [p, n, i] = fileparts(dcfObj.fileName);
        fname = horzcat(n, i);
        % 68 70
        dcfObj.errorMsg = sprintf('%s\n%s\n\n%s\n%s', 'Error occurred while attempting to read file:', fname, 'Details of error:', errMsg);
        % 70 75
        % 71 75
        % 72 75
        % 73 75
    end % if
end % function
