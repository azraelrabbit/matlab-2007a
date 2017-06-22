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
    this = schema.class(commPackage, 'QPSKDemodulator', parent);
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
    if isempty(findtype('QPSKOutType'))
        schema.EnumType('QPSKOutType', {'Bit','Integer'});
        % 27 28
    end % if
    % 29 30
    if isempty(findtype('QPSKCnstlOrder'))
        schema.EnumType('QPSKCnstlOrder', {'Binary','Gray'});
        % 32 33
    end % if
    % 34 35
    if isempty(findtype('QPSKDecType'))
        schema.EnumType('QPSKDecType', {'Hard decision','Log-likelihood ratio','Approximate log-likelihood ratio'});
        % 37 39
        % 38 39
    end % if
    % 40 41
    if isempty(findtype('QPSKVarSource'))
        schema.EnumType('QPSKVarSource', {'Dialog','Port'});
        % 43 44
    end % if
    % 45 48
    % 46 48
    % 47 48
    if isempty(findtype('QPSKBitOutDType'))
        schema.EnumType('QPSKBitOutDType', {'Inherit via internal rule','Smallest unsigned integer','double','single','int8','uint8','int16','uint16','int32','uint32','boolean'});
        % 50 61
        % 51 61
        % 52 61
        % 53 61
        % 54 61
        % 55 61
        % 56 61
        % 57 61
        % 58 61
        % 59 61
        % 60 61
    end % if
    % 62 63
    if isempty(findtype('QPSKIntOutDType'))
        schema.EnumType('QPSKIntOutDType', {'Inherit via internal rule','Smallest unsigned integer','double','single','int8','uint8','int16','uint16','int32','uint32'});
        % 65 75
        % 66 75
        % 67 75
        % 68 75
        % 69 75
        % 70 75
        % 71 75
        % 72 75
        % 73 75
        % 74 75
    end % if
    % 76 77
    schema.prop(this, 'Ph', 'string');
    schema.prop(this, 'Dec', 'QPSKCnstlOrder');
    schema.prop(this, 'OutType', 'QPSKOutType');
    schema.prop(this, 'DecType', 'QPSKDecType');
    schema.prop(this, 'VarSource', 'QPSKVarSource');
    schema.prop(this, 'Variance', 'string');
    schema.prop(this, 'outDtype1', 'QPSKBitOutDType');
    schema.prop(this, 'outDtype2', 'QPSKIntOutDType');
end % function
