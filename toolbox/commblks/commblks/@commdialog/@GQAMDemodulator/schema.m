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
    this = schema.class(commPackage, 'GQAMDemodulator', parent);
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
    if isempty(findtype('GQAMOutType'))
        schema.EnumType('GQAMOutType', {'Bit','Integer'});
        % 27 28
    end % if
    % 29 30
    if isempty(findtype('GQAMDecType'))
        schema.EnumType('GQAMDecType', {'Hard decision','Log-likelihood ratio','Approximate log-likelihood ratio'});
        % 32 34
        % 33 34
    end % if
    % 35 36
    if isempty(findtype('GQAMVarSource'))
        schema.EnumType('GQAMVarSource', {'Dialog','Port'});
        % 38 39
    end % if
    % 40 41
    if isempty(findtype('GQAMBitOutDType'))
        schema.EnumType('GQAMBitOutDType', {'Inherit via internal rule','Smallest unsigned integer','double','single','int8','uint8','int16','uint16','int32','uint32','boolean'});
        % 43 53
        % 44 53
        % 45 53
        % 46 53
        % 47 53
        % 48 53
        % 49 53
        % 50 53
        % 51 53
        % 52 53
    end % if
    % 54 55
    if isempty(findtype('GQAMIntOutDType'))
        schema.EnumType('GQAMIntOutDType', {'Inherit via internal rule','Smallest unsigned integer','double','single','int8','uint8','int16','uint16','int32','uint32'});
        % 57 66
        % 58 66
        % 59 66
        % 60 66
        % 61 66
        % 62 66
        % 63 66
        % 64 66
        % 65 66
    end % if
    % 67 68
    schema.prop(this, 'SigCon', 'string');
    schema.prop(this, 'OutType', 'GQAMOutType');
    schema.prop(this, 'DecType', 'GQAMDecType');
    schema.prop(this, 'VarSource', 'GQAMVarSource');
    schema.prop(this, 'Variance', 'string');
    schema.prop(this, 'outDtypeBit', 'GQAMBitOutDType');
    schema.prop(this, 'outDtype', 'GQAMIntOutDType');
end % function
