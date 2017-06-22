function isIt = pmiu_isTopSubsys(xObj)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    isIt = strcmp(class(xObj.up), class(cad_xml.PhysicalModelingXMLFile));
end % function
