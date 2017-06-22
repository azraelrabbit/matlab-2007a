function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('sigresp');
    c = schema.class(pk, 'analysisaxis', pk.findclass('abstractanalysis'));
    c.Description = 'abstract';
    % 11 13
    % 12 13
    schema.prop(c, 'Legend', 'on/off');
    % 14 16
    % 15 16
    p = vertcat(schema.prop(c, 'Grid', 'on/off'), schema.prop(c, 'Title', 'on/off'));
    % 17 20
    % 18 20
    % 19 20
    set(p, 'FactoryValue', 'on');
    % 21 23
    % 22 23
    p = vertcat(schema.prop(c, 'OBDListener', 'handle'), schema.prop(c, 'LegendPosition', 'mxArray'));
    % 24 27
    % 25 27
    % 26 27
    set(p, 'AccessFlags.PublicSet', 'Off', 'AccessFlags.PublicGet', 'Off');
    set(p(2.0), 'FactoryValue', 'Best');
end % function
