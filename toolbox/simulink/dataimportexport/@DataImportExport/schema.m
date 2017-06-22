function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    try
        FeatureFlag = slfeature('DataObjectImportExportToXML');
    catch
        FeatureFlag = 0.0;
    end % try
    % 13 15
    % 14 15
    if isequal(FeatureFlag, 0.0)
        error('This feature is not available.')
    end % if
    % 18 20
    % 19 20
    schema.package('DataImportExport');
end % function
