function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    package = findpackage('dspdialog');
    parent = findclass(package, 'DSPDDG');
    % 10 11
    this = schema.class(package, 'MatrixViewer', parent);
    % 12 14
    % 13 14
    m = schema.method(this, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 19 21
    % 20 21
    if isempty(findtype('DSPMATRIXVIEWERAxisOrigin'))
        schema.EnumType('DSPMATRIXVIEWERAxisOrigin', {'Upper left corner','Lower left corner'});
    end % if
    % 24 27
    % 25 27
    % 26 27
    schema.prop(this, 'CMapStr', 'string');
    schema.prop(this, 'YMin', 'string');
    schema.prop(this, 'YMax', 'string');
    schema.prop(this, 'AxisColorbar', 'bool');
    % 31 32
    schema.prop(this, 'AxisOrigin', 'DSPMATRIXVIEWERAxisOrigin');
    schema.prop(this, 'XLabel', 'string');
    schema.prop(this, 'YLabel', 'string');
    schema.prop(this, 'ZLabel', 'string');
    schema.prop(this, 'FigPos', 'string');
    schema.prop(this, 'AxisZoom', 'bool');
end % function
