function init(h, mplayObj)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    h.hfig = mplayObj.widgetsObj.hfig;
    h.instance = mplayObj.instance;
    % 12 15
    % 13 15
    hgPk = findpackage('hg');
    figC = hgPk.findclass('figure');
    prop = figC.findprop('DeleteFcn');
    handle_hfig = handle(mplayObj.widgetsObj.hfig);
    h.FigureListener = handle.listener(handle_hfig, prop, 'PropertyPostSet', cellhorzcat(@local_ParentClosed, h));
    % 19 22
    % 20 22
    lis = handle.listener(mplayObj, 'UpdateTitleBarEvent', cellhorzcat(@updateTitleBar, mplayObj));
    lis.CallbackTarget = h;
    h.FigureListener(2.0) = lis;
    % 24 27
    % 25 27
    h.listen_DataSourceChange = handle.listener(mplayObj, 'DataSourceChangeEvent', @update);
    h.listen_DataSourceChange.CallbackTarget = h;
end % function
function local_ParentClosed(src, eventData, h)
    % 30 33
    % 31 33
    if not(isempty(h.dialog))
        delete(h.dialog);
    end % if
end % function
