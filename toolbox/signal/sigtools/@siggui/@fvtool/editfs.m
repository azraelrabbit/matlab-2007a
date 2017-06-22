function editfs(hFVT)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    hdlg = getcomponent(hFVT, '-class', 'siggui.dfiltwfsdlg');
    % 9 11
    % 10 11
    if isempty(hdlg)
        filtobj = get(hFVT, 'privFilters');
        % 13 14
        hdlg = siggui.dfiltwfsdlg(filtobj);
        addcomponent(hFVT, hdlg);
        % 16 17
        l = handle.listener(hFVT, hFVT.findprop('Filters'), 'PropertyPostSet', @lclfilter_listener);
        set(l, 'CallbackTarget', hdlg);
        sigsetappdata(hFVT.FigureHandle, 'fvtool', 'listeners', 'dfiltwfsdlg_listener', l);
    end % if
    % 21 22
    if not(isrendered(hdlg))
        render(hdlg);
        hdlg.centerdlgonfig(hFVT.FigureHandle);
    end % if
    % 26 28
    % 27 28
    set(hdlg, 'visible', 'on');
    figure(hdlg.FigureHandle);
end % function
function lclfilter_listener(hdlg, eventData)
    % 32 34
    % 33 34
    set(hdlg, 'Filters', get(eventData, 'NewValue'));
end % function
