function varargout = getParamsLibrary(this, transformType, libAction)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    if isa(transformType, 'RptgenML.StylesheetEditor')
        transformType = transformType.TransformType;
    end
    % 10 12
    propName = horzcat('Params', transformType);
    pLib = get(this, propName);
    % 13 15
    if isempty(pLib)
        if gt(nargin, 2.0) && strcmpi(libAction, '-asynchronous') && usejava('jvm')
            % 16 18
            pLib = RptgenML.Message(xlate('Searching...'), xlate('Building parameter list.'));
            % 18 21
            % 19 21
            eval(com.mathworks.jmi.Matlab, horzcat('getParamsLibrary(RptgenML.StylesheetRoot,''', transformType, ''',''-deferred'');'), [], 0.0);
            % 21 23
            if gt(nargout, 0.0)
                varargout = cellhorzcat(pLib);
            end
            return
        end
        % 27 29
        pLib = RptgenML.Library(horzcat('param_', transformType));
        set(this, propName, pLib);
        % 30 33
        % 31 33
        try
            % 33 35
            scp = com.mathworks.toolbox.rptgen.xml.StylesheetCustomizationParser.getParser(transformType);
        catch
            warning(lasterr)
            return
        end % try
        % 39 41
        catEl = scp.findFirstCategory;
        while not(isempty(catEl))
            libCat = RptgenML.LibraryCategory(char(scp.getCategoryName), 'HelpMapFile', RptgenML.getHelpMapfile, 'HelpMapKey', horzcat('category.StylesheetElement.', transformType));
            % 43 46
            % 44 46
            connect(libCat, pLib, 'up');
            % 46 48
            docEl = scp.findFirstParameter;
            while not(isempty(docEl))
                if scp.getParamVisible
                    try
                        ssData = RptgenML.createStylesheetElement([], scp);
                    catch
                        ssData = [];
                    end % try
                    if not(isempty(ssData))
                        connect(ssData, libCat, 'up');
                    end
                end
                % 59 61
                docEl = scp.findNextParameter;
            end % while
            % 62 64
            catEl = scp.findNextCategory;
        end % while
        % 65 67
        if gt(nargin, 2.0) && strcmpi(libAction, '-deferred')
            % 67 70
            % 68 70
            r = RptgenML.Root;
            ed = DAStudio.EventDispatcher;
            ed.broadcastEvent('ListChangedEvent', r.getCurrentTreeNode);
            % 72 74
        end
    else
        if gt(nargin, 2.0) && strcmpi(libAction, '-clear')
            pLib = [];
            set(this, propName, pLib);
        end
    end
    if gt(nargout, 0.0)
        varargout = cellhorzcat(pLib);
    end
end
function isVis = getFmtVis(fmtID)
    % 85 88
    % 86 88
    try
        isVis = getVisible(com.mathworks.toolbox.rptgencore.output.OutputFormat.getFormat(fmtID));
    catch
        isVis = false;
    end % try
end
