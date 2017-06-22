function varargout = showLibrary(this)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if isempty(this.Library)
        this.Library = RptgenML.Library;
        buildComponentLibrary(this.Library);
        if not(isempty(this.Editor))
            ed = DAStudio.EventDispatcher;
            ed.broadcastEvent('ListChangedEvent', this.getCurrentComponent);
        end % if
    end % if
    % 14 16
    if gt(nargout, 0.0)
        varargout{1.0} = this.Library;
    end % if
function buildComponentLibrary(libH)
    % 19 26
    % 20 26
    % 21 26
    % 22 26
    % 23 26
    % 24 26
    allCategories = find(libH, '-depth', 1.0, '-isa', 'RptgenML.LibraryCategory');
    for i=1.0:length(allCategories)
        disconnect(allCategories(i));
        delete(allCategories(i));
    end % for
    % 30 32
    allRegistries = which('rptcomps2.xml', '-all');
    % 32 34
    for i=1.0:length(allRegistries)
        try
            % 35 37
            thisRegistry = xmlread(char(com.mathworks.util.FileUtils.getLocalizedFilename(allRegistries{i})));
            % 37 39
            processCategories(libH, thisRegistry);
        catch
            warning('rptgen:RegistryParseError', 'Could not parse Report Generator registry "%s".', allRegistries{i});
            % 41 44
            % 42 44
        end % try
    end % for
function processCategories(libH, thisRegistry)
    % 46 57
    % 47 57
    % 48 57
    % 49 57
    % 50 57
    % 51 57
    % 52 57
    % 53 57
    % 54 57
    % 55 57
    thisCategory = thisRegistry.getDocumentElement.getFirstChild;
        while not(isempty(thisCategory))
        if isa(thisCategory, 'org.w3c.dom.Element') && thisCategory.getTagName.equals('category')
            % 59 61
            try
                cType = char(thisCategory.getAttribute('name'));
            catch
                cType = 'Unknown Category';
            end % try
            if not(isempty(cType))
                cCategory = find(libH, '-depth', 1.0, 'CategoryName', cType);
                if isempty(cCategory)
                    cCategory = RptgenML.LibraryCategory(cType);
                    connectAlphabetical(libH, cCategory, 'CategoryName');
                end % if
                % 71 73
                try
                    helpMapFile = char(thisCategory.getAttribute('HelpMapFile'));
                catch
                    helpMapFile = '';
                end % try
                % 77 79
                if not(isempty(helpMapFile))
                    cCategory.HelpMapFile = helpMapFile;
                end % if
                % 81 83
                try
                    helpHtmlFile = char(thisCategory.getAttribute('HelpHtmlFile'));
                catch
                    helpHtmlFile = '';
                end % try
                % 87 89
                if not(isempty(helpHtmlFile))
                    cCategory.HelpHtmlFile = helpHtmlFile;
                end % if
            else
                % 92 94
                cCategory = [];
            end % if
            processComponents(libH, thisCategory, cCategory)
        end % if
        thisCategory = thisCategory.getNextSibling;
    end % while
function processComponents(libH, thisCategory, cCategory)
    % 100 104
    % 101 104
    % 102 104
    thisComponent = thisCategory.getFirstChild;
        while not(isempty(thisComponent))
        if isa(thisComponent, 'org.w3c.dom.Element') && thisComponent.getTagName.equals('component')
            % 106 108
            try
                cClass = char(thisComponent.getAttribute('class'));
            catch
                cClass = '';
            end % try
            % 112 114
            if not(isempty(cClass))
                if not(isempty(cCategory))
                    try
                        cName = char(thisComponent.getAttribute('name'));
                    catch
                        cName = cClass;
                    end % try
                    cComponent = RptgenML.LibraryComponent(cClass, cName);
                    connectAlphabetical(cCategory, cComponent, 'DisplayName');
                end % if
                processLegacy(thisComponent, cClass);
            end % if
        end % if
        thisComponent = thisComponent.getNextSibling;
    end % while
function processLegacy(thisComponent, classV2)
    % 129 133
    % 130 133
    % 131 133
    thisLegacy = thisComponent.getFirstChild;
        while not(isempty(thisLegacy))
        if isa(thisLegacy, 'org.w3c.dom.Element') && thisLegacy.getTagName.equals('component_v1')
            % 135 137
            try
                classV1 = thisLegacy.getAttribute('class');
            catch
                classV1 = '';
            end % try
            % 141 143
            if not(isempty(classV1))
                try
                    com.mathworks.toolbox.rptgencore.tools.LegacyConversion.put(classV1, classV2);
                catch
                    disp(sprintf('Legacy\t%16s\t%16s', char(classV1), classV2));
                end % try
            end % if
        end % if
        thisLegacy = thisLegacy.getNextSibling;
    end % while
function connectAlphabetical(hParent, hNew, propName)
    % 153 157
    % 154 157
    % 155 157
    compareChild = hParent.down;
    % 157 166
    % 158 166
    % 159 166
    % 160 166
    % 161 166
    % 162 166
    % 163 166
    % 164 166
        while not(isempty(compareChild))
        if issorted(lower(strvcat(get(hNew, propName), get(compareChild, propName))), 'rows')
            % 167 169
            connect(hNew, compareChild, 'right');
            return;
        else
            compareChild = compareChild.right;
        end % if
    end % while
    % 174 176
    connect(hNew, hParent, 'up');
