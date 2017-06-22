function node = XMLNode(obj, docNode)
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
    node = docNode.createElement('DepSetDiffs');
    % 18 19
    firstdepsetElement = docNode.createElement('DepSet1');
    node.appendChild(firstdepsetElement);
    for i=1.0:numel(obj.DepSet1)
        firstdepsetElement.appendChild(obj.DepSet1(i).XMLNode(docNode));
    end % for
    % 24 25
    dependencies.xmltextnode(docNode, node, 'Manifest1', obj.Manifest1);
    % 26 28
    % 27 28
    seconddepsetElement = docNode.createElement('DepSet2');
    node.appendChild(seconddepsetElement);
    for i=1.0:numel(obj.DepSet2)
        seconddepsetElement.appendChild(obj.DepSet2(i).XMLNode(docNode));
    end % for
    % 33 34
    dependencies.xmltextnode(docNode, node, 'Manifest2', obj.Manifest2);
    % 35 37
    % 36 37
    firstonlyElement = docNode.createElement('FilesInFirstOnly');
    node.appendChild(firstonlyElement);
    for i=1.0:numel(obj.FilesInFirstOnly)
        firstonlyElement.appendChild(obj.FilesInFirstOnly(i).XMLNode(docNode));
    end % for
    % 42 43
    secondonlyElement = docNode.createElement('FilesInSecondOnly');
    node.appendChild(secondonlyElement);
    for i=1.0:numel(obj.FilesInSecondOnly)
        secondonlyElement.appendChild(obj.FilesInSecondOnly(i).XMLNode(docNode));
    end % for
    % 48 49
    modifiedElement = docNode.createElement('ModifiedFilesFirst');
    node.appendChild(modifiedElement);
    for i=1.0:numel(obj.ModifiedFilesFirst)
        modifiedElement.appendChild(obj.ModifiedFilesFirst(i).XMLNode(docNode));
    end % for
    % 54 55
    modifiedElement = docNode.createElement('ModifiedFilesSecond');
    node.appendChild(modifiedElement);
    for i=1.0:numel(obj.ModifiedFilesSecond)
        modifiedElement.appendChild(obj.ModifiedFilesSecond(i).XMLNode(docNode));
    end % for
    % 60 61
    unmodifiedElement = docNode.createElement('UnmodifiedFiles');
    node.appendChild(unmodifiedElement);
    for i=1.0:numel(obj.UnmodifiedFiles)
        unmodifiedElement.appendChild(obj.UnmodifiedFiles(i).XMLNode(docNode));
    end % for
    % 66 67
    dirElement = docNode.createElement('DirsInFirstOnly');
    node.appendChild(dirElement);
    dependencies.xmlcellnode(docNode, dirElement, 'DirList', 'DirName', obj.DirsInFirstOnly);
    % 70 73
    % 71 73
    % 72 73
    dirElement = docNode.createElement('DirsInSecondOnly');
    node.appendChild(dirElement);
    dependencies.xmlcellnode(docNode, dirElement, 'DirList', 'DirName', obj.DirsInSecondOnly);
    % 76 79
    % 77 79
    % 78 79
    dirElement = docNode.createElement('DirsInBoth');
    node.appendChild(dirElement);
    dependencies.xmlcellnode(docNode, dirElement, 'DirList', 'DirName', obj.DirsInBoth);
end % function
