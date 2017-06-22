function out = importFile(this, d, fileName)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    isExternal = strcmp(this.ImportType, com.mathworks.toolbox.rptgencore.docbook.FileImporter.EXTERNAL);
    % 10 13
    % 11 13
    adRG = rptgen.appdata_rg;
    % 13 15
    try
        out = javaMethod('importFile', 'com.mathworks.toolbox.rptgencore.docbook.FileImporter', this.ImportType, fileName, java(d));
        % 16 22
        % 17 22
        % 18 22
        % 19 22
        % 20 22
        if isExternal
            adRG.PostConvertImport = true;
        end % if
    catch
        errMsg = sprintf('Could not import file "%s"', fileName);
        out = d.createComment(errMsg);
        this.status(errMsg, 2.0);
        this.status(lasterr, 5.0);
    end % try
