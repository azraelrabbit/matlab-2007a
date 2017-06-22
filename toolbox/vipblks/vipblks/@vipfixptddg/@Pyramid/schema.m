function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    dspPackage = findpackage('dspfixptddg');
    vipPackage = findpackage('vipfixptddg');
    parent = findclass(dspPackage, 'DSPDDGBase');
    this = schema.class(vipPackage, 'Pyramid', parent);
    % 12 14
    % 13 14
    m = schema.method(this, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 19 21
    % 20 21
    if isempty(findtype('VIPPyramidOperation'))
        schema.EnumType('VIPPyramidOperation', {'Reduce','Expand'});
    end % if
    % 24 25
    if isempty(findtype('VIPPyramidSource'))
        schema.EnumType('VIPPyramidSource', {'Default separable filter [1/4-a/2  1/4  a  1/4  1/4-a/2]','Specify via dialog'});
    end % if
    % 28 30
    % 29 30
    schema.prop(this, 'operation', 'VIPPyramidOperation');
    schema.prop(this, 'level', 'string');
    schema.prop(this, 'source', 'VIPPyramidSource');
    schema.prop(this, 'a', 'string');
    schema.prop(this, 'coef', 'string');
    schema.prop(this, 'hiddenCoef', 'string');
end % function
