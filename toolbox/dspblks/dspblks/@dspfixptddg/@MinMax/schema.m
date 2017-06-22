function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    package = findpackage('dspfixptddg');
    parent = findclass(package, 'DSPDDGBase');
    this = schema.class(package, 'MinMax', parent);
    % 12 13
    fixptClass = findpackage('dspfixptddg');
    findclass(fixptClass, 'FixptDialog');
    % 15 17
    % 16 17
    m = schema.method(this, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 22 24
    % 23 24
    if isempty(findtype('DSPMinMaxModeEnum'))
        schema.EnumType('DSPMinMaxModeEnum', {'Value and Index','Value','Index','Running'});
        % 26 30
        % 27 30
        % 28 30
        % 29 30
    end % if
    % 31 32
    if isempty(findtype('DSPMinMaxOverEnum'))
        schema.EnumType('DSPMinMaxOverEnum', {'Entire input','Each row','Each column'});
        % 34 37
        % 35 37
        % 36 37
    end % if
    % 38 39
    if isempty(findtype('DSPMinMaxIndexEnum'))
        schema.EnumType('DSPMinMaxIndexEnum', {'Zero','One'});
        % 41 43
        % 42 43
    end % if
    % 44 47
    % 45 47
    % 46 47
    schema.prop(this, 'fcn', 'DSPMinMaxModeEnum');
    schema.prop(this, 'reset', 'DSPResetPortEnum');
    schema.prop(this, 'operateOver', 'DSPMinMaxOverEnum');
    schema.prop(this, 'indexBase', 'DSPMinMaxIndexEnum');
    schema.prop(this, 'colComp', 'bool');
    schema.prop(this, 'MaskType', 'string');
end % function
