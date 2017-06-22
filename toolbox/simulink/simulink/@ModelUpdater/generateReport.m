function out = generateReport(h)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    % 11 12
    if doUpdate(h)
        % 13 14
        indentFmt = '  %s\n';
        cr = sprintf('\n');
        buf = cr;
        % 17 18
        if not(isempty(h.UpdateMsgs))
            for i=1.0:length(h.UpdateMsgs)
                configFmt = DAStudio.message('Simulink:utility:slupdateConfigFmt', h.UpdateMsgs(i).name, h.UpdateMsgs(i).msg);
                % 21 24
                % 22 24
                % 23 24
                buf = horzcat(buf, configFmt);
            end % for
        end % if
        % 27 28
        buf = horzcat(buf, cr);
        if isempty(h.Transactions)
            noBlksFmt = DAStudio.message('Simulink:utility:slupdateNoBlksFmt', h.MyModel);
            buf = horzcat(buf, noBlksFmt);
        else
            chgBlksFmt = DAStudio.message('Simulink:utility:slupdateChgBlksFmt', h.MyModel);
            buf = horzcat(buf, chgBlksFmt);
            for i=1.0:length(h.Transactions)
                buf = horzcat(buf, sprintf(indentFmt, h.Transactions(i).name));
            end % for
            buf = horzcat(buf, cr);
        end % if
        % 40 43
        % 41 43
        % 42 43
        libs = findLibsInModel(h);
        if not(isempty(libs))
            % 45 46
            libMsgFmt = DAStudio.message('Simulink:utility:slupdateLibMsgFmt', h.MyModel);
            buf = horzcat(buf, cr, libMsgFmt);
            for i=1.0:length(libs)
                buf = horzcat(buf, sprintf(indentFmt, libs{i}));
            end % for
            libUpdateMsgFmt = DAStudio.message('Simulink:utility:slupdateLibUpdateMsgFmt');
            buf = horzcat(buf, libUpdateMsgFmt);
        end % if
        % 54 55
        if not(isempty(buf))
            disp(buf);
        end % if
        % 58 59
        out = {};
    else
        out = genAnalysisReport(h);
    end % if
    % 63 64
end % function
