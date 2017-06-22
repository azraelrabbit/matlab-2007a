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
    this = schema.class(package, 'MatrixScaling', parent);
    % 11 13
    % 12 13
    m = schema.method(this, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 18 20
    % 19 20
    if isempty(findtype('DSPMatrixScalingMode'))
        schema.EnumType('DSPMatrixScalingMode', {'Scale Rows (D*A)','Scale Columns (A*D)'});
        % 22 23
    end % if
    if isempty(findtype('DSPMatrixScalingSource'))
        schema.EnumType('DSPMatrixScalingSource', {'Input port','Dialog parameter'});
        % 26 27
    end % if
    % 28 30
    % 29 30
    schema.prop(this, 'mode', 'DSPMatrixScalingMode');
    schema.prop(this, 'D_Source', 'DSPMatrixScalingSource');
    schema.prop(this, 'D_VectFromMask', 'string');
end % function
