function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    package = findpackage('dspfixptddg');
    parent = findclass(package, 'DSPDDGBase');
    this = schema.class(package, 'ZeroPad', parent);
    % 11 12
    fixptClass = findpackage('dspfixptddg');
    findclass(fixptClass, 'FixptDialog');
    % 14 16
    % 15 16
    m = schema.method(this, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 21 23
    % 22 23
    if isempty(findtype('DSPZeroPadPadSigAtEnum'))
        schema.EnumType('DSPZeroPadPadSigAtEnum', {'End','Beginning'});
    end % if
    if isempty(findtype('DSPZeroPadZpadAlongEnum'))
        schema.EnumType('DSPZeroPadZpadAlongEnum', {'Columns','Rows','Columns and rows','None'});
        % 28 32
        % 29 32
        % 30 32
        % 31 32
    end % if
    if isempty(findtype('DSPZeroPadNumOutColsRowsSpecMethodEnum'))
        schema.EnumType('DSPZeroPadNumOutColsRowsSpecMethodEnum', {'User-specified','Next power of two'});
        % 35 36
    end % if
    if isempty(findtype('DSPZeroPadTruncOrWrapModeEnum'))
        schema.EnumType('DSPZeroPadTruncOrWrapModeEnum', {'Truncate','Wrap'});
        % 39 40
    end % if
    if isempty(findtype('DSPZeroPadTruncWrapFlagEnum'))
        schema.EnumType('DSPZeroPadTruncWrapFlagEnum', {'None','Warning','Error'});
        % 43 44
    end % if
    % 45 47
    % 46 47
    schema.prop(this, 'padSigAt', 'DSPZeroPadPadSigAtEnum');
    schema.prop(this, 'zpadAlong', 'DSPZeroPadZpadAlongEnum');
    schema.prop(this, 'padNumOutRowsSpecMethod', 'DSPZeroPadNumOutColsRowsSpecMethodEnum');
    schema.prop(this, 'numOutRows', 'string');
    schema.prop(this, 'padNumOutColsSpecMethod', 'DSPZeroPadNumOutColsRowsSpecMethodEnum');
    schema.prop(this, 'numOutCols', 'string');
    schema.prop(this, 'truncOrWrapMode', 'DSPZeroPadTruncOrWrapModeEnum');
    schema.prop(this, 'trunc_flag', 'DSPZeroPadTruncWrapFlagEnum');
    schema.prop(this, 'wrap_flag', 'DSPZeroPadTruncWrapFlagEnum');
end % function
