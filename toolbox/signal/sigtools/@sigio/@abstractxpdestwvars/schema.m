function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('sigio');
    % 9 10
    c = schema.class(pk, 'abstractxpdestwvars', pk.findclass('abstractxpdestination'));
    c.description = 'abstract';
    % 12 13
    p = schema.prop(c, 'DefaultLabels', 'mxArray');
    set(p, 'SetFunction', @setdefaultlabels, 'GetFunction', @getdefaultlabels, 'AccessFlags.Init', 'Off');
    % 15 17
    % 16 17
    p = schema.prop(c, 'privDefaultLabels', 'mxArray');
    set(p, 'AccessFlags.PublicSet', 'Off', 'AccessFlags.PublicGet', 'Off');
    % 19 20
    p = schema.prop(c, 'VariableLabels', 'mxArray');
    set(p, 'SetFunction', @setvariablelabels, 'GetFunction', @getvariablelabels, 'AccessFlags.AbortSet', 'Off');
    % 22 24
    % 23 24
    p = schema.prop(c, 'VariableNames', 'mxArray');
    set(p, 'SetFunction', @setvariablenames, 'GetFunction', @getvariablenames);
    % 26 27
    p = schema.prop(c, 'ValuesListener', 'handle.listener');
    set(p, 'AccessFlags.PublicGet', 'Off', 'AccessFlags.PublicSet', 'Off');
    % 29 30
    p = schema.prop(c, 'PreviousLabelsAndNames', 'mxArray');
    set(p, 'AccessFlags.PublicGet', 'Off', 'AccessFlags.PublicSet', 'Off');
end % function
