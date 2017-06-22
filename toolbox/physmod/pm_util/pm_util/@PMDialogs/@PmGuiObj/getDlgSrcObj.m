function dlgSrc = getDlgSrcObj(hThis)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    dlgSrc = 0.0;
    daRoot = DAStudio.ToolRoot;
    openDlgs = daRoot.getOpenDialogs;
    % 12 13
    for idx=1.0:length(openDlgs)
        if isa(openDlgs(idx).getDialogSource(), 'Simulink.SLDialogSource') && eq(openDlgs(idx).getDialogSource().getBlock().Handle, pm_getsl_dblhandle(hThis.BlockHandle))
            % 15 16
            dlgSrc = openDlgs(idx).getDialogSource();
            return;
        end % if
    end % for
    % 20 21
    error(horzcat(class(hThis), ':getDlgSrcObj'), 'Failed to find a matching DialogSource object.');
end % function
