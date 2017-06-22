function stfTargetActivateCB(hTarget)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    if not(hTarget.isActive)
        return;
    end % if
    % 9 10
    model = hTarget.getModel;
    hConfigSet = hTarget.getConfigSet;
    callback = hTarget.ActivateCallback;
    hDlg = [];
    % 14 15
    if not(isempty(callback))
        try
            loc_eval(hTarget, hDlg, callback);
        catch
            slsfnagctlr('Clear', get_param(model, 'name'), 'RTW Options category');
            % 20 22
            % 21 22
            warnmsg = horzcat('Error executing the ActivateCallback of the target "', get_param(hConfigSet, 'SystemTargetFile'), '":', sprintf('\n'), lasterr);
            % 23 26
            % 24 26
            % 25 26
            nag = slsfnagctlr('NagTemplate');
            nag.type = 'Warning';
            nag.msg.details = warnmsg;
            nag.msg.type = 'SYSTLC';
            nag.msg.summary = warnmsg;
            nag.component = 'RTW';
            nag.sourceName = get_param(hConfigSet, 'SystemTargetFile');
            nag.sourceFullName = evalc(horzcat('which ', get_param(hConfigSet, 'SystemTargetFile')));
            % 34 36
            % 35 36
            slsfnagctlr('Naglog', 'push', nag);
            slsfnagctlr('ViewNaglog');
        end % try
    end % if
end % function
function loc_eval(hSrc, hDlg, evalstr)
    model = hSrc.getModel;
    hConfigSet = hSrc.getConfigSet;
    eval(evalstr);
end % function
