function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    pkg = findpackage('rptgen_fp');
    pkgRG = findpackage('rptgen');
    % 9 10
    h = schema.class(pkg, 'appdata_fp', pkgRG.findclass('appdata'));
end % function
function p = newSchema(h, name, dataType, factoryValue)
    % 13 16
    % 14 16
    % 15 16
    p = schema.prop(h, name, dataType);
    p.AccessFlags.Init = 'on';
    p.AccessFlags.Reset = 'on';
    % 19 20
    if gt(nargin, 3.0)
        p.FactoryValue = factoryValue;
    end % if
end % function
