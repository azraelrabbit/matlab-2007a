function [ok, errmsg] = stfTargetApplyCB(hDlg, hTarget)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    model = hTarget.getModel;
    hConfigSet = hTarget.getConfigSet;
    callback = hTarget.PostApplyCallback;
    hDlg = [];
    ok = 1.0;
    errmsg = '';
    % 12 13
    if not(isempty(callback))
        try
            loc_eval(hTarget, hDlg, callback);
        catch
            slsfnagctlr('Clear', get_param(model, 'name'), 'RTW Options category');
            % 18 20
            % 19 20
            warnmsg = horzcat('Error executing the PostApplyCallback of the target "', get_param(hConfigSet, 'SystemTargetFile'), '":', sprintf('\n'), lasterr);
            % 21 24
            % 22 24
            % 23 24
            nag = slsfnagctlr('NagTemplate');
            nag.type = 'Warning';
            nag.msg.details = warnmsg;
            nag.msg.type = 'SYSTLC';
            nag.msg.summary = warnmsg;
            nag.component = 'RTW';
            nag.sourceName = get_param(hConfigSet, 'SystemTargetFile');
            nag.sourceFullName = evalc(horzcat('which ', get_param(hConfigSet, 'SystemTargetFile')));
            % 32 34
            % 33 34
            slsfnagctlr('Naglog', 'push', nag);
            slsfnagctlr('ViewNaglog');
            ok = 0.0;
            errmsg = warnmsg;
        end % try
    end % if
end % function
function loc_eval(hSrc, hDlg, evalstr)
    model = hSrc.getModel;
    hConfigSet = hSrc.getConfigSet;
    isActive = hSrc.isActive;
    eval(evalstr);
end % function
