function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('dfilt');
    c = schema.class(pk, 'basefilter');
    c.Description = 'abstract';
    % 11 12
    p = schema.prop(c, 'ResetBeforeFiltering', 'on/off');
    p.FactoryValue = 'on';
    p.GetFunction = @getresetbeforefiltering;
    p.SetFunction = @setresetbeforefiltering;
    p.Visible = 'off';
    % 17 18
    p = schema.prop(c, 'PersistentMemory', 'bool');
    p.FactoryValue = false;
    p.SetFunction = @set_persistentmemory;
    p.AccessFlags.AbortSet = 'off';
    % 22 24
    % 23 24
    p = schema.prop(c, 'NumSamplesProcessed', 'mxArray');
    p.Description = 'capture';
    p.AccessFlags.PublicGet = 'on';
    p.AccessFlags.PublicSet = 'off';
    p.FactoryValue = 0.0;
    % 29 30
    dpk = findpackage('sigdatatypes');
    findclass(dpk, 'posint')
    p = schema.prop(c, 'privRateChangeFactor', 'posint_vector');
    p.FactoryValue = [1.0 1.0];
    p.AccessFlags.PublicGet = 'Off';
    p.AccessFlags.PublicSet = 'Off';
    p.SetFunction = @setrate;
    p.GetFunction = @get_ratechangefactors;
    % 38 39
    p = schema.prop(c, 'version', 'mxArray');
    p.AccessFlags.PublicGet = 'Off';
    p.AccessFlags.PublicSet = 'Off';
    p.AccessFlags.Init = 'Off';
    p.GetFunction = @get_version;
    % 44 46
    % 45 46
    p = schema.prop(c, 'privfdesign', 'mxArray');
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
    p.GetFunction = @get_privfdesign;
    % 50 51
    p = schema.prop(c, 'privfmethod', 'mxArray');
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
    p.GetFunction = @get_privfdesign;
    % 55 56
    p = schema.prop(c, 'privdesignmethod', 'mxArray');
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
    % 59 60
    p = schema.prop(c, 'privMeasurements', 'mxArray');
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
    % 63 65
    % 64 65
    schema.event(c, 'clearmetadata');
    % 66 68
    % 67 68
    p = schema.prop(c, 'clearmetadatalistener', 'handle.listener');
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
end % function
function R = setrate(Hm, R)
    % 73 76
    % 74 76
    % 75 76
    if ne(length(R), 2.0)
        error('Internal error: the privRateChangeFactor property must be a two-element vector.');
    end % if
end % function
