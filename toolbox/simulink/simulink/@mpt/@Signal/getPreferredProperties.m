function list = getPreferredProperties(hObjectHandle)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    defaultList = {'DataType';'Dimensions';'Min';'Max';'StorageClass';'Description';'DocUnits';'Complexity';'SampleTime';'SamplingMode';'InitialValue';'UserObjectType';'RTWInfo.Alias';'RTWInfo.InitialValue';'RTWInfo.CustomAttributes.MemorySection';'RTWInfo.CustomAttributes.Owner';'RTWInfo.CustomAttributes.HeaderFile';'RTWInfo.CustomAttributes.DefinitionFile';'RTWInfo.CustomAttributes.ExportedMacroFile';'RTWInfo.CustomAttributes.ExportedMacroName';'RTWInfo.CustomAttributes.PersistenceLevel';'RTWInfo.CustomAttributes.StructName';'RTWInfo.CustomAttributes.DataAccess';'RTWInfo.CustomAttributes.GetFunction';'RTWInfo.CustomAttributes.SetFunction'};
    % 8 25
    % 9 25
    % 10 25
    % 11 25
    % 12 25
    % 13 25
    % 14 25
    % 15 25
    % 16 25
    % 17 25
    % 18 25
    % 19 25
    % 20 25
    % 21 25
    % 22 25
    % 23 25
    % 24 25
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
        % 36 37
        list = defaultList;
    end % try
    return;
end % function
