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
    parentPkg = findpackage('dspdialog');
    parent = findclass(parentPkg, 'DSPDDG');
    commPackage = findpackage('commdialog');
    this = schema.class(commPackage, 'BernoulliBinaryGen', parent);
    % 14 16
    % 15 16
    m = schema.method(this, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 21 23
    % 22 23
    if isempty(findtype('BernoulliOutDType'))
        schema.EnumType('BernoulliOutDType', {'boolean','int8','uint8','int16','uint16','int32','uint32','single','double'});
        % 25 33
        % 26 33
        % 27 33
        % 28 33
        % 29 33
        % 30 33
        % 31 33
        % 32 33
    end % if
    % 34 36
    % 35 36
    schema.prop(this, 'P', 'string');
    schema.prop(this, 'seed', 'string');
    schema.prop(this, 'Ts', 'string');
    schema.prop(this, 'frameBased', 'bool');
    schema.prop(this, 'sampPerFrame', 'string');
    schema.prop(this, 'orient', 'bool');
    schema.prop(this, 'outDataType', 'BernoulliOutDType');
end % function
