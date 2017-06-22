function mpt_Parameter_Constructor(h, varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    nargin = length(varargin);
    % 8 11
    % 9 11
    hPackage = findpackage('mpt');
    hClass = findclass(hPackage, 'Parameter');
    hSuperClass = hClass.Superclass;
    if not(isempty(hSuperClass)) && not(isempty(find(hSuperClass.methods, 'Name', 'Simulink_Parameter_Constructor')))
        % 14 16
        h.Simulink_Parameter_Constructor;
    end % if
    % 17 20
    % 18 20
    h.replaceRTWInfo(mpt.CustomRTWInfoParameter);
    % 20 23
    % 21 23
    h.RTWInfo.StorageClass = 'Custom';
    h.RTWInfo.CustomStorageClass = 'Global';
    % 24 27
    % 25 27
    h.Value = 0.0;
    initdata = '';
    % 28 30
    switch nargin
    case 0.0
        hProp = h.DataType;
        if exist('get_user_objecttype_info')
            initdata = get_user_objecttype_info(hProp);
        end % if
    case 1.0
        if isstruct(varargin{1.0})
            initdata = varargin{1.0};
        else
            error('No constructor mpt.Parameter with matching signature found');
        end % if
    otherwise
        error('No constructor mpt.Parameter with matching signature found');
    end % switch
    % 44 46
    if eq(isfield(initdata, 'description'), 1.0)
        h.Description = initdata.description;
    end % if
    if eq(isfield(initdata, 'units'), 1.0)
        h.DocUnits = initdata.units;
    end % if
    if eq(isfield(initdata, 'minValue'), 1.0)
        h.Min = initdata.minValue;
    end % if
    if eq(isfield(initdata, 'maxValue'), 1.0)
        h.Max = initdata.maxValue;
    end % if
    if eq(isfield(initdata, 'alias'), 1.0)
        h.RTWInfo.Alias = initdata.alias;
    end % if
    if eq(isfield(initdata, 'aliasoverrides'), 1.0)
        h.RTWInfo.NamingRuleOverride = initdata.aliasoverrides;
    end % if
    if eq(isfield(initdata, 'definitionfile'), 1.0)
        h.RTWInfo.CustomAttributes.DefinitionFile = initdata.definitionfile;
    end % if
    if eq(isfield(initdata, 'includefile'), 1.0)
        h.RTWInfo.CustomAttributes.HeaderFile = initdata.includefile;
    end % if
    if eq(isfield(initdata, 'initialvalue'), 1.0)
        h.Value = initdata.initialvalue;
    end % if
    if eq(isfield(initdata, 'memsection'), 1.0)
        h.RTWInfo.MemorySection = initdata.memsection;
    end % if
    if eq(isfield(initdata, 'owner'), 1.0)
        h.RTWInfo.CustomAttributes.Owner = initdata.owner;
    end % if
    if eq(isfield(initdata, 'csc'), 1.0)
        h.RTWInfo.CustomStorageClass = initdata.csc;
    end % if
    if eq(isfield(initdata, 'tunelevel'), 1.0)
        h.RTWInfo.CustomAttributes.PersistenceLevel = initdata.tunelevel;
    end % if
    if eq(isfield(initdata, 'level'), 1.0)
        h.RTWInfo.CustomAttributes.PersistenceLevel = initdata.level;
    end % if
    if eq(isfield(initdata, 'exportedmacrofile'), 1.0)
        h.RTWInfo.CustomAttributes.ExportedMacroFile = initdata.exportedmacrofile;
    end % if
    if eq(isfield(initdata, 'exportedmacroname'), 1.0)
        h.RTWInfo.CustomAttributes.ExportedMacroName = initdata.exportedmacroname;
    end % if
