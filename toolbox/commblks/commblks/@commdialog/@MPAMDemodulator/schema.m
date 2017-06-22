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
    commPackage = findpackage('commdialog');
    this = schema.class(commPackage, 'MPAMDemodulator', parent);
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
    if isempty(findtype('MPAMOutType'))
        schema.EnumType('MPAMOutType', {'Bit','Integer'});
        % 27 28
    end % if
    % 29 30
    if isempty(findtype('MPAMCnstlOrder'))
        schema.EnumType('MPAMCnstlOrder', {'Binary','Gray'});
        % 32 33
    end % if
    % 34 35
    if isempty(findtype('MPAMNormMethod'))
        schema.EnumType('MPAMNormMethod', {'Min. distance between symbols','Average Power','Peak Power'});
        % 37 39
        % 38 39
    end % if
    % 40 41
    if isempty(findtype('MPAMBitOutDType'))
        schema.EnumType('MPAMBitOutDType', {'Inherit via internal rule','Smallest unsigned integer','double','single','int8','uint8','int16','uint16','int32','uint32','boolean'});
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
    if isempty(findtype('MPAMIntOutDType'))
        schema.EnumType('MPAMIntOutDType', {'Inherit via internal rule','Smallest unsigned integer','double','single','int8','uint8','int16','uint16','int32','uint32'});
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
    schema.prop(this, 'M', 'string');
    schema.prop(this, 'OutType', 'MPAMOutType');
    schema.prop(this, 'Dec', 'MPAMCnstlOrder');
    schema.prop(this, 'PowType', 'MPAMNormMethod');
    schema.prop(this, 'MinDist', 'string');
    schema.prop(this, 'AvgPow', 'string');
    schema.prop(this, 'PeakPow', 'string');
    schema.prop(this, 'outDtype1', 'MPAMBitOutDType');
    schema.prop(this, 'outDtype2', 'MPAMIntOutDType');
    % 77 83
    % 78 83
    % 79 83
    % 80 83
    % 81 83
    % 82 83
    if isempty(findtype('MPAMDnrmFctDTMode'))
        schema.EnumType('MPAMDnrmFctDTMode', {'Same word length as input','Specify word length'});
        % 85 86
    end % if
    % 87 88
    if isempty(findtype('MPAMProdOutDTMode'))
        schema.EnumType('MPAMProdOutDTMode', {'Inherit via internal rule','Specify word length'});
        % 90 91
    end % if
    % 92 93
    if isempty(findtype('MPAMProdOutRoundingMode'))
        schema.EnumType('MPAMProdOutRoundingMode', {'Floor','Nearest'});
        % 95 96
    end % if
    % 97 98
    if isempty(findtype('MPAMProdOutOverflowMode'))
        schema.EnumType('MPAMProdOutOverflowMode', {'Wrap','Saturate'});
        % 100 101
    end % if
    % 102 103
    if isempty(findtype('MPAMSumDTMode'))
        schema.EnumType('MPAMSumDTMode', {'Inherit via internal rule','Same as product output','Specify word length'});
        % 105 107
        % 106 107
    end % if
    % 108 109
    schema.prop(this, 'denormFactorDTMode', 'MPAMDnrmFctDTMode');
    schema.prop(this, 'denormFactorWordLen', 'string');
    schema.prop(this, 'prodOutDTMode', 'MPAMProdOutDTMode');
    schema.prop(this, 'prodOutWordLen', 'string');
    schema.prop(this, 'prodOutRoundingMode', 'MPAMProdOutRoundingMode');
    schema.prop(this, 'prodOutOverflowMode', 'MPAMProdOutOverflowMode');
    schema.prop(this, 'sumDTMode', 'MPAMSumDTMode');
    schema.prop(this, 'sumWordLen', 'string');
end % function
