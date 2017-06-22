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
    pk = findpackage('modem');
    % 11 13
    % 12 13
    c = schema.class(pk, 'abstractMod', findclass(pk, 'baseclass'));
    c.Description = 'abstract';
    % 15 18
    % 16 18
    % 17 18
    if isempty(findtype('InpType'))
        schema.EnumType('InpType', {'Bit','Integer'});
        % 20 21
    end % if
    % 22 42
    % 23 42
    % 24 42
    % 25 42
    % 26 42
    % 27 42
    % 28 42
    % 29 42
    % 30 42
    % 31 42
    % 32 42
    % 33 42
    % 34 42
    % 35 42
    % 36 42
    % 37 42
    % 38 42
    % 39 42
    % 40 42
    % 41 42
    p = schema.prop(c, 'PrivInputType', 'InpType');
    p.FactoryValue = 'Integer';
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.PublicGet = 'off';
    % 46 50
    % 47 50
    % 48 50
    % 49 50
    p = schema.prop(c, 'InputType', 'InpType');
    p.FactoryValue = 'Integer';
    p.SetFunction = @setInputType;
    p.GetFunction = @getInputType;
end % function
function inputType = setInputType(h, inputType)
    % 56 61
    % 57 61
    % 58 61
    % 59 61
    % 60 61
    setPrivProp(h, 'PrivInputType', inputType);
    % 62 64
    % 63 64
    setProcessFunction(h, h.M);
end % function
function inputType = getInputType(h, inputType)
    % 67 69
    % 68 69
    inputType = getPrivProp(h, 'PrivInputType');
end % function
