function preRead(hReader, hIntermediate, hCustomizer, Options)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    s_loadXMLFile(hReader);
    % 10 12
    % 11 12
    s_preprocessXMLNodes(hReader);
    % 13 14
end % function
function s_loadXMLFile(hReader)
    % 16 30
    % 17 30
    % 18 30
    % 19 30
    % 20 30
    % 21 30
    % 22 30
    % 23 30
    % 24 30
    % 25 30
    % 26 30
    % 27 30
    % 28 30
    % 29 30
    ReadOKFlag = hReader.verifyFileName();
    % 31 33
    % 32 33
    if ReadOKFlag
        % 34 35
        FileName = hReader.FileName;
        % 36 38
        % 37 38
        try
            % 39 40
            docNode = xmlread(FileName);
        catch
            % 42 43
            error('The file "%s" could not be loaded in XML.', FileName);
        end % try
        % 45 47
        % 46 47
        hReader.DocNode = docNode;
        hReader.DocRootNode = docNode.getDocumentElement;
    end % if
    % 50 51
end % function
function s_preprocessXMLNodes(hReader)
    % 53 61
    % 54 61
    % 55 61
    % 56 61
    % 57 61
    % 58 61
    % 59 61
    % 60 61
    MLDataNode = hReader.getNamedXMLNodes(hReader.DocNode, 'matlab_data');
    % 62 64
    % 63 64
    if not(isempty(MLDataNode))
        % 65 66
        XMLRoots = hReader.getNamedXMLNodes(MLDataNode{1.0}, 'roots');
        XMLRoots = hReader.getNamedXMLNodes(XMLRoots{1.0}, 'root');
        % 68 70
        % 69 70
        XMLRelations = hReader.getNamedXMLNodes(MLDataNode{1.0}, 'relations');
        XMLRelations = hReader.getNamedXMLNodes(XMLRelations{1.0}, 'relation');
        % 72 74
        % 73 74
        XMLNodeType = hReader.getXMLNodeTypes();
        XMLTopLevel = hReader.getNamedXMLNodes(MLDataNode{1.0}, 'data_content');
        XMLTopLevel = hReader.getNamedXMLNodes(XMLTopLevel{1.0}, XMLNodeType);
        % 77 79
        % 78 79
        NumXMLRoots = length(XMLRoots);
        NumXMLTopLevel = length(XMLTopLevel);
        % 81 83
        % 82 83
        if isequal(NumXMLRoots, NumXMLTopLevel)
            % 84 85
            hReader.XMLRoots = XMLRoots;
            hReader.XMLRelations = XMLRelations;
            hReader.XMLTopLevel = XMLTopLevel;
            % 88 90
            % 89 90
            hReader.XMLRootsID = s_getXMLNodeInfo(hReader, XMLRoots, 'matlab.id', '');
            hReader.XMLTopLevelID = s_getXMLNodeInfo(hReader, XMLTopLevel, 'matlab.id', '');
            % 92 95
            % 93 95
            % 94 95
            hReader.ArrayID = hReader.XMLRootsID;
            % 96 98
            % 97 98
            hReader.ArrayName = s_getXMLNodeInfo(hReader, XMLRoots, 'name', '');
        else
            % 100 101
            % 101 102
            error('The XML file is specified incorrectly.')
        end % if
    else
        % 105 106
        error('The XML file is not a Matlab data file.')
    end % if
    % 108 109
end % function
function InfoCell = s_getXMLNodeInfo(hReader, hXMLCell, AttName, Default)
    % 111 118
    % 112 118
    % 113 118
    % 114 118
    % 115 118
    % 116 118
    % 117 118
    NumXMLNode = length(hXMLCell);
    InfoCell = repmat(cellhorzcat(Default), NumXMLNode, 1.0);
    % 120 122
    % 121 122
    for idx=1.0:NumXMLNode
        % 123 124
        AttValue = hReader.getXMLNodeAttribute(hXMLCell{idx}, AttName);
        % 125 127
        % 126 127
        if not(isempty(AttValue))
            % 128 129
            InfoCell{idx} = AttValue;
        end % if
    end % for
    % 132 133
end % function
