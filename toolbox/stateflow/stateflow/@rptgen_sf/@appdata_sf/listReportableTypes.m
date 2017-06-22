function rTypes = listReportableTypes(adSF)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    reportableList = horzcat(adSF.TypeTable.isReportable);
    rIdx = find(reportableList);
    rTypes = ctranspose(cellhorzcat(adSF.TypeTable(rIdx).Name));
end % function
