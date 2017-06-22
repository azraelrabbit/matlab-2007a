function dlgstruct = getDialogSchema(this, name)
    % 1 5
    % 2 5
    % 3 5
    % 4 5
    if exist(this.DirectoryName, 'dir')
        item1.Text = constructDirList(this.DirectoryName);
    else
        item1.Text = horzcat('<h3 align="center">', this.DirectoryName, ' doesn''t exist.</h3>');
    end % if
    % 10 11
    item1.Type = 'textbrowser';
    % 12 16
    % 13 16
    % 14 16
    % 15 16
    dlgstruct.DialogTitle = 'Directory Info';
    dlgstruct.Items = cellhorzcat(item1);
end % function
function htmlText = constructDirList(directoryName)
    % 20 21
    htmlText = '';
    htmlText = horzcat(htmlText, '<h3 align="center">Directory Information</h3>');
    htmlText = horzcat(htmlText, '<p><b>Directory Path:</b> ', '<a href="matlab: rtwprivate startshell ''', directoryName, '''">', directoryName, '</a> (click to open shell from here)</p>');
    % 24 26
    % 25 26
    dirInfo = dir(directoryName);
    htmlText = horzcat(htmlText, '<p><b>Directory Modified at:', dirInfo(1.0).date, '</b></p>');
    htmlText = horzcat(htmlText, '<p><b>File List:</b></p>');
    htmlText = horzcat(htmlText, '<table border="0" width="50%">');
    for i=1.0:length(dirInfo)
        if not(dirInfo(i).isdir)
            htmlText = horzcat(htmlText, '  <tr>');
            htmlText = horzcat(htmlText, '    <td width="33%">', dirInfo(i).name, '</td>');
            htmlText = horzcat(htmlText, '    <td width="33%">', dirInfo(i).date, '</td>');
            htmlText = horzcat(htmlText, '    <td width="34%">', num2str(dirInfo(i).bytes), '</td>');
            htmlText = horzcat(htmlText, '  </tr>');
        end % if
    end % for
    htmlText = horzcat(htmlText, '</table>');
end % function
