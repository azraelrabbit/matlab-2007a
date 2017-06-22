function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    parentPkg = findpackage('dspdialog');
    parent = findclass(parentPkg, 'DSPDDG');
    rfPackage = findpackage('rfblksdialog');
    this = schema.class(rfPackage, 'InputPort', parent);
    % 12 14
    % 13 14
    m = schema.method(this, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 19 25
    % 20 25
    % 21 25
    % 22 25
    % 23 25
    % 24 25
    schema.prop(this, 'MaxLength', 'string');
    schema.prop(this, 'Fc', 'string');
    schema.prop(this, 'Ts', 'string');
    schema.prop(this, 'Zs', 'string');
    schema.prop(this, 'NoiseFlag', 'bool');
    schema.prop(this, 'seed', 'string');
end % function
