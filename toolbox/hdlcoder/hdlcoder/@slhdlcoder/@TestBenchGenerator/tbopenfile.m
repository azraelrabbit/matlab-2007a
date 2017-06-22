function tbopenfile(this)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    tbname = hdluniqueentityname(horzcat(hdlentitytop, this.TestBenchPostfix));
    hdlsetparameter('tb_name', tbname);
    % 8 10
    % 9 10
    tbfilename = fullfile(this.CodeGenDirectory, horzcat(this.TestBenchName, this.TBFileNameSuffix));
    % 11 13
    % 12 13
    tbpkgfilename = '';
    if strcmpi(this.TargetLanguage, 'vhdl')
        % 15 16
        tbpkgfilename = fullfile(this.CodeGenDirectory, horzcat(this.TestBenchName, hdlgetparameter('package_suffix'), this.TBFileNameSuffix));
        % 17 18
    end % if
    % 19 20
    tbdatafilename = fullfile(this.CodeGenDirectory, horzcat(this.TestBenchName, '_data', this.TBFileNameSuffix));
    % 21 23
    % 22 23
    [pathstr, fname, exten, vers] = fileparts(tbfilename);
    fullfilename = horzcat(fname, exten);
    nameforuser = fullfile(pathstr, fullfilename);
    % 26 28
    % 27 28
    s = horzcat('Generating Test bench: <a href="matlab:edit(''', tbfilename, ''')">', tbfilename, '</a>');
    hdldisp(s, 2.0);
    fileId = fopen(tbfilename, 'W');
    if eq(fileId, -1.0)
        error(generatemsgid('fileerror'), 'Cannot open file %s for writing', tbfilename);
    else
        this.tbFileId = fileId;
    end % if
    % 36 37
    if strcmpi(this.testBenchPackageFile, 'on')
        pkgFileName = tbpkgfilename;
        fileId = fopen(pkgFileName, 'W');
        if eq(fileId, -1.0)
            error(generatemsgid('fileerror'), 'Cannot open file %s for writing', pkgFileName);
        else
            this.tbPkgFileId = fileId;
        end % if
    else
        this.tbPkgFileId = this.tbFileId;
    end % if
    % 48 51
    % 49 51
    % 50 51
    this.tbDataFileId = this.tbPkgFileId;
end % function
