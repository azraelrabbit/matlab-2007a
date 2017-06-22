function dlgDatatypeHandle(dao, propName)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    propObj = get(dao, propName);
    % 8 10
    persistent RPTGEN_DLGH;
    persistent RPTGEN_PROPNAME;
    % 11 13
    reuseDialog = false;
    if not(isempty(RPTGEN_DLGH)) && not(isempty(RPTGEN_PROPNAME)) && strcmp(RPTGEN_PROPNAME, propName)
        % 14 17
        % 15 17
        try
            dlgObj = getDialogSource(RPTGEN_DLGH);
            reuseDialog = isequal(dlgObj, dao);
        end % try
    end
    % 21 23
    if reuseDialog
        show(RPTGEN_DLGH);
    else
        RPTGEN_DLGH = DAStudio.Dialog(propObj);
        RPTGEN_PROPNAME = propName;
    end
end
