function out = execute(this, d, varargin)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    blkList = findContextBlocks(rptgen_sl.appdata_sl, 'MaskType', '\<DocBlock\>');
    % 9 11
    out = d.createDocumentFragment;
    % 11 13
    if this.LinkingAnchor
        ps = rptgen_sl.propsrc_sl_blk;
    else
        ps = [];
    end % if
    % 17 19
    for i=1.0:length(blkList)
        % 19 21
        if not(isempty(ps))
            out.appendChild(ps.makeLinkScalar(blkList{i}, 'blk', 'anchor', d, ''));
        end % if
        % 23 25
        try
            docType = lower(get_param(blkList{i}, 'DocumentType'));
        catch
            this.status(xlate('Unable to determine DocBlock DocumentType'), 4.0);
            this.status(lasterr, 5.0);
            docType = 'txt';
        end % try
        % 31 33
        switch docType
        case {'rtf','doc','html','htm'}
            adRG = rptgen.appdata_rg;
            % 35 42
            % 36 42
            % 37 42
            % 38 42
            % 39 42
            % 40 42
            dbFile = adRG.getImgName(docType, 'DocBlock');
            % 42 45
            % 43 45
            adRG.PostConvertImport = true;
            docblock('blk2file', blkList{i}, dbFile.fullname);
            % 46 48
            dispName = blkList{i};
            if gt(length(dispName), 32.0)
                dispName = horzcat(dispName(1.0:15.0), '...', dispName(minus(end, 15.0):end));
            end % if
            % 51 53
            try
                iNode = com.mathworks.toolbox.rptgencore.docbook.FileImporter.importExternalFile(dbFile.relname, dbFile.fullname, java(d), dispName);
            catch
                % 55 59
                % 56 59
                % 57 59
                % 58 60
                iNode = [];
                status(this, sprintf('Could not import doc block "%s"', blkList{i}), 2.0);
                status(this, lasterr, 5.0, 0.0);
            end % try
        otherwise
            % 64 69
            % 65 69
            % 66 69
            % 67 69
            fName = horzcat(tempname, '.txt');
            % 69 71
            docblock('blk2file', blkList{i}, fName);
            % 71 73
            try
                iNode = com.mathworks.toolbox.rptgencore.docbook.FileImporter.importFile(this.ImportType, fName, java(d));
            catch
                % 75 78
                % 76 78
                % 77 79
                iNode = [];
                status(this, sprintf('Could not import doc block "%s"', blkList{i}), 2.0);
                status(this, lasterr, 5.0, 0.0);
            end % try
            % 82 84
        end % switch
        % 84 86
        if not(isempty(iNode))
            out.appendChild(iNode);
        end % if
        % 88 91
        % 89 91
    end % for
