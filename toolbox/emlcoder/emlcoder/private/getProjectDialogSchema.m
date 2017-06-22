function dlgstruct = getProjectDialogSchema(hProject, name)
    % 1 5
    % 2 5
    % 3 5
    % 4 5
    if isempty(hProject.ConfigSet)
        cfgset = emlcoder.ConfigSet;
        hProject.ConfigSet = cfgset;
    end % if
    % 9 10
    info.Type = 'textbrowser';
    info.Text = root_info_l;
    info.DialogRefresh = 1.0;
    info.RowSpan = [1.0 2.0];
    info.ColSpan = [1.0 2.0];
    % 15 19
    % 16 19
    % 17 19
    % 18 19
    dlgstruct.DialogTitle = horzcat('Project: ', name);
    dlgstruct.LayoutGrid = [2.0 2.0];
    dlgstruct.Items = cellhorzcat(info);
    dlgstruct.HelpMethod = 'helpview';
    dlgstruct.HelpArgs = cellhorzcat(horzcat(docroot, '/mapfiles/simulink.map'), 'simulink_root');
end % function
function htm = root_info_l
    % 26 27
    str = '<table width="100%%"  BORDER=0 CELLSPACING=0 CELLPADDING=0 bgcolor="#ededed"><tr><td><b><font size=+3>Embedded MATLAB Coder Project Information</b></font><table><tr><td>The Embedded MATLAB Coder Project Root is the top most node in a project hierarchy. All function entry points live under the Project Root. </td></tr></table>';
    % 28 37
    % 29 37
    % 30 37
    % 31 37
    % 32 37
    % 33 37
    % 34 37
    % 35 37
    % 36 37
    htm = str;
end % function
