function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('sigresp');
    % 9 11
    % 10 11
    c = schema.class(pk, 'twoanalyses', pk.findclass('analysisaxis'));
    % 12 13
    p = schema.prop(c, 'Analyses', 'sigresp.analysisaxis vector');
    set(p, 'SetFunction', @setresps);
    % 15 16
    p = vertcat(schema.prop(c, 'Listeners', 'handle.listener'), schema.prop(c, 'ChildListener', 'handle.listener vector'));
    % 17 20
    % 18 20
    % 19 20
    set(p, 'AccessFlags.PublicGet', 'Off', 'AccessFlags.PublicSet', 'Off');
end % function
