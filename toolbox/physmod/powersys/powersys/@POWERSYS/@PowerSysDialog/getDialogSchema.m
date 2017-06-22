function dlgStruct = getDialogSchema(hThis, type)
    % 1 16
    % 2 16
    % 3 16
    % 4 16
    % 5 16
    % 6 16
    % 7 16
    % 8 16
    % 9 16
    % 10 16
    % 11 16
    % 12 16
    % 13 16
    % 14 16
    % 15 16
    licenseGood = power_checklicense('false');
    if eq(licenseGood, 0.0)
        beep;
        dlgStruct = l_MakeErrorDialog(hThis);
    else
        % 21 22
        dlgStruct = power_superclassmethod(hThis, 'POWERSYS.PowerSysDialog', 'getDialogSchema', type);
        dlgStruct.ExplicitShow = 'false';
    end % if
    % 25 26
end % function
function stack = l_MakeErrorDialog(src, errMsg, errorTitle)
    % 28 36
    % 29 36
    % 30 36
    % 31 36
    % 32 36
    % 33 36
    % 34 36
    % 35 36
    if lt(nargin, 3.0)
        errorTitle = 'License Error';
    end % if
    if lt(nargin, 2.0)
        errMsg = 'Not licensed to access this block.';
    end % if
    % 42 43
    iconPath = fullfile(matlabroot, 'toolbox', 'physmod', 'powersys', 'powersys', 'private', 'error.png');
    % 44 46
    % 45 46
    errorIcon = struct('Name', {''}, 'Type', 'image', 'FilePath', cellhorzcat(iconPath), 'RowSpan', {[1.0,1.0]}, 'ColSpan', {[1.0,3.0]});
    % 47 53
    % 48 53
    % 49 53
    % 50 53
    % 51 53
    % 52 53
    errorTxt = struct('Name', errMsg, 'Type', 'text', 'Bold', 1.0, 'WordWrap', true, 'RowSpan', {[1.0,1.0]}, 'ColSpan', {[4.0,10.0]});
    % 54 60
    % 55 60
    % 56 60
    % 57 60
    % 58 60
    % 59 60
    errgrp = struct('Name', cellhorzcat(errorTitle), 'Type', {'group'}, 'Items', cellhorzcat(cellhorzcat(errorIcon, errorTxt)), 'LayoutGrid', {[1.0,10.0]}, 'RowSpan', {[1.0,1.0]}, 'ColSpan', {[1.0,1.0]});
    % 61 67
    % 62 67
    % 63 67
    % 64 67
    % 65 67
    % 66 67
    panel = struct('Name', {''}, 'Type', {'panel'}, 'Items', cellhorzcat(cellhorzcat(errgrp)), 'Source', cellhorzcat(get_param(src.BlockHandle, 'Object')), 'LayoutGrid', {[1.0,1.0]}, 'RowStretch', {[0.0]});
    % 68 74
    % 69 74
    % 70 74
    % 71 74
    % 72 74
    % 73 74
    stack = struct('DialogTitle', {''}, 'Items', cellhorzcat(cellhorzcat(panel)), 'CloseCallback', {'powersys_close_cbk'}, 'CloseArgs', cellhorzcat(cellhorzcat(src, '%dialog')));
    % 75 80
    % 76 80
    % 77 80
    % 78 80
    % 79 80
end % function
