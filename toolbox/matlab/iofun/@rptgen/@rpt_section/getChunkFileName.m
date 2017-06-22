function fName = getChunkFileName(this, adRG)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    fName = adRG.RootComponent.Output.DstFileName;
    [fPath, fName, fExt] = fileparts(fName);
    if isempty(fName)
        fName = 'unnamed';
    end % if
    % 13 15
    htmlExt = char(getExtension(com.mathworks.toolbox.rptgencore.output.OutputFormat.getFormat('html')));
    % 15 17
    fName = sprintf('%s-%0.3i.%s', fName, this.RuntimeSectionIndex, htmlExt);
