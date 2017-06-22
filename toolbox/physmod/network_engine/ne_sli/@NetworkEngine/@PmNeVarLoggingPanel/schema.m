function schema
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    hBasePackage = findpackage('PMDialogs');
    hBaseObj = hBasePackage.findclass('PmGuiObj');
    hCreateInPackage = findpackage('NetworkEngine');
    % 13 15
    % 14 15
    hThisClass = schema.class(hCreateInPackage, 'PmNeVarLoggingPanel', hBaseObj);
    % 16 18
    % 17 18
    schema.prop(hThisClass, 'ParamName', 'string');
    schema.prop(hThisClass, 'StateList', 'mxArray');
    schema.prop(hThisClass, 'VarNames', 'string vector');
    schema.prop(hThisClass, 'VarDescriptions', 'string vector');
    % 22 24
    % 23 24
    m = schema.method(hThisClass, 'Apply');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'bool'};
    % 29 30
    m = schema.method(hThisClass, 'Realize');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'bool'};
    % 35 36
    m = schema.method(hThisClass, 'getPmSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','mxArray'};
    s.OutputTypes = {'bool','mxArray'};
end % function
