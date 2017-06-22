function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    pk = findpackage('filtstates');
    c = schema.class(pk, 'dfiir');
    % 9 12
    % 10 12
    c.Handle = 'off';
    % 12 15
    % 13 15
    p = schema.prop(c, 'Numerator', 'mxArray');
    p.AccessFlags.PublicGet = 'on';
    p.AccessFlags.PublicSet = 'on';
    % 17 19
    p.FactoryValue = 0.0;
    p.AccessFlags.AbortSet = 'Off';
    % 20 24
    % 21 24
    % 22 24
    p = schema.prop(c, 'Denominator', 'mxArray');
    p.AccessFlags.PublicGet = 'on';
    p.AccessFlags.PublicSet = 'on';
    % 26 28
    p.FactoryValue = 0.0;
    p.AccessFlags.AbortSet = 'Off';
end
function S = chkstates(h, S, str)
    % 31 39
    % 32 39
    % 33 39
    % 34 39
    % 35 39
    % 36 39
    % 37 39
    prod_specif_str = '%s must be double.';
    if license('test', 'Fixed_Point_Toolbox') && license('test', 'Filter_Design_Toolbox')
        prod_specif_str = '%s must be either double, single, or embedded.fi.';
    else
        if license('test', 'Filter_Design_Toolbox')
            prod_specif_str = '%s must be either double or single.';
        end
    end
    if not(any(horzcat(isa(S, 'double'), isa(S, 'single'), isa(S, 'embedded.fi'))))
        error(generatemsgid('invalidDataType'), prod_specif_str, str);
    end
end
