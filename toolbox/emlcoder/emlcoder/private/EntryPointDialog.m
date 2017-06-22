function dlgstruct = EntryPointDialog(h, name)
    % 1 5
    % 2 5
    % 3 5
    % 4 5
    info.Type = 'textbrowser';
    info.Text = root_info_l;
    info.DialogRefresh = 1.0;
    info.RowSpan = [1.0 2.0];
    info.ColSpan = [1.0 2.0];
    % 10 14
    % 11 14
    % 12 14
    % 13 14
    dlgstruct.DialogTitle = horzcat('Entry Point: ', h.Name);
    dlgstruct.LayoutGrid = [2.0 2.0];
    dlgstruct.Items = cellhorzcat(info);
    dlgstruct.HelpMethod = 'helpview';
    dlgstruct.HelpArgs = cellhorzcat(horzcat(docroot, '/mapfiles/simulink.map'), 'simulink_root');
end % function
function htm = root_info_l
    % 21 22
    str = '<table width="100%%"  BORDER=0 CELLSPACING=0 CELLPADDING=0 bgcolor="#ededed"><tr><td><b><font size=+3>Embedded MATLAB Coder Entry Point</b></font><table><tr><td>The Embedded MATLAB Coder Project Root is the top most node in a project hierarchy. All function entry points live under the Project Root. </td></tr></table>';
    % 23 32
    % 24 32
    % 25 32
    % 26 32
    % 27 32
    % 28 32
    % 29 32
    % 30 32
    % 31 32
    htm = str;
end % function
