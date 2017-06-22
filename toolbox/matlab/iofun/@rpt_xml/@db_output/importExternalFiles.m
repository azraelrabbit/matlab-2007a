function filesImported = importExternalFiles(this, fileName)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    if lt(nargin, 2.0)
        fileName = this.DstFileName;
    end % if
    % 13 15
    filesImported = false;
    % 15 17
    rptgen.displayMessage(xlate('Importing external files'), 4.0);
    % 17 19
    try
        filesImported = com.mathworks.toolbox.rptgencore.docbook.FileImporter.scanDocumentForImports(fileName);
    catch
        rptgen.displayMessage(lasterr, 2.0);
        % 22 24
    end % try
    % 24 27
    % 25 27
    [chunkPath, chunkFile, chunkExt] = fileparts(fileName);
    chunkFiles = dir(fullfile(chunkPath, horzcat(chunkFile, '-*', chunkExt)));
    for i=1.0:length(chunkFiles)
        try
            filesImported = max(filesImported, com.mathworks.toolbox.rptgencore.docbook.FileImporter.scanDocumentForImports(fullfile(chunkPath, chunkFiles(i).name)));
        catch
            % 32 34
            c.status(lasterr, 2.0);
            % 34 36
        end % try
    end % for
