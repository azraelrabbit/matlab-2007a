function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    package = findpackage('fdtbxgui');
    parent = findclass(findpackage('siggui'), 'siggui');
    % 9 10
    thisclass = schema.class(package, 'quantizertool', parent);
    % 11 12
    enumeratetypes;
    % 13 14
    p = schema.prop(thisclass, 'checkbox', 'bool');
    p.FactoryValue = true;
    % 16 17
    p = schema.prop(thisclass, 'quantizerclass', 'quantizer|unitquantizer');
    p.FactoryValue = 'quantizer';
    % 19 20
    p = schema.prop(thisclass, 'mode', 'quantizerMode');
    p.FactoryValue = 'fixed';
    % 22 23
    p = schema.prop(thisclass, 'roundmode', 'quantizerRoundMode');
    p.FactoryValue = 'floor';
    % 25 26
    p = schema.prop(thisclass, 'overflowmode', 'quantizerOverflowMode');
    p.FactoryValue = 'saturate';
    % 28 29
    p = schema.prop(thisclass, 'fixedformat', 'MATLAB array');
    p.FactoryValue = [16.0 15.0];
    % 31 32
    p = schema.prop(thisclass, 'floatformat', 'MATLAB array');
    p.FactoryValue = [32.0 8.0];
    % 34 35
    p = schema.prop(thisclass, 'ShowQuantizerClass', 'bool');
    p.FactoryValue = false;
    % 37 38
    p = schema.prop(thisclass, 'Label', 'string');
    p.FactoryValue = '';
    % 40 41
    schema.prop(thisclass, 'LabelWidth', 'MATLAB array');
    % 42 43
    p = schema.prop(thisclass, 'ShowHeadings', 'bool');
    p.FactoryValue = false;
end % function
function enumeratetypes
    % 47 49
    % 48 49
    if isempty(findtype('quantizer|unitquantizer'))
        schema.EnumType('quantizer|unitquantizer', {'quantizer','unitquantizer'});
    end % if
    % 52 53
    if isempty(findtype('quantizerMode'))
        schema.EnumType('quantizerMode', {'fixed','ufixed','float','double','single','none'});
    end % if
    % 56 57
    if isempty(findtype('quantizerRoundMode'))
        schema.EnumType('quantizerRoundMode', {'ceil','convergent','fix','floor','round'});
    end % if
    % 60 61
    if isempty(findtype('quantizerOverflowMode'))
        schema.EnumType('quantizerOverflowMode', {'saturate','wrap'});
    end % if
end % function
