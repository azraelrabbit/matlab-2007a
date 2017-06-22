function varargout = nesl_callback(event, handle)
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    % 13 14
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
        % 32 33
        varargout{1.0} = l_get_parameter_editing_modes(get_param(handle, 'Handle'));
    case 'blockcompile'
        ssc_callback(handle, 'BLK_PRECOMPILE');
    case 'modelcompile'
        ssc_callback(handle, 'DOM_INIT');
    otherwise
        error('Unknown callback');
    end % switch
end % function
function editModes = l_get_parameter_editing_modes(hBlk)
    % 43 47
    % 44 47
    % 45 47
    % 46 47
    libEntry = pmsl_getblocklibraryentry(hBlk);
    if strcmp(libEntry.Name, 'nesl_utility')
        dlgSchema = nesl_utility_createpmschema(hBlk);
    else
        hElemObj = nesl_getlibraryitem(hBlk);
        blkName = hElemObj.name;
        hInfoObj = hElemObj.info;
        schemaFile = fullfile(hInfoObj.Directory, 'extra', horzcat(blkName, '.pmdlg'));
        load('-mat', schemaFile);
    end % if
    % 57 59
    % 58 59
    NeDialogClasses = {'NetworkEngine.PmNeDropDown',{'ValueBlkParam'},{};'NetworkEngine.PmNePSConvertPanel',{'ParamName'},{}};
    % 60 65
    % 61 65
    % 62 65
    % 63 65
    % 64 65
    maskNames = get_param(hBlk, 'MaskNames');
    % 66 68
    % 67 68
    editModes = pmsl_geteditingmodes(dlgSchema, NeDialogClasses, maskNames);
end % function
