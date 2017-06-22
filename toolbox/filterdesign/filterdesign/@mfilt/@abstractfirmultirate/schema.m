function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    package = findpackage('mfilt');
    parent = findclass(package, 'abstractpolyphase');
    thisclass = schema.class(package, 'abstractfirmultirate', parent);
    thisclass.Description = 'abstract';
    % 12 13
    findpackage('sigdatatypes');
    p = schema.prop(thisclass, 'Numerator', 'DFILTNonemptyVector');
    p.FactoryValue = 1.0;
    p.SetFunction = @setnum;
    p.GetFunction = @getnum;
    p.AccessFlags.AbortSet = 'off';
end % function
