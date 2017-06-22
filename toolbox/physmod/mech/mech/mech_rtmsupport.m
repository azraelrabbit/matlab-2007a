function varargout = mech_rtmsupport(event, handle)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    switch lower(event)
    case 'mask'
        ssc_callback(handle, '');
    case 'loadfcn'
        ssc_callback(handle, 'BLK_POSTLOAD');
    case 'copyfcn'
        ssc_callback(handle, 'BLK_POSTCOPY');
    case 'precopyfcn'
        ssc_callback(handle, 'BLK_PRECOPY');
    case 'predeletefcn'
        ssc_callback(handle, 'BLK_PREDELETE');
    case 'deletefcn'
        ssc_callback(handle, 'BLK_POSTDELETE');
    case 'presavefcn'
        ssc_callback(handle, 'BLK_PRESAVE');
    case 'postsavefcn'
        ssc_callback(handle, 'BLK_POSTSAVE');
    case 'parametereditingmodes'
        % 24 25
        varargout{1.0} = l_get_parameter_editing_modes(get_param(handle, 'Handle'));
    case 'blockcompile'
        ssc_callback(handle, 'BLK_PRECOMPILE');
    case 'modelcompile'
        ssc_callback(handle, 'DOM_INIT');
    otherwise
        error('unrecognized SimMechanics RuntimModule event');
    end % switch
end % function
function editModes = l_get_parameter_editing_modes(handle)
    % 35 39
    % 36 39
    % 37 39
    % 38 39
    referenceBlock = get_param(handle, 'referenceblock');
    envBlockLib = 'mblibv1/Bodies/Machine Environment';
    if strcmp(envBlockLib, pm_sanitize_name(referenceBlock))
        editModes = mech_enveditingmodes(handle);
        return;
    end % if
    % 45 47
    % 46 47
    pmSchema = mech_createpm_dlgschema(handle);
    % 48 50
    % 49 50
    mechDialogClasses = {'MECH.PmMechBodyCSPanel',{'ParamName'},{'CG'};'MECH.PmMechConnPanel',{'NumPortsParam'},{};'MECH.PmMechJointICPanel',{'ParamName'},{};'MECH.PmMechJointPrimSel',{'BlkParamName'},{};'MECH.PmMechJointPrimitivePanel',{'ParamName'},{'CutJoint'};'MECH.PmMechJointSpringPanel',{'ParamName'},{}};
    % 51 60
    % 52 60
    % 53 60
    % 54 60
    % 55 60
    % 56 60
    % 57 60
    % 58 60
    % 59 60
    maskNames = get_param(handle, 'MaskNames');
    % 61 63
    % 62 63
    editModes = pmsl_geteditingmodes(pmSchema, mechDialogClasses, maskNames);
end % function
