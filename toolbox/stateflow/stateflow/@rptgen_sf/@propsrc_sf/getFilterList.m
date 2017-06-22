function fList = getFilterList(h)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    adSF = rptgen_sf.appdata_sf;
    reportableTypes = listReportableTypes(adSF);
    % 8 10
    fList = vertcat({'Name'}, reportableTypes, strcat(reportableTypes, ' (all)'));
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    fList = horzcat(fList, fList);
end % function
