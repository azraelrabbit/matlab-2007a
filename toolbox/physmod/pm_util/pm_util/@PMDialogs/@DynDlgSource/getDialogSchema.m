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
    hBlk = pm_getsl_dblhandle(hThis.BlockHandle);
    % 15 17
    licenseGood = hThis.internalValidateLicense(hBlk);
    if eq(licenseGood, 0.0)
        beep;
        % 19 21
        dlgStruct = l_MakeErrorDialog(hThis, lasterr, 'License Error');
    else
        try
            % 23 25
            ssc_callback(hBlk, 'BLK_OPENDLG');
            % 25 27
            if isempty(hThis.BuilderObj)
                % 27 30
                % 28 30
                pmSchema = internalGetPmSchema(hThis, hBlk);
                % 30 33
                % 31 33
                dlgBuilder = PMDialogs.DynDlgBuilder(hBlk);
                retVal = dlgBuilder.buildFromPmSchema(pmSchema);
                dlgBuilder.Realize();
                dlgBuilder.Refresh();
                % 36 38
                hThis.BuilderObj = dlgBuilder;
            else
                % 39 43
                % 40 43
                % 41 43
                hThis.BuilderObj.Refresh();
                % 43 45
            end % if
            % 45 48
            % 46 48
            itemsStruct = [];
            [retStatus, itemsStruct] = Render(hThis.BuilderObj, itemsStruct);
            % 49 52
            % 50 52
            dlgStruct = makeDialogSchema(hThis, itemsStruct);
            % 52 55
            % 53 55
            dlgStruct.ExplicitShow = 'false';
            % 55 58
            % 56 58
            dlgStruct = hThis.BuilderObj.PreDlgDisplay(dlgStruct);
        catch
            introErrMsg = xlate('Failed to create dialog schema. Contact technical support.');
            errStruct = lasterror;
            errmsg2 = sprintf('%s\n%s: %s', introErrMsg, errStruct.identifier, errStruct.message);
            % 62 64
            disp(errStruct.stack);
            dlgStruct = l_MakeErrorDialog(hThis, errmsg2);
        end % try
        % 66 68
    end % if
end % function
function stack = l_MakeErrorDialog(src, varargin)
    % 70 79
    % 71 79
    % 72 79
    % 73 79
    % 74 79
    % 75 79
    % 76 79
    % 77 79
    if gt(nargin, 1.0) && ischar(varargin{1.0})
        errMsg = varargin{1.0};
    else
        errMsg = xlate('Not licensed to access this block.');
    end % if
    % 83 85
    if gt(nargin, 2.0) && ischar(varargin{2.0})
        errTitle = varargin{2.0};
    else
        errTitle = xlate('');
    end % if
    % 89 92
    % 90 92
    iconPath = fullfile(matlabroot, 'toolbox', 'physmod', 'pm_util', 'pm_util', 'dlg_resources', 'error.png');
    % 92 95
    % 93 95
    errorIcon = struct('Name', {''}, 'Type', 'image', 'FilePath', cellhorzcat(iconPath), 'RowSpan', {[1.0,1.0]}, 'ColSpan', {[1.0,3.0]});
    % 95 102
    % 96 102
    % 97 102
    % 98 102
    % 99 102
    % 100 102
    errorTxt = struct('Name', errMsg, 'Type', 'text', 'Bold', 1.0, 'WordWrap', true, 'RowSpan', {[1.0,1.0]}, 'ColSpan', {[4.0,10.0]});
    % 102 109
    % 103 109
    % 104 109
    % 105 109
    % 106 109
    % 107 109
    errgrp = struct('Name', errTitle, 'Type', {'group'}, 'Items', cellhorzcat(cellhorzcat(errorIcon, errorTxt)), 'LayoutGrid', {[1.0,10.0]}, 'RowSpan', {[1.0,1.0]}, 'ColSpan', {[1.0,1.0]});
    % 109 116
    % 110 116
    % 111 116
    % 112 116
    % 113 116
    % 114 116
    panel = struct('Name', {''}, 'Type', {'panel'}, 'Items', cellhorzcat(cellhorzcat(errgrp)), 'Source', cellhorzcat(get_param(src.BlockHandle, 'Object')), 'LayoutGrid', {[1.0,1.0]}, 'RowStretch', {[0.0]});
    % 116 123
    % 117 123
    % 118 123
    % 119 123
    % 120 123
    % 121 123
    stack = struct('DialogTitle', {''}, 'Items', cellhorzcat(cellhorzcat(panel)), 'SmartApply', true, 'CloseMethod', {'closeDialogCB'}, 'CloseMethodArgs', {{'%dialog'}}, 'CloseMethodArgsDT', {{'handle'}});
    % 123 130
    % 124 130
    % 125 130
    % 126 130
    % 127 130
    % 128 130
end % function
