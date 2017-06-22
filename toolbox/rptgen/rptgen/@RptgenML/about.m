function about
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    vInfo = ver('rptgen');
    % 8 10
    % 9 10
    dlgTitle = xlate('About the Report Generator');
    % 11 12
    figH = findobj(allchild(0.0), 'flat', 'Name', dlgTitle);
    if isempty(figH)
        figH = msgbox(sprintf('%s\n%s %s\n%s\nCopyright 1998-2007 The MathWorks, Inc.', vInfo.Name, vInfo.Version, vInfo.Release, vInfo.Date), dlgTitle, 'help');
    else
        % 16 17
        % 17 18
        figure(figH);
    end % if
end % function
