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
    this = schema.class(commPackage, 'RQAMDemodulator', parent);
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
    if isempty(findtype('RQAMOutType'))
        schema.EnumType('RQAMOutType', {'Bit','Integer'});
        % 27 28
    end % if
    % 29 30
    if isempty(findtype('RQAMCnstlOrder'))
        schema.EnumType('RQAMCnstlOrder', {'Binary','Gray','User-defined'});
        % 32 34
        % 33 34
    end % if
    % 35 36
    if isempty(findtype('RQAMNormMethod'))
        schema.EnumType('RQAMNormMethod', {'Min. distance between symbols','Average Power','Peak Power'});
        % 38 40
        % 39 40
    end % if
    % 41 42
    if isempty(findtype('RQAMDecType'))
        schema.EnumType('RQAMDecType', {'Hard decision','Log-likelihood ratio','Approximate log-likelihood ratio'});
        % 44 46
        % 45 46
    end % if
    % 47 48
    if isempty(findtype('RQAMVarSource'))
        schema.EnumType('RQAMVarSource', {'Dialog','Port'});
        % 50 51
    end % if
    % 52 55
    % 53 55
    % 54 55
    if isempty(findtype('RQAMBitOutDType'))
        schema.EnumType('RQAMBitOutDType', {'Inherit via internal rule','Smallest unsigned integer','double','single','int8','uint8','int16','uint16','int32','uint32','boolean'});
        % 57 67
        % 58 67
        % 59 67
        % 60 67
        % 61 67
        % 62 67
        % 63 67
        % 64 67
        % 65 67
        % 66 67
    end % if
    % 68 69
    if isempty(findtype('RQAMIntOutDType'))
        schema.EnumType('RQAMIntOutDType', {'Inherit via internal rule','Smallest unsigned integer','double','single','int8','uint8','int16','uint16','int32','uint32'});
        % 71 80
        % 72 80
        % 73 80
        % 74 80
        % 75 80
        % 76 80
        % 77 80
        % 78 80
        % 79 80
    end % if
    % 81 82
    schema.prop(this, 'M', 'string');
    schema.prop(this, 'PowType', 'RQAMNormMethod');
    schema.prop(this, 'MinDist', 'string');
    schema.prop(this, 'AvgPow', 'string');
    schema.prop(this, 'PeakPow', 'string');
    schema.prop(this, 'Ph', 'string');
    schema.prop(this, 'Dec', 'RQAMCnstlOrder');
    schema.prop(this, 'Mapping', 'string');
    schema.prop(this, 'OutType', 'RQAMOutType');
    schema.prop(this, 'DecType', 'RQAMDecType');
    schema.prop(this, 'VarSource', 'RQAMVarSource');
    schema.prop(this, 'Variance', 'string');
    % 94 100
    % 95 100
    % 96 100
    % 97 100
    % 98 100
    % 99 100
    schema.prop(this, 'outDtype1', 'RQAMBitOutDType');
    schema.prop(this, 'outDtype2', 'RQAMIntOutDType');
    % 102 107
    % 103 107
    % 104 107
    % 105 107
    % 106 107
    if isempty(findtype('RQAMDerotateFactorDTMode'))
        schema.EnumType('RQAMDerotateFactorDTMode', {'Same word length as input','Specify word length'});
        % 109 110
    end % if
    % 111 112
    if isempty(findtype('RQAMDnrmFctDTMode'))
        schema.EnumType('RQAMDnrmFctDTMode', {'Same word length as input','Specify word length'});
        % 114 115
    end % if
    % 116 117
    if isempty(findtype('RQAMProdOutDTMode'))
        schema.EnumType('RQAMProdOutDTMode', {'Inherit via internal rule','Specify word length'});
        % 119 120
    end % if
    % 121 122
    if isempty(findtype('RQAMProdOutRoundingMode'))
        schema.EnumType('RQAMProdOutRoundingMode', {'Floor','Nearest'});
        % 124 125
    end % if
    % 126 127
    if isempty(findtype('RQAMProdOutOverflowMode'))
        schema.EnumType('RQAMProdOutOverflowMode', {'Wrap','Saturate'});
        % 129 130
    end % if
    % 131 132
    if isempty(findtype('RQAMSumDTMode'))
        schema.EnumType('RQAMSumDTMode', {'Inherit via internal rule','Same as product output','Specify word length'});
        % 134 136
        % 135 136
    end % if
    % 137 138
    schema.prop(this, 'derotateFactorDTMode', 'RQAMDerotateFactorDTMode');
    schema.prop(this, 'derotateFactorWordLen', 'string');
    schema.prop(this, 'denormFactorDTMode', 'RQAMDnrmFctDTMode');
    schema.prop(this, 'denormFactorWordLen', 'string');
    schema.prop(this, 'prodOutDTMode', 'RQAMProdOutDTMode');
    schema.prop(this, 'prodOutWordLen', 'string');
    schema.prop(this, 'prodOutRoundingMode', 'RQAMProdOutRoundingMode');
    schema.prop(this, 'prodOutOverflowMode', 'RQAMProdOutOverflowMode');
    schema.prop(this, 'sumDTMode', 'RQAMSumDTMode');
    schema.prop(this, 'sumWordLen', 'string');
end % function
