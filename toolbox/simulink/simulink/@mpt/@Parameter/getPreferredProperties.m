function list = getPreferredProperties(hObjectHandle)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    defaultList = {'Value';'DataType';'Dimensions';'Min';'Max';'StorageClass';'Description';'DocUnits';'Complexity';'UserObjectType';'RTWInfo.Alias';'RTWInfo.CustomAttributes.MemorySection';'RTWInfo.CustomAttributes.Owner';'RTWInfo.CustomAttributes.HeaderFile';'RTWInfo.CustomAttributes.DefinitionFile';'RTWInfo.CustomAttributes.ExportedMacroFile';'RTWInfo.CustomAttributes.ExportedMacroName';'RTWInfo.CustomAttributes.PersistenceLevel';'RTWInfo.CustomAttributes.StructName';'RTWInfo.CustomAttributes.DataAccess'};
    % 8 21
    % 9 21
    % 10 21
    % 11 21
    % 12 21
    % 13 21
    % 14 21
    % 15 21
    % 16 21
    % 17 21
    % 18 21
    % 19 21
    % 20 21
    list = defaultList;
    try
        if eq(exist('ec_get_additional_preferred_prop', 'file'), 2.0)
            addiList = ec_get_additional_preferred_prop(hObjectHandle);
            for i=1.0:length(addiList)
                if not(ismember(addiList{i}, list))
                    list{plus(end, 1.0)} = addiList{i};
                end % if
            end % for
        end % if
    catch
        % 32 33
        list = defaultList;
    end % try
    return;
end % function
