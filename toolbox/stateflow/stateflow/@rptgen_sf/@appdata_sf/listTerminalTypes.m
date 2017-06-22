function tTypes = listTerminalTypes(adSF)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    reportableList = horzcat(adSF.TypeTable.isReportable);
    terminalList = not(horzcat(adSF.TypeTable.isParentable));
    % 10 11
    termIdx = find(and(reportableList, terminalList));
    tTypes = ctranspose(cellhorzcat(adSF.TypeTable(termIdx).Name));
end % function
