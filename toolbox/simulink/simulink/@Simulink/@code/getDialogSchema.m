function dlgstruct = getDialogSchema(this, name)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    htmlitem.Text = Constructhtml(this);
    htmlitem.Type = 'textbrowser';
    % 8 11
    % 9 11
    % 10 11
    dlgstruct.DialogTitle = 'Code';
    dlgstruct.Items = cellhorzcat(htmlitem);
    dlgstruct.HelpMethod = 'helpview([docroot ''/toolbox/rtw/helptargets.map''],''code_browser_doc'')';
end % function
function htmltext = Constructhtml(this)
    htmltext = '';
    if isempty(this.BuildDirSrcObj)
        % 18 19
        htmltext = horzcat(htmltext, '<h3 align="center">No Standalone Code to Display. </h3>');
        % 20 21
        htmltext = horzcat(htmltext, '<p><b>Refresh:</b> <a href="ddgrefresh: getActiveCode ''', this.ModelName, ''' refresh"> click to reload from current directory </a></p>');
        % 22 23
        return;
    else
        htmltext = horzcat(htmltext, '<h3 align="center">Code for ', this.DisplayName, '</h3>');
    end % if
    if strcmp(this.NodeType, 'Subsystem')
        htmltext = horzcat(htmltext, '<p><b>Subsystem Name:</b> ', this.DisplayName, '</p>');
    else
        htmltext = horzcat(htmltext, '<p><b>Model Name:</b> ', this.ModelName, '</p>');
    end % if
    % 32 33
    if not(isempty(this.modelRefs))
        linkToModel = '';
        for i=1.0:length(this.modelRefs)
            linkToModel = horzcat(linkToModel, '<a href="matlab: ', this.modelRefs{i}, ' ">', this.modelRefs{i}, '</a> ');
            % 37 38
        end % for
        htmltext = horzcat(htmltext, '<p><b>Explicitly Referenced Models:</b> ', linkToModel, '</p>');
    else
        % 41 42
        htmltext = horzcat(htmltext, '<p><b>Explicitly Referenced Models:</b> None</p>');
    end % if
    implicitRefMdls = setdiff(this.modelRefsAll, this.modelRefs);
    if not(isempty(implicitRefMdls))
        linkToModel = '';
        for i=1.0:length(implicitRefMdls)
            linkToModel = horzcat(linkToModel, '<a href="matlab: ', implicitRefMdls{i}, ' ">', implicitRefMdls{i}, '</a> ');
            % 49 50
        end % for
        htmltext = horzcat(htmltext, '<p><b>Implicitly Referenced Models:</b> ', linkToModel, '</p>');
    else
        % 53 54
        htmltext = horzcat(htmltext, '<p><b>Implicitly Referenced Models:</b> None</p>');
    end % if
    if not(isempty(this.BuildDirSrcObj))
        htmltext = horzcat(htmltext, '<p><b>Code Recompile Command:</b> <a href="matlab: rtwrebuild ''', this.BuildDir, '''"> run rtwrebuild </a></p>');
    else
        % 59 60
        htmltext = horzcat(htmltext, '<p><b>Code Recompile Command:</b> Code not generated yet. </p>');
    end % if
    htmltext = horzcat(htmltext, '<p><b>Build Directory Root:</b> ', this.BuildDirRoot, '</p>');
    if this.isOutofDate && not(strcmp(this.NodeType, 'Subsystem'))
        htmltext = horzcat(htmltext, '<p><b>Generated Source File is older than Model File: Yes</b></p>');
    else
        htmltext = horzcat(htmltext, '<p><b>Generated Source File is older than Model File:</b> No </p>');
    end % if
    if not(isempty(this.htmlreport))
        dasRoot = DAStudio.Root;
        if dasRoot.hasWebBrowser
            htmltext = horzcat(htmltext, '<p><b>HTML Report:</b> <a href="matlab: rtwprivate rtwshowhtml ''', this.htmlreport, ''' UseWebBrowserWidget"> click to open </a></p>');
        else
            % 73 74
            htmltext = horzcat(htmltext, '<p><b>HTML Report:</b> <a href="matlab: web ''', this.htmlreport, '''"> click to open </a></p>');
            % 75 76
        end % if
    else
        htmltext = horzcat(htmltext, '<p><b>HTML Report:</b> Does not exist</p>');
    end % if
    if strcmp(this.NodeType, 'TopModel')
        % 81 82
        htmltext = horzcat(htmltext, '<p><b>Configuration Settings at the Time of Code Generation:</b> ', '<a href="matlab: rtwprivate rtw_view_code_configset ', this.ModelName, '"> click to open </a></p>');
        % 83 85
        % 84 85
        htmltext = horzcat(htmltext, '<p><b>Refresh:</b> <a href="ddgrefresh: getActiveCode ''', this.ModelName, ''' refresh "> click to reload from current directory </a></p>');
        % 86 87
    end % if
end % function
