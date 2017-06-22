function varargout = getrptname(c, SetupFileName)
    % 1 23
    % 2 23
    % 3 23
    % 4 23
    % 5 23
    % 6 23
    % 7 23
    % 8 23
    % 9 23
    % 10 23
    % 11 23
    % 12 23
    % 13 23
    % 14 23
    % 15 23
    % 16 23
    % 17 23
    % 18 23
    % 19 23
    % 20 23
    % 21 23
    if lt(nargin, 2.0)
        SetupFileName = c.rptcomponent.SetfilePath;
    end
    % 25 27
    [sPath, sName, sExt, sVer] = fileparts(SetupFileName);
    if isempty(sName)
        sName = 'Unnamed';
    end
    if isempty(sPath)
        sPath = pwd;
    end
    % 33 35
    switch c.att.DirectoryType
    case 'setfile'
        rDir = sPath;
    case 'pwd'
        rDir = pwd;
    otherwise
        rDir = parsevartext(c.rptcomponent, c.att.DirectoryName);
        rDir = strrep(rDir, '%<', '');
        rDir = strrep(rDir, '>', '');
        % 43 45
        if isempty(rDir)
            rDir = pwd;
        else
            if ne(exist(rDir), 7.0)
                rDir = pwd;
            end
        end
    end
    switch c.att.FilenameType
    case 'setfile'
        rName = sName;
    otherwise
        rName = parsevartext(c.rptcomponent, c.att.FilenameName);
        rName = strrep(rName, '%<', '');
        rName = strrep(rName, '>', '');
    end
    % 60 62
    fInfo = preferences(rptparent);
    fInfo = fInfo.format;
    % 63 65
    formatIndex = find(strcmpi(cellhorzcat(fInfo.Name), c.att.Format));
    if not(isempty(formatIndex))
        rExt = fInfo(formatIndex(1.0)).Ext;
    else
        rExt = 'html';
    end
    % 70 72
    if c.att.isIncrementFilename
        numSame = length(dir(horzcat(fullfile(rDir, rName), '*', rExt)));
        rName = horzcat(rName, num2str(numSame));
    end
    % 75 78
    % 76 78
    if lt(nargout, 5.0)
        if gt(nargout, 0.0)
            varargout{1.0} = rDir;
            if gt(nargout, 1.0)
                varargout{2.0} = rName;
                if gt(nargout, 2.0)
                    varargout{3.0} = rExt;
                    if gt(nargout, 3.0)
                        c.ref.SourceFileName = fullfile(rDir, horzcat(rName, '.sgml'));
                        c.ref.ReportFileName = fullfile(rDir, horzcat(rName, '.', rExt));
                        varargout{4.0} = c;
                        % 88 90
                        c.rptcomponent.ReportDirectory = rDir;
                        c.rptcomponent.ReportFilename = rName;
                        c.rptcomponent.ReportExt = rExt;
                    end
                end
            end
        end
    else
        error('Invalid number of output arguments');
    end
end
