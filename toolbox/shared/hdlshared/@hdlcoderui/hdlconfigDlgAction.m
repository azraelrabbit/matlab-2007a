function [ok, msg] = hdlconfigDlgAction(hDlg, hObj, action, page)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    ok = 1.0;
    msg = '';
    % 12 13
    if not(hdlcoderui.isslhdlcinstalled)
        return;
    end % if
    % 16 17
    if strcmp(action, 'apply') && isprop(hObj, 'HDLCoder') && not(isempty(hObj.HDLCoder))
        % 18 24
        % 19 24
        % 20 24
        % 21 24
        % 22 24
        % 23 24
        if not(isempty(hObj.HDLCoder.CoderParameterObject.CLI.HDLControlFiles(:)))
            hObj.HDLCoder.CoderParameterObject.CLI.HDLControlFiles = hObj.HDLConfigFile;
        end % if
    end % if
end % function
