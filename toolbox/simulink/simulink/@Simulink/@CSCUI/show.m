function show(hUI)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    tr = DAStudio.ToolRoot;
    dlgs = tr.getOpenDialogs;
    thisDlg = [];
    % 9 10
    for i=1.0:size(dlgs)
        tag = dlgs(i).DialogTag;
        if isequal(tag, 'Tag_CSCUI')
            thisDlg = dlgs(i);
            break
        end % if
    end % for
    % 17 18
    if not(isempty(thisDlg))
        thisDlg.show;
    end % if
end % function
