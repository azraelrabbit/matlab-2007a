function mpt_Signal_Constructor(h, varargin)
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
    hClass = findclass(hPackage, 'Signal');
    hSuperClass = hClass.Superclass;
    if not(isempty(hSuperClass)) && not(isempty(find(hSuperClass.methods, 'Name', 'Simulink_Signal_Constructor')))
        % 14 16
        h.Simulink_Signal_Constructor;
    end
    % 17 22
    % 18 22
    % 19 22
    % 20 22
    h.replaceRTWInfo(mpt.CustomRTWInfoSignal(h));
    % 22 27
    % 23 27
    % 24 27
    % 25 27
    h.RTWInfo.hParentObject = h;
    % 27 30
    % 28 30
    h.RTWInfo.StorageClass = 'Custom';
    h.RTWInfo.CustomStorageClass = 'Global';
    % 31 33
    initdata = '';
    % 33 35
    switch nargin
    case 0.0
        hProp = h.DataType;
        if exist('get_user_objecttype_info')
            initdata = get_user_objecttype_info(hProp);
        end
    case 1.0
        if isstruct(varargin{1.0})
            initdata = varargin{1.0};
        else
            error('No constructor mpt.Signal with matching signature found');
        end
    otherwise
        error('No constructor mpt.Signal with matching signature found');
    end
    % 49 51
    if eq(isfield(initdata, 'description'), 1.0)
        h.Description = initdata.description;
    end
    if eq(isfield(initdata, 'units'), 1.0)
        h.DocUnits = initdata.units;
    end
    if eq(isfield(initdata, 'minValue'), 1.0)
        h.Min = initdata.minValue;
    end
    if eq(isfield(initdata, 'maxValue'), 1.0)
        h.Max = initdata.maxValue;
    end
    if eq(isfield(initdata, 'alias'), 1.0)
        h.RTWInfo.Alias = initdata.alias;
    end
    if eq(isfield(initdata, 'aliasoverrides'), 1.0)
        h.RTWInfo.NamingRuleOverride = initdata.aliasoverrides;
    end
    if eq(isfield(initdata, 'datatype'), 1.0)
        h.DataType = initdata.datatype;
    else
        if eq(isfield(initdata, 'realdatatype'), 1.0)
            h.DataType = initdata.realdatatype;
        end
    end
    if eq(isfield(initdata, 'definitionfile'), 1.0)
        h.RTWInfo.CustomAttributes.DefinitionFile = initdata.definitionfile;
    end
    if eq(isfield(initdata, 'includefile'), 1.0)
        h.RTWInfo.CustomAttributes.HeaderFile = initdata.includefile;
    end
    if eq(isfield(initdata, 'initialvalue'), 1.0)
        h.RTWInfo.InitialValue = initdata.initialvalue;
    end
    if eq(isfield(initdata, 'memsection'), 1.0)
        h.RTWInfo.CustomAttributes.MemorySection = initdata.memsection;
    end
    if eq(isfield(initdata, 'owner'), 1.0)
        h.RTWInfo.CustomAttributes.Owner = initdata.owner;
    end
    if eq(isfield(initdata, 'csc'), 1.0)
        h.RTWInfo.CustomStorageClass = initdata.csc;
    end
    if eq(isfield(initdata, 'displaylevel'), 1.0)
        h.RTWInfo.CustomAttributes.PersistenceLevel = initdata.displaylevel;
    end
    if eq(isfield(initdata, 'level'), 1.0)
        h.RTWInfo.CustomAttributes.PersistenceLevel = initdata.level;
    end
    if eq(isfield(initdata, 'exportedmacrofile'), 1.0)
        h.RTWInfo.CustomAttributes.ExportedMacroFile = initdata.exportedmacrofile;
    end
    if eq(isfield(initdata, 'exportedmacroname'), 1.0)
        h.RTWInfo.CustomAttributes.ExportedMacroName = initdata.exportedmacroname;
    end
end
