function hNewPackageDefn = deep_copy(hOrigPackageDefn)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    hNewPackageDefn = hOrigPackageDefn.copy;
    % 9 11
    % 10 11
    hOrigClasses = hOrigPackageDefn.Classes;
    hNewClasses = [];
    for i=1.0:length(hOrigClasses)
        hNewClasses = vertcat(hNewClasses, horzcat(hOrigClasses(i).deep_copy));
    end % for
    hNewPackageDefn.Classes = hNewClasses;
    % 17 19
    % 18 19
    hOrigClasses = hOrigPackageDefn.OldRTWInfoClasses;
    hNewClasses = [];
    for i=1.0:length(hOrigClasses)
        hNewClasses = vertcat(hNewClasses, horzcat(hOrigClasses(i).deep_copy));
    end % for
    hNewPackageDefn.OldRTWInfoClasses = hNewClasses;
    % 25 27
    % 26 27
    hOrigEnumTypes = hOrigPackageDefn.EnumTypes;
    hNewEnumTypes = [];
    for i=1.0:length(hOrigEnumTypes)
        hNewEnumTypes = vertcat(hNewEnumTypes, horzcat(hOrigEnumTypes(i).copy));
    end % for
    hNewPackageDefn.EnumTypes = hNewEnumTypes;
    % 33 35
    % 34 35
    hOrigEnumTypes = hOrigPackageDefn.OldEnumTypes;
    hNewEnumTypes = [];
    for i=1.0:length(hOrigEnumTypes)
        hNewEnumTypes = vertcat(hNewEnumTypes, horzcat(hOrigEnumTypes(i).copy));
    end % for
    hNewPackageDefn.OldEnumTypes = hNewEnumTypes;
    % 41 43
    % 42 43
    hOrigCSCs = hOrigPackageDefn.CustomStorageClasses;
    hNewCSCs = [];
    for i=1.0:length(hOrigCSCs)
        hNewCSCs = vertcat(hNewCSCs, horzcat(hOrigCSCs(i).copy));
    end % for
    hNewPackageDefn.CustomStorageClasses = hNewCSCs;
end % function
