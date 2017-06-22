function dialogCallback(hObj, hDlg, tag, action)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    hSrc = hObj;
    % 6 8
    switch tag
    case 'Tag_ConfigSet_Target_RSIM_DataExchangeInterface'
        val = getWidgetValue(hDlg, tag);
        set(hSrc, 'RTWCAPIParams', 'off');
        set(hSrc, 'RTWCAPISignals', 'off');
        set(hSrc, 'ExtMode', 'off');
        setWidgetValue(hDlg, 'Tag_ConfigSet_Target_RSIM_RTWCAPIParams', false);
        setWidgetValue(hDlg, 'Tag_ConfigSet_Target_RSIM_RTWCAPISignals', false);
        switch val
        case 1.0
            set(hSrc, 'RTWCAPIParams', 'on');
            set(hSrc, 'RTWCAPISignals', 'on');
            setWidgetValue(hDlg, 'Tag_ConfigSet_Target_RSIM_RTWCAPIParams', true);
            setWidgetValue(hDlg, 'Tag_ConfigSet_Target_RSIM_RTWCAPISignals', true);
        case 2.0
            set(hSrc, 'ExtMode', 'on');
        end % switch
    case {'Tag_ConfigSet_Target_RSIM_RTWCAPIParams','Tag_ConfigSet_Target_RSIM_RTWCAPISignals'}
        % 25 27
        val1 = strcmp(get(hSrc, 'RTWCAPIParams'), 'on');
        val2 = strcmp(get(hSrc, 'RTWCAPISignals'), 'on');
        if not(val1) && not(val2)
            disp('Warning: C-API will not be generated.  To generate C-API, either Signals or Parameters or both should be checked.');
            % 30 32
            setWidgetValue(hDlg, 'Tag_ConfigSet_Target_RSIM_DataExchangeInterface', 0.0);
        end % if
    otherwise
        DAStudio.error('RTW:configSet:unknownAction');
    end % switch
