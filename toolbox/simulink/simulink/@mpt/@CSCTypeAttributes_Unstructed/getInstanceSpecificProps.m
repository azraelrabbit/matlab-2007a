function props = getInstanceSpecificProps(hCSCTypeAttributes)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    props = [];
    % 8 9
    if hCSCTypeAttributes.IsOwnerInstanceSpecific
        ptmp = findprop(hCSCTypeAttributes, 'Owner');
        props = vertcat(props, ptmp);
    end % if
    % 13 14
    if hCSCTypeAttributes.IsDefinitionFileInstanceSpecific
        ptmp = findprop(hCSCTypeAttributes, 'DefinitionFile');
        props = vertcat(props, ptmp);
    end % if
    % 18 19
    if hCSCTypeAttributes.IsExportedMacroFileInstanceSpecific
        ptmp = findprop(hCSCTypeAttributes, 'ExportedMacroFile');
        props = vertcat(props, ptmp);
    end % if
    % 23 24
    if hCSCTypeAttributes.IsExportedMacroNameInstanceSpecific
        ptmp = findprop(hCSCTypeAttributes, 'ExportedMacroName');
        props = vertcat(props, ptmp);
    end % if
    % 28 30
    % 29 30
    if hCSCTypeAttributes.IsPersistenceLevelInstanceSpecific
        ptmp = findprop(hCSCTypeAttributes, 'PersistenceLevel');
        props = vertcat(props, ptmp);
    end % if
end % function
