function [status, errMsg] = des_ddg_preApply(blockObj, dlgObj)
    % 1 22
    % 2 22
    % 3 22
    % 4 22
    % 5 22
    % 6 22
    % 7 22
    % 8 22
    % 9 22
    % 10 22
    % 11 22
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
    status = 1.0;
    errMsg = '';
    % 24 26
    % 25 26
    finalMsg = {};
    % 27 34
    % 28 34
    % 29 34
    % 30 34
    % 31 34
    % 32 34
    % 33 34
    [valid, finalMsg] = blockObj.validateChanges(dlgObj);
    % 35 38
    % 36 38
    % 37 38
    if isempty(finalMsg)
        blockObj.processingSpecificToBlock;
        [status, errMsg] = blockObj.preApplyCallback(dlgObj);
    else
        % 42 45
        % 43 45
        % 44 45
        % 45 46
        errmsg = '';
        for count=1.0:length(finalMsg)
            errmsg = horzcat(errmsg, finalMsg{count});
        end % for
        % 50 51
        if eq(length(finalMsg), 1.0)
            eString = 'Error';
        else
            eString = 'Errors';
        end % if
        block = gcb;
        finalMsg = horzcat(eString, ' in ', block, ' block dialog:', char(10.0), char(10.0), errmsg);
        errMsg = finalMsg;
        % 59 60
        status = 0.0;
    end % if
end % function
