function dialogCallback(hObj, hDlg, tag, action)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    hSrc = hObj;
    % 6 8
    switch tag
    case 'Tag_ConfigSet_Target_Tornado_StethoScope'
        val = hDlg.getWidgetValue(tag);
        if val
            set(hSrc, 'ExtMode', 'off');
            set(hSrc, 'RTWCAPISignals', 'on');
            set(hSrc, 'RTWCAPIParams', 'on');
        else
            set(hSrc, 'StethoScope', 'off');
            set(hSrc, 'RTWCAPISignals', 'off');
            set(hSrc, 'RTWCAPIParams', 'off');
        end % if
    case 'Tag_ConfigSet_Target_ExtMode'
        val = hDlg.getWidgetValue(tag);
        if val
            set(hSrc, 'StethoScope', 'off');
            set(hSrc, 'RTWCAPISignals', 'off');
            set(hSrc, 'RTWCAPIParams', 'off');
        end % if
    otherwise
        DAStudio.error('RTW:configSet:unknownAction');
    end % switch
    % 29 31
    hDlg.enableApplyButton(true, false);
