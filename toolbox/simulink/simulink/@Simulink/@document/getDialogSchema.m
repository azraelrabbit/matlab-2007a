function dlgstruct = getDialogSchema(this, name)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    [pathstr, name, extension] = fileparts(this.documentName);
    dasRoot = DAStudio.Root;
    % 8 11
    % 9 11
    if not(exist(this.documentName, 'file'))
        this.displayDocument = this.documentName;
    else
        if dasRoot.hasWebBrowser
            htmlVersion = fullfile(pathstr, 'html', horzcat(name, strrep(extension, '.', '_'), '.html'));
        else
            htmlVersion = fullfile(pathstr, 'html', horzcat(name, strrep(extension, '.', '_'), '_new', '.html'));
        end
        if exist(htmlVersion, 'file') && le(rtwprivate('cmpTimeFlag', htmlVersion, this.documentName), 0.0)
            this.displayDocument = htmlVersion;
        else
            if strcmpi(extension, '.c') || strcmpi(extension, '.cpp') || strcmpi(extension, '.h')
                % 22 25
                % 23 25
                rtwprivate('rtw_create_directory_path', pathstr, 'html');
                % 25 27
                if dasRoot.hasWebBrowser
                    doCSSStyle = logical(1);
                    % 28 31
                    % 29 31
                    parentDirObj = this.getParent;
                    if isa(parentDirObj, 'Simulink.directory')
                        CodeNodeObj = parentDirObj.getParent;
                        if isa(CodeNodeObj, 'Simulink.code')
                            rtwprivate('rtwattic', 'setSystemMap', CodeNodeObj.SystemMap);
                            rtwprivate('rtwattic', 'setSourceSubsystemName', CodeNodeObj.SourceSubsystemName);
                        end
                    end
                else
                    doCSSStyle = logical(0);
                end
                rtwprivate('rtwctags', cellhorzcat(this.documentName), this.generateBacklink, doCSSStyle, cellhorzcat(htmlVersion));
                this.displayDocument = htmlVersion;
            else
                this.displayDocument = this.documentName;
            end
        end
    end
    % 48 50
    linkitem.Name = this.documentName;
    linkitem.MatlabMethod = 'edit';
    linkitem.MatlabArgs = cellhorzcat(this.documentName);
    linkitem.RowSpan = [1.0 1.0];
    linkitem.ColSpan = [1.0 1.0];
    linkitem.Type = 'hyperlink';
    % 55 57
    if not(exist(this.displayDocument, 'file'))
        item1.Value = horzcat('<h3 align="center">', this.displayDocument, ' doesn''t exist.</h3>');
    else
        % 59 63
        % 60 63
        % 61 63
        if dasRoot.hasWebBrowser
            item1.Url = this.displayDocument;
        else
            item1.FilePath = this.documentName;
        end
    end
    % 68 70
    item1.RowSpan = [2.0 10.0];
    item1.ColSpan = [1.0 1.0];
    % 71 73
    if dasRoot.hasWebBrowser && exist(this.displayDocument, 'file')
        item1.Type = 'webbrowser';
    else
        item1.Type = 'editarea';
    end
    % 77 80
    % 78 80
    htmlrptFlag = '_codegen_rpt.html';
    if strncmp(fliplr(htmlrptFlag), fliplr(this.displayDocument), length(htmlrptFlag))
        docIsHTMLreport = true;
    else
        docIsHTMLreport = false;
    end
    % 85 90
    % 86 90
    % 87 90
    % 88 90
    if docIsHTMLreport
        dlgstruct.DialogTitle = 'Real-Time Workshop Report';
    else
        dlgstruct.DialogTitle = 'Document';
    end
    dlgstruct.LayoutGrid = [2.0 1.0];
    dlgstruct.RowStretch = [0.0 1.0];
    dlgstruct.ColStretch = 1.0;
    % 97 99
    dlgstruct.DispatcherEvents = {};
    if docIsHTMLreport
        dlgstruct.Items = cellhorzcat(item1);
        dlgstruct.HelpMethod = 'helpview([docroot ''/toolbox/rtw/helptargets.map''],''validate_generated_code'')';
        dlgstruct.MinMaxButtons = true;
        dlgstruct.ExplicitShow = true;
    else
        dlgstruct.Items = cellhorzcat(linkitem, item1);
        dlgstruct.HelpMethod = '';
    end
end
