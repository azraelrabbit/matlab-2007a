function viewFile(fileName)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    fullFileName = which(fileName);
    % 13 15
    if isempty(fullFileName)
        findExt = {'html','rtf97','pdf-fop','db','fot','txt','ps','html-dsssl','doc-rtf'};
        extCount = length(findExt);
        i = 1.0;
        while le(i, extCount) && isempty(fullFileName)
            fullFileName = rptgen.findFile(fileName, char(com.mathworks.toolbox.rptgencore.output.OutputFormat.getExtension(findExt{i})));
            % 20 22
            i = plus(i, 1.0);
        end % while
    end % if
    % 24 26
    if isempty(fullFileName)
        error('rptgen:viewFile:FileNotFound', 'Could not find file "%s"', fileName);
    end % if
    % 28 30
    viewCmd = char(javaMethod('getViewCommandByFile', 'com.mathworks.toolbox.rptgencore.tools.RptgenPrefsPanel', fullFileName));
    % 30 35
    % 31 35
    % 32 35
    % 33 35
    evalin('base', viewCmd);
