function configData = RunTimeModule_config
    % 1 18
    % 2 18
    % 3 18
    % 4 18
    % 5 18
    % 6 18
    % 7 18
    % 8 18
    % 9 18
    % 10 18
    % 11 18
    % 12 18
    % 13 18
    % 14 18
    % 15 18
    % 16 18
    persistent fConfigData;
    % 18 20
    if isempty(fConfigData)
        % 20 22
        msgPrfx = 'platform:SSC:SimscapeCC:property:EditingMode:';
        % 22 28
        % 23 28
        % 24 28
        % 25 28
        % 26 28
        EditingMode.PropertyName = 'EditingMode';
        EditingMode.Label_msgid = horzcat(msgPrfx, 'label');
        EditingMode.DataType = 'SSC_RTM_EditingModeType';
        EditingMode.Group_msgid = horzcat(msgPrfx, 'group');
        EditingMode.GroupDesc = '';
        EditingMode.ValueLabel_msgidprfx = horzcat(msgPrfx, 'value:');
        EditingMode.Visible = true;
        % 34 36
        EditingMode.MenuTag = 'SSC_EditingMode';
        EditingMode.MenuStatusTip_msgid = horzcat(msgPrfx, 'menustatustip');
        EditingMode.MenuOptionTag_prfx = 'Platform:EditingMode:';
        EditingMode.MenuOptionStatusTip_templ_msgid = horzcat(msgPrfx, 'optionstatustip');
        EditingMode.MenuOptionStatusTip_param_msgidprfx = EditingMode.ValueLabel_msgidprfx;
        % 40 42
        EditingMode.BlockParameterName = 'ParameterEditingModes';
        % 42 44
        ProductsUsed.PropertyName = 'PhysicalModelingProducts';
        ProductsUsed.DataType = 'mxArray';
        ProductsUsed.Visible = false;
        % 46 49
        % 47 49
        ModelTopologyChecksum.PropertyName = 'PhysicalModelingChecksum';
        ModelTopologyChecksum.DataType = 'double';
        ModelTopologyChecksum.Visible = false;
        % 51 53
        ModelParameterChecksum.PropertyName = 'PhysicalModelingParameterChecksum';
        ModelParameterChecksum.DataType = 'double';
        ModelParameterChecksum.Visible = false;
        % 55 57
        ConfigSet.CloneSuffix = 'platform:SSC:SimscapeCC:ConfigSet:CloneNameSuffix';
        % 57 60
        % 58 60
        errPrfx = 'platform:SSC:RunTimeModule:error:';
        % 60 62
        internalErrPrfx = horzcat(errPrfx, 'internal:');
        Error.CannotGetParameterMode_msgid = horzcat(internalErrPrfx, 'CannotGetParameterMode');
        Error.CannotFindLibraryBlock_msgid = horzcat(internalErrPrfx, 'CannotFindLibraryBlock');
        Error.IncorrectCode_msgid = horzcat(internalErrPrfx, 'IncorrectCode');
        Error.UnknownBlockCallback_msgid = horzcat(internalErrPrfx, 'UnknownBlockCallbackx');
        Error.UnknownParamTypeRequest_msgid = horzcat(internalErrPrfx, 'UnknownParameterTypeRequest');
        Error.BlockNotConverted_templ_msgid = horzcat(internalErrPrfx, 'BlockNotConverted');
        Error.CannotSnapshotBlocks_templ_msgid = horzcat(internalErrPrfx, 'CannotSnapshotBlocks');
        Error.CannotGetEditingModeNoSource_msgid = horzcat(internalErrPrfx, 'CannotGetEditingModeSourceObjectEmpty');
        Error.RtmNotInitialized_msgid = horzcat(internalErrPrfx, 'RtmNotInitialized');
        Error.BlockProductUnregistered_templ_msgid = horzcat(internalErrPrfx, 'RestrictedLoadFoundBlockProductNotRegistered');
        Error.UnexpectedCallback_templ_msgid = horzcat(internalErrPrfx, 'UnexpectedCallback');
        % 73 75
        userErrPrfx = horzcat(errPrfx, 'user:');
        Error.NoPlatformProductLicense_msgid = horzcat(userErrPrfx, 'NoPlatformProductLicense');
        Error.CannotRestoreParams_templ_msgid = horzcat(userErrPrfx, 'CannotRestoreParams');
        Error.CannotChangeLockedMode_templ_msgid = horzcat(userErrPrfx, 'CannotChangeLockedModelMode');
        Error.IllegallyChangedDlgParams_templ_msgid = horzcat(userErrPrfx, 'BlockParamsChangedInRestrictedMode');
        Error.CannotAddInUsingMode_msgid = horzcat(userErrPrfx, 'CannotAddBlockInRestrictedMode');
        Error.CannotRemoveInUsingMode_msgid = horzcat(userErrPrfx, 'CannotRemoveBlockInRestrictedMode');
        Error.UnlicensedProducts_templ_msgid = horzcat(userErrPrfx, 'UnlicensedProducts');
        Error.NoLicenseToAddBlock_templ_msgid = horzcat(userErrPrfx, 'NoLicenseToAddBlock');
        Error.NoLicenseToRemoveBlock_templ_msgid = horzcat(userErrPrfx, 'NoLicenseToRemoveBlock');
        % 84 86
        Error.NoLicenseToModifyLibraryBlock_templ_msgid = horzcat(userErrPrfx, 'NoLicenseToModifyLibraryBlock');
        Error.NoLicenseToRemoveLibraryBlock_templ_msgid = horzcat(userErrPrfx, 'NoLicenseToRemoveLibraryBlock');
        Error.NoLicenseToAddLibraryBlock_templ_msgid = horzcat(userErrPrfx, 'NoLicenseToAddLibraryBlock');
        Error.NoLicenseToSaveLibraryBlock_templ_msgid = horzcat(userErrPrfx, 'NoLicenseToSaveLibraryBlock');
        Error.NoLicenseToCompileOrSaveInAuthoringMode = horzcat(userErrPrfx, 'NoLicenseToCompileOrSaveInAuthoringMode');
        Error.NoLicenseToModifyBlock_templ_msgid = horzcat(userErrPrfx, 'NoLicenseToModifyBlock');
        % 91 93
        Error.IllegalUsingModeOperation_templ_msgid = horzcat(userErrPrfx, 'CannotPerformRestrictedModelOperation');
        Error.IllegallyChangedTopology_msgid = horzcat(userErrPrfx, 'IllegallyChangedTopology');
        Error.IllegallyChangedBlockParameters_templ_msgid = horzcat(userErrPrfx, 'IllegallyChangedBlockParameters');
        Error.UnresolvedBlockLink_templ_msgid = horzcat(userErrPrfx, 'UnresolvedBlockLink');
        Error.UnresolvedLibraryLinks_templ_msgid = horzcat(userErrPrfx, 'UnresolvedLibraryLinks');
        % 97 99
        Error.UnappliedDialogChanges_templ_msgid = horzcat(userErrPrfx, 'UnappliedDialogChanges');
        % 99 101
        lblPrfx = 'platform:SSC:RunTimeModule:label:';
        % 101 103
        Label.ErrorDlgTitle_msgid = horzcat(lblPrfx, 'ErrorDlgTitle');
        % 103 107
        % 104 107
        % 105 107
        BlockId.Relevant.Exist = cellhorzcat(EditingMode.BlockParameterName);
        % 107 109
        BlockId.Unmodified.Match(1.0).Param = 'LinkStatus';
        BlockId.Unmodified.Match(1.0).Value = 'resolved';
        BlockId.Unmodified.Match(2.0).Param = 'LinkStatus';
        BlockId.Unmodified.Match(2.0).Value = 'implicit';
        % 112 114
        BlockId.Recurse(1.0) = {'Simulink.SubSystem'};
        % 114 117
        % 115 117
        warningPrfx = 'platform:SSC:RunTimeModule:warning:';
        Warning.ModelLoadedInRestrictedMode_templ_msgid = horzcat(warningPrfx, 'ModelLoadedInRestrictedMode');
        Warning.CouldNotObtainLicenses_msgid = horzcat(warningPrfx, 'CouldNotObtainLicenses');
        Warning.PreferencesRequestRestrictedLoadAlways_msgid = horzcat(warningPrfx, 'PreferencesRequestRestrictedLoadAlways');
        Warning.UnresolvedBlockLinkWhenSaving_templ_msgid = horzcat(warningPrfx, 'UnresolvedBlockLinkWhenSaving');
        % 121 123
        ONESEC = minus(datenum([1.0 1.0 1.0 1.0 1.0 2.0]), datenum([1.0 1.0 1.0 1.0 1.0 1.0]));
        ModelOp.WindowWidth = mtimes(1.0, ONESEC);
        % 124 127
        % 125 127
        ModelOp.Label.presave = horzcat(lblPrfx, 'SaveOperation');
        ModelOp.Label.compile = horzcat(lblPrfx, 'CompileOperation');
        % 128 130
        fConfigData.EditingMode = EditingMode;
        fConfigData.ProductsUsed = ProductsUsed;
        fConfigData.ModelTopologyChecksum = ModelTopologyChecksum;
        fConfigData.Error = Error;
        fConfigData.Label = Label;
        fConfigData.BlockId = BlockId;
        fConfigData.Warning = Warning;
        fConfigData.ConfigSet = ConfigSet;
        fConfigData.ModelOp = ModelOp;
        fConfigData.ModelParameterChecksum = ModelParameterChecksum;
        % 139 141
    end
    % 141 143
    configData = fConfigData;
end
