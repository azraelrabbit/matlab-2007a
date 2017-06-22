function config_dlg_fcnproto_conf(action, hDlg, hSrc)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if not(isa(hSrc, 'Simulink.BaseConfig'))
        error('This function must be associated with a configuration set object');
    end % if
    % 9 11
    model = hSrc.getModel;
    % 11 13
    if isempty(model)
        return;
    end % if
    % 15 19
    % 16 19
    % 17 19
    fcnCtl = get_param(model, 'RTWFcnClass');
    % 19 27
    % 20 27
    % 21 27
    % 22 27
    % 23 27
    % 24 27
    % 25 27
    if not(isempty(fcnCtl)) && isa(fcnCtl, 'RTW.FcnCtl')
        dlgID = fcnCtl.ViewWidget;
    else
        return;
    end % if
    % 31 33
    switch action
    case 'ParentClose'
        if ishandle(dlgID)
            delete(dlgID);
        end % if
    end % switch
