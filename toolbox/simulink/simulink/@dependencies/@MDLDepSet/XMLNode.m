function depsetElement = XMLNode(obj, docNode)
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
    % 12 13
    dependencies.assert(eq(numel(obj), 1.0), 'Exactly one object required');
    % 14 17
    % 15 17
    % 16 17
    depsetElement = docNode.createElement('MDLDepSet');
    % 18 19
    dependencies.xmltextnode(docNode, depsetElement, 'MDLName', obj.MDLName);
    dependencies.xmltextnode(docNode, depsetElement, 'FileName', obj.FileName);
    % 21 22
    dependencies.xmltextnode(docNode, depsetElement, 'AnalysisDate', obj.AnalysisDate);
    % 23 24
    depsetElement.appendChild(obj.Options.XMLNode(docNode));
    % 25 27
    % 26 27
    refmdlsElement = docNode.createElement('ReferencedModels');
    depsetElement.appendChild(refmdlsElement);
    for i=1.0:numel(obj.ReferencedModels)
        mdlElement = docNode.createElement('MDLFile');
        refmdlsElement.appendChild(mdlElement);
        dependencies.xmltextnode(docNode, mdlElement, 'MDLName', obj.ReferencedModels{i});
        mdlElement.appendChild(obj.ReferencedModelFiles(i).XMLNode(docNode));
    end % for
    % 35 37
    % 36 37
    libsElement = docNode.createElement('LinkedLibraries');
    depsetElement.appendChild(libsElement);
    for i=1.0:numel(obj.LinkedLibraries)
        libraryElement = docNode.createElement('MDLFile');
        libsElement.appendChild(libraryElement);
        dependencies.xmltextnode(docNode, libraryElement, 'MDLName', obj.LinkedLibraries{i});
        libraryElement.appendChild(obj.LinkedLibraryFiles(i).XMLNode(docNode));
    end % for
    % 45 49
    % 46 49
    % 47 49
    % 48 49
    toolboxesElement = docNode.createElement('Toolboxes');
    depsetElement.appendChild(toolboxesElement);
    for i=1.0:numel(obj.Toolboxes)
        toolboxElement = obj.Toolboxes(i).XMLNode(docNode);
        toolboxesElement.appendChild(toolboxElement);
    end % for
    % 55 57
    % 56 57
    allfilesElement = docNode.createElement('AllFiles');
    depsetElement.appendChild(allfilesElement);
    % 59 60
    for i=1.0:numel(obj.AllFiles)
        fn = obj.AllFiles(i).XMLNode(docNode);
        allfilesElement.appendChild(fn);
    end % for
    % 64 66
    % 65 66
    alldirsElement = docNode.createElement('AllIncludeDirs');
    depsetElement.appendChild(alldirsElement);
    % 68 69
    for i=1.0:numel(obj.AllIncludeDirs)
        fn = obj.AllIncludeDirs(i).XMLNode(docNode);
        alldirsElement.appendChild(fn);
    end % for
    % 73 75
    % 74 75
    allrefsElement = docNode.createElement('AllReferences');
    depsetElement.appendChild(allrefsElement);
    % 77 78
    for i=1.0:numel(obj.AllReferences)
        fn = obj.AllReferences(i).XMLNode(docNode);
        allrefsElement.appendChild(fn);
    end % for
end % function
