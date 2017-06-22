function dlgStruct = getDialogSchema(hThis, type)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    % 14 15
    verbose = false;
    [licenseGood, errorStruct] = ssc_checklicense(verbose);
    if not(licenseGood)
        beep;
        dlgStruct = l_MakeErrorDialog(hThis, errorStruct.message, 'License Error');
        return;
    end % if
    % 22 23
    try
        ssc_callback(hThis.getBlock, 'BLK_OPENDLG');
        % 25 26
        dlgStruct = pm_superclassmethod(hThis, 'PMDialogs.PMDefaultMaskDlg', 'getDialogSchema', type);
        dlgStruct.ExplicitShow = 'false';
    catch
        % 29 31
        % 30 31
        errorStruct = lasterror;
        % 32 33
        msg = errorStruct.message;
        % 34 35
        dlgStruct = l_MakeErrorDialog(hThis, msg, 'Error');
        % 36 39
        % 37 39
        % 38 39
        beep;
        warning(errorStruct.identifier, msg);
        % 41 42
    end % try
    % 43 44
end % function
function stack = l_MakeErrorDialog(src, errMsg, errorTitle)
    % 46 53
    % 47 53
    % 48 53
    % 49 53
    % 50 53
    % 51 53
    % 52 53
    if lt(nargin, 3.0)
        errorTitle = 'License Error';
    end % if
    if lt(nargin, 2.0)
        errMsg = 'Not licensed to access this block.';
    end % if
    % 59 60
    iconPath = fullfile(matlabroot, 'toolbox', 'physmod', 'pm_util', 'pm_util', 'dlg_resources', 'error.png');
    % 61 63
    % 62 63
    errorIcon = struct('Name', {''}, 'Type', 'image', 'FilePath', cellhorzcat(iconPath), 'RowSpan', {[1.0,1.0]}, 'ColSpan', {[1.0,3.0]});
    % 64 70
    % 65 70
    % 66 70
    % 67 70
    % 68 70
    % 69 70
    errorTxt = struct('Name', errMsg, 'Type', 'text', 'Bold', 1.0, 'WordWrap', true, 'RowSpan', {[1.0,1.0]}, 'ColSpan', {[4.0,10.0]});
    % 71 77
    % 72 77
    % 73 77
    % 74 77
    % 75 77
    % 76 77
    errgrp = struct('Name', cellhorzcat(errorTitle), 'Type', {'group'}, 'Items', cellhorzcat(cellhorzcat(errorIcon, errorTxt)), 'LayoutGrid', {[1.0,10.0]}, 'RowSpan', {[1.0,1.0]}, 'ColSpan', {[1.0,1.0]});
    % 78 84
    % 79 84
    % 80 84
    % 81 84
    % 82 84
    % 83 84
    panel = struct('Name', {''}, 'Type', {'panel'}, 'Items', cellhorzcat(cellhorzcat(errgrp)), 'Source', cellhorzcat(get_param(src.BlockHandle, 'Object')), 'LayoutGrid', {[1.0,1.0]}, 'RowStretch', {[0.0]});
    % 85 91
    % 86 91
    % 87 91
    % 88 91
    % 89 91
    % 90 91
    stack = struct('DialogTitle', {''}, 'Items', cellhorzcat(cellhorzcat(panel)), 'CloseCallback', {'mech_close_cbk'}, 'CloseArgs', cellhorzcat(cellhorzcat(src, '%dialog')));
    % 92 97
    % 93 97
    % 94 97
    % 95 97
    % 96 97
end % function
