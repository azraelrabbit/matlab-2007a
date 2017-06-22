function isLicensed = power_initmask
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    isLicensed = true;
    % 9 11
    rootSystem = bdroot(gcb);
    blockIsInLibrary = strcmp(get_param(rootSystem, 'BlockDiagramType'), 'library');
    % 12 14
    if blockIsInLibrary
        licenseParam = 'LibLicenseID';
        licenseValue = 'Power_System_Blocks';
        params = get_param(rootSystem, 'ObjectParameters');
        isLicensedLibrary = isfield(params, licenseParam) && strcmp(get_param(rootSystem, licenseParam), licenseValue);
        % 18 20
        if isLicensedLibrary
            return
        end
    end
    % 23 26
    % 24 26
    isLicensed = power_checklicense('false');
    % 26 28
    if eq(isLicensed, false)
        % 28 30
        dispScript = sprintf('color(''red'');\ndisp(''%s\\n%s'');', 'No', 'License');
        set_param(gcb, 'MaskDisplay', dispScript, 'MaskIconOpaque', 'on', 'BackgroundColor', 'white');
        % 31 33
    end
end
