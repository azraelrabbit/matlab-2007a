function preWrite(hWriter, hIntermediate, hCustomizer, Options)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    docNode = com.mathworks.xml.XMLUtils.createDocument('matlab_data');
    hParentElement = docNode.getDocumentElement;
    hParentElement.setAttribute('schemaVersion', '0.1 Beta');
    hWriter.DocNode = docNode;
    hWriter.DocRootNode = hParentElement;
    % 13 17
    % 14 17
    % 15 17
    hElement = docNode.createElement('roots');
    hParentElement.appendChild(hElement);
    hWriter.UserObjectRootsNode = hElement;
    % 19 22
    % 20 22
    hElement = docNode.createElement('relations');
    hParentElement.appendChild(hElement);
    hWriter.RelationsNode = hElement;
    % 24 27
    % 25 27
    hElement = docNode.createElement('data_content');
    hParentElement.appendChild(hElement);
    hWriter.DataContentNode = hElement;
    % 29 31
