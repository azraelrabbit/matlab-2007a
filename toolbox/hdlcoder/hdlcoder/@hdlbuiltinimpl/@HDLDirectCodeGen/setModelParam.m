function setModelParam(this, srcModelName, targetModelName, exceptions)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    maskProperty = ' MaskTypeMaskDescription MaskHelp MaskPromptString MaskStyleString MaskTunableValueString MaskEnableString MaskVisibilityString MaskToolTipString MaskVarAliasString MaskVariables MaskInitialization MaskDisplay MaskCallbackString MaskSelfModifiable MaskIconFrame MaskIconOpaque MaskIconRotate MaskIconUnits MaskValueString MaskRunInitForIconRedraw Mask MaskEditorHandle MaskCallbacks MaskEnables MaskNames MaskPropertyNameString MaskPrompts MaskStyles MaskTunableValues MaskValues MaskToolTipsDisplay MaskVisibilities MaskVarAliases MaskWSVariables MaskTabNameString MaskTabNames';
    % 8 16
    % 9 16
    % 10 16
    % 11 16
    % 12 16
    % 13 16
    % 14 16
    exceptions = horzcat(maskProperty, exceptions, ' Name', ' CurrentBlock', ' HDLConfigFile', ' LinkStatus', ' Parameters');
    object = get_param(srcModelName, 'ObjectParameters');
    field = fieldnames(object);
    for i=1.0:numel(field)
        prop = field{i};
        attr = cell2mat(object.(prop).Attributes);
        if isempty(strfind(exceptions, prop)) && isempty(strfind(attr, 'write-only')) && isempty(strfind(attr, 'read-only'))
            val = get_param(srcModelName, prop);
            set_param(targetModelName, prop, val);
        end
    end % for
end
