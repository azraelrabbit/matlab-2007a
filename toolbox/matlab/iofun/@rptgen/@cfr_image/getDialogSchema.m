function dlgStruct = getDialogSchema(this, name)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    thisFileName = rptgen.parseExpressionText(this.FileName);
    thisFileName = which(thisFileName);
    [fPath, fName, fExt] = fileparts(thisFileName);
    % 10 12
    if isempty(thisFileName)
        wPreview = this.dlgText(sprintf('File "%s" not found', this.FileName));
    else
        if ispc
            % 15 17
            uName = getenv('USER');
            if isempty(uName)
                ok = false;
            else
                [ok, msg, msgID] = mkdir(tempdir, uName);
            end % if
            if ok
                fName = fullfile(tempdir, uName, 'rptgen.cfr_image.preview.html');
            else
                fName = fullfile(tempdir, 'rptgen.cfr_image.preview.html');
            end % if
            fid = fopen(fName, 'w');
            if gt(fid, 0.0)
                fprintf(fid, '<html>\n\t<body bgcolor="#333333" topmargin="0" leftmargin="0">\n\t\t<img width="100%%" src="%s">\n\t</body>\n</html>', rptgen.file2urn(thisFileName));
                % 30 32
                fclose(fid);
            else
                fName = thisFileName;
            end % if
            % 35 37
            wPreview = struct('Type', 'webbrowser', 'Url', rptgen.file2urn(fName));
        else
            % 38 40
            wPreview = struct('Type', 'image', 'Name', 'image preview', 'FilePath', thisFileName);
            % 40 43
            % 41 43
        end % if
        % 43 48
        % 44 48
        % 45 48
        % 46 48
    end % if
    dlgStruct = this.dlgMain(name, vertcat(cellhorzcat(this.dlgContainer(vertcat(cellhorzcat(this.dlgWidget('FileName', 'DialogRefresh', true, 'RowSpan', [1.0 1.0], 'ColSpan', [1.0 19.0])), cellhorzcat(this.dlgWidget('isCopyFile', 'RowSpan', [2.0 2.0], 'ColSpan', [1.0 20.0])), cellhorzcat(this.dlgFileBrowse('FileName', '*.jpg;*.png;*.gif', 'RowSpan', [1.0 1.0], 'ColSpan', [20.0 20.0]))), xlate('File Name'), 'LayoutGrid', [20.0 2.0], 'RowSpan', [1.0 1.0], 'ColSpan', [1.0 1.0])), cellhorzcat(this.gr_dlgDisplayOptions(struct('property_name', 'isTitle', 'local', '-Title', 'none', '-isInline', 'filename', fName), [], 'RowSpan', [2.0 2.0], 'ColSpan', [1.0 1.0])), cellhorzcat(this.dlgContainer(vertcat(cellhorzcat(wPreview)), xlate('Preview'), 'RowSpan', [3.0 3.0], 'ColSpan', [1.0 1.0]))), 'LayoutGrid', [3.0 1.0], 'RowStretch', [0.0 0.0 1.0]);
    % 49 77
    % 50 77
    % 51 77
    % 52 77
    % 53 77
    % 54 77
    % 55 77
    % 56 77
    % 57 77
    % 58 77
    % 59 77
    % 60 77
    % 61 77
    % 62 77
    % 63 77
    % 64 77
    % 65 77
    % 66 77
    % 67 77
    % 68 77
    % 69 77
    % 70 77
    % 71 77
    % 72 77
    % 73 77
    % 74 77
    % 75 77
