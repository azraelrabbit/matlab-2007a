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
    this = schema.class(commPackage, 'ViterbiDecoder', parent);
    % 13 15
    % 14 15
    m = schema.method(this, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 20 23
    % 21 23
    % 22 23
    if isempty(findtype('ViterbiDecisionType'))
        schema.EnumType('ViterbiDecisionType', {'Unquantized','Hard decision','Soft decision'});
        % 25 27
        % 26 27
    end % if
    % 28 29
    if isempty(findtype('ViterbiOpMode'))
        schema.EnumType('ViterbiOpMode', {'Continuous','Truncated','Terminated'});
        % 31 33
        % 32 33
    end % if
    % 34 35
    if isempty(findtype('ViterbiOutDType'))
        schema.EnumType('ViterbiOutDType', {'Inherit via internal rule','Smallest unsigned integer','double','single','int8','uint8','int16','uint16','int32','uint32','boolean'});
        % 37 47
        % 38 47
        % 39 47
        % 40 47
        % 41 47
        % 42 47
        % 43 47
        % 44 47
        % 45 47
        % 46 47
    end % if
    % 48 51
    % 49 51
    % 50 51
    schema.prop(this, 'trellis', 'string');
    schema.prop(this, 'isPunctured', 'bool');
    schema.prop(this, 'punctureVector', 'string');
    schema.prop(this, 'erasures', 'bool');
    schema.prop(this, 'dectype', 'ViterbiDecisionType');
    schema.prop(this, 'nsdecb', 'string');
    schema.prop(this, 'runSigValErrCheck', 'bool');
    schema.prop(this, 'tbdepth', 'string');
    schema.prop(this, 'opmode', 'ViterbiOpMode');
    schema.prop(this, 'reset', 'bool');
    % 61 67
    % 62 67
    % 63 67
    % 64 67
    % 65 67
    % 66 67
    schema.prop(this, 'smWordLength', 'string');
    % 68 69
    schema.prop(this, 'outDataType', 'ViterbiOutDType');
end % function
