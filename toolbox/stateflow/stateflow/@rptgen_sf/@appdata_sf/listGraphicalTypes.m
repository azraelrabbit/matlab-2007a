function tTypes = listGraphicalTypes(adSF)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    reportableList = horzcat(adSF.TypeTable.isReportable);
    graphicalList = horzcat(adSF.TypeTable.isGraphical);
    % 10 11
    gIdx = find(and(reportableList, graphicalList));
    tTypes = ctranspose(cellhorzcat(adSF.TypeTable(gIdx).Name));
end % function
