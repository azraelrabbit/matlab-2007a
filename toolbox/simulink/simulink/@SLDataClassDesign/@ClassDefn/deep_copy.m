function hNewClassDefn = deep_copy(hOldClassDefn)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    hNewClassDefn = hOldClassDefn.copy;
    % 9 11
    % 10 11
    hOldDerivedProperties = hOldClassDefn.DerivedProperties;
    hNewDerivedProperties = [];
    for i=1.0:length(hOldDerivedProperties)
        hNewDerivedProperties = vertcat(hNewDerivedProperties, horzcat(hOldDerivedProperties(i).copy));
    end % for
    hNewClassDefn.DerivedProperties = hNewDerivedProperties;
    % 17 19
    % 18 19
    hOldLocalProperties = hOldClassDefn.LocalProperties;
    hNewLocalProperties = [];
    for i=1.0:length(hOldLocalProperties)
        hNewLocalProperties = vertcat(hNewLocalProperties, horzcat(hOldLocalProperties(i).copy));
    end % for
    hNewClassDefn.LocalProperties = hNewLocalProperties;
end % function
