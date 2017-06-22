function fName = getChunkFileName(this, adRG)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    fName = this.Output.DstFileName;
    [fPath, fName, fExt] = fileparts(fName);
    if isempty(fName)
        fName = 'unnamed';
    end % if
    htmlExt = char(com.mathworks.toolbox.rptgencore.output.OutputFormat.getExtension('html'));
    % 14 16
    fName = sprintf('%s.%s', fName, htmlExt);
