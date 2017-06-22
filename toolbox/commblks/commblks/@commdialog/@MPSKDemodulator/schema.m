function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    parentPkg = findpackage('dspdialog');
    parent = findclass(parentPkg, 'DSPDDG');
    commPackage = findpackage('commdialog');
    this = schema.class(commPackage, 'MPSKDemodulator', parent);
    % 13 15
    % 14 15
    m = schema.method(this, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 20 25
    % 21 25
    % 22 25
    % 23 25
    % 24 25
    if isempty(findtype('MPSKOutType'))
        schema.EnumType('MPSKOutType', {'Bit','Integer'});
        % 27 28
    end % if
    % 29 30
    if isempty(findtype('MPSKCnstlOrder'))
        schema.EnumType('MPSKCnstlOrder', {'Binary','Gray','User-defined'});
        % 32 34
        % 33 34
    end % if
    % 35 36
    if isempty(findtype('MPSKDecType'))
        schema.EnumType('MPSKDecType', {'Hard decision','Log-likelihood ratio','Approximate log-likelihood ratio'});
        % 38 40
        % 39 40
    end % if
    % 41 42
    if isempty(findtype('MPSKVarSource'))
        schema.EnumType('MPSKVarSource', {'Dialog','Port'});
        % 44 45
    end % if
    % 46 49
    % 47 49
    % 48 49
    if isempty(findtype('MPSKBitOutDType'))
        schema.EnumType('MPSKBitOutDType', {'Inherit via internal rule','Smallest unsigned integer','double','single','int8','uint8','int16','uint16','int32','uint32','boolean'});
        % 51 62
        % 52 62
        % 53 62
        % 54 62
        % 55 62
        % 56 62
        % 57 62
        % 58 62
        % 59 62
        % 60 62
        % 61 62
    end % if
    % 63 64
    if isempty(findtype('MPSKIntOutDType'))
        schema.EnumType('MPSKIntOutDType', {'Inherit via internal rule','Smallest unsigned integer','double','single','int8','uint8','int16','uint16','int32','uint32'});
        % 66 76
        % 67 76
        % 68 76
        % 69 76
        % 70 76
        % 71 76
        % 72 76
        % 73 76
        % 74 76
        % 75 76
    end % if
    % 77 78
    schema.prop(this, 'M', 'string');
    schema.prop(this, 'Ph', 'string');
    schema.prop(this, 'Dec', 'MPSKCnstlOrder');
    schema.prop(this, 'Mapping', 'string');
    schema.prop(this, 'OutType', 'MPSKOutType');
    schema.prop(this, 'DecType', 'MPSKDecType');
    schema.prop(this, 'VarSource', 'MPSKVarSource');
    schema.prop(this, 'Variance', 'string');
    schema.prop(this, 'outDtype1', 'MPSKBitOutDType');
    schema.prop(this, 'outDtype2', 'MPSKIntOutDType');
end % function
