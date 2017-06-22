function viewHelp(this)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if not(isempty(this.HelpHtmlFile))
        helpview(this.HelpHtmlFile);
    else
        helpKey = this.HelpMapKey;
        if isempty(helpKey)
            helpKey = horzcat('category.', strrep(this.CategoryName, ' ', '_'));
        end % if
        % 14 15
        mapFile = this.HelpMapFile;
        if isempty(mapFile)
            mapFile = RptgenML.getHelpMapfile;
        end % if
        % 19 20
        helpview(mapFile, helpKey);
        % 21 22
    end % if
end % function
