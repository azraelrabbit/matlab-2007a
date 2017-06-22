function out = execute(c, d, varargin)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    out = '';
    % 9 11
    adRG = rptgen.appdata_rg;
    fName = rptgen.parseExpressionText(c.FileName);
    [nPath, nName, nExt] = fileparts(fName);
    if c.FindAllFiles && isempty(nPath)
        if not(isempty(nExt))
            allNames = which(fName, '-all');
        else
            allNames = which(horzcat(fName, '.rpt'), '-all');
        end
        nFiles = length(allNames);
        if eq(nFiles, 0.0)
            c.status(sprintf('Setup file "%s" not found', fName), 2.0);
        else
            if eq(nFiles, 1.0)
                out = locNest(c, allNames{1.0}, d, adRG);
            else
                out = d.createDocumentFragment;
                for i=1.0:nFiles
                    thisOut = locNest(c, allNames{i}, d, adRG);
                    if isa(thisOut, 'org.w3c.dom.Node')
                        out.appendChild(thisOut);
                    else
                    end
                end % for
            end
        end
    else
        foundName = rptgen.findFile(fName, 'rpt');
        if isempty(foundName)
            c.status(sprintf('File "%s" not found', fName), 2.0);
        else
            out = locNest(c, foundName, d, adRG);
        end
    end
end
function out = locNest(c, fileName, d, adRG)
    % 46 49
    % 47 49
    out = '';
    % 49 51
    nestDepth = 0.0;
    if c.Inline
        % 52 54
        parentComponent = c.up;
        while not(isempty(parentComponent))
            if isa(parentComponent, 'rptgen.crg_nest_set') && strcmp(parentComponent.RuntimeFileName, fileName)
                % 56 58
                nestDepth = plus(nestDepth, 1.0);
            end
            parentComponent = parentComponent.up;
        end % while
        % 61 63
        if gt(nestDepth, c.RecursionLimit)
            c.status(sprintf('Recursion limit of "%i" exceeded (%s)', c.RecursionLimit, fileName), 2.0);
            % 64 66
            return
        end
    else
        if strcmp(fileName, adRG.RootComponent.RptFileName)
            % 69 71
            c.status(xlate('Recursion forbidden in non-inlined nested files'), 2.0);
            return
        end
    end
    % 74 84
    % 75 84
    % 76 84
    % 77 84
    % 78 84
    % 79 84
    % 80 84
    % 81 84
    % 82 84
    if not(isempty(c.RuntimeNestedReport)) && strcmp(c.RuntimeNestedReport.RptFileName, fileName)
        newFile = c.RuntimeNestedReport;
    else
        try
            newFile = rptgen.loadRpt(fileName);
        catch
            newFile = [];
        end % try
        % 91 93
        if isempty(newFile)
            c.status(sprintf('Could not load file "%s"', fileName), 2.0);
            return
        else
            c.RuntimeNestedReport = newFile;
        end
    end
    % 99 105
    % 100 105
    % 101 105
    % 102 105
    % 103 105
    if not(isa(newFile, 'rptgen.coutline'))
        templateComponent = adRG.RootComponent;
        % 106 108
        newFileComponents = newFile;
        newFile = rptgen.coutline;
        % 109 111
        newFile.RptFileName = fileName;
        newFile.Output.Format = templateComponent.Output.Format;
        newFile.Output.StylesheetHTML = templateComponent.Output.StylesheetHTML;
        newFile.Output.StylesheetFO = templateComponent.Output.StylesheetFO;
        % 114 116
        connect(newFile, newFileComponents, 'down');
        c.RuntimeNestedReport = newFile;
    end
    % 118 120
    c.RuntimeFileName = fileName;
    % 120 122
    if not(c.Inline)
        newFile.isView = false;
        newFile.isIncrementFilename = c.IncrementFilename;
        newFile.isAutoSaveOnGenerate = false;
        newFile.isDebug = get(rptgen.appdata_rg, 'Debug');
        reportName = newFile.execute;
        [rPath, rFile] = fileparts(reportName);
        if c.InsertFilename && not(isempty(rFile))
            out = makeLink(d, rptgen.file2urn(reportName), rFile, 'ulink');
            % 130 134
            % 131 134
            % 132 134
        end
    else
        if eq(nestDepth, 0.0)
            % 136 140
            % 137 140
            % 138 140
            rootComp = get(rptgen.appdata_rg, 'RootComponent');
            rootComp.ApplicationDataObjects = newFile.initialize(rootComp.ApplicationDataObjects);
            % 141 143
        end
        % 143 145
        newFile.RuntimeSectionType = 'ignore';
        connect(newFile, c, 'up');
        out = newFile.runChildren(d);
        disconnect(newFile);
        newFile.RuntimeSectionType = '';
    end
    % 150 152
    c.RuntimeFileName = '';
end
