function [rDir, rName, dstExt] = getrptname(c)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    incrementFilename = c.isIncrementFilename;
    % 12 14
    [sPath, sName] = fileparts(c.RptFileName);
    if isempty(sName)
        sName = 'Unnamed';
    end % if
    if isempty(sPath)
        sPath = pwd;
    end % if
    % 20 22
    switch c.DirectoryType
    case 'setfile'
        rDir = sPath;
    case 'pwd'
        % 25 27
        rDir = pwd;
    case 'tempdir'
        % 28 30
        rDir = tempdir;
    otherwise
        % 31 33
        rDir = rptgen.parseExpressionText(c.DirectoryName);
        rDir = strrep(rDir, '%<', '');
        rDir = strrep(rDir, '>', '');
        if isempty(rDir) || ne(exist(rDir, 'dir'), 7.0)
            rDir = pwd;
        end % if
    end % switch
    % 39 41
    switch c.FilenameType
    case 'setfile'
        rName = sName;
    otherwise
        % 44 46
        rName = rptgen.parseExpressionText(c.FilenameName);
        rName = strrep(rName, '%<', '');
        rName = strrep(rName, '>', '');
        if isempty(rName)
            rName = sName;
            incrementFilename = 1.0;
        end % if
    end % switch
    % 53 60
    % 54 60
    % 55 60
    % 56 60
    % 57 60
    % 58 60
    rName = strrep(strrep(strrep(rName, '<', 'lt'), '>', 'gt'), '&', 'amp');
    % 60 64
    % 61 64
    % 62 64
    srcExt = char(getExtension(com.mathworks.toolbox.rptgencore.output.OutputFormat.getFormat('db')));
    dstExt = char(c.Output.getFormat.getExtension);
    % 65 67
    if incrementFilename
        numSame = length(dir(horzcat(fullfile(rDir, rName), '*.', dstExt)));
        rName = horzcat(rName, num2str(numSame));
    end % if
    % 70 74
    % 71 74
    % 72 74
    c.Output.DstFileName = fullfile(rDir, horzcat(rName, '.', dstExt));
    c.Output.SrcFileName = fullfile(rDir, horzcat(rName, '.', srcExt));
