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
    this = schema.class(package, 'VectorScope', parent);
    % 12 14
    % 13 14
    m = schema.method(this, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 19 21
    % 20 21
    if isempty(findtype('DSPVECTORSCOPEDomain'))
        schema.EnumType('DSPVECTORSCOPEDomain', {'Time','Frequency','User-defined'});
    end % if
    if isempty(findtype('DSPVECTORSCOPEXUnits'))
        schema.EnumType('DSPVECTORSCOPEXUnits', {'Hertz','rad/sec'});
    end % if
    if isempty(findtype('DSPVECTORSCOPEXRange'))
        schema.EnumType('DSPVECTORSCOPEXRange', {'[0...Fs/2]','[-Fs/2...Fs/2]','[0...Fs]'});
    end % if
    if isempty(findtype('DSPVECTORSCOPEYUnits'))
        schema.EnumType('DSPVECTORSCOPEYUnits', {'Magnitude','dB'});
    end % if
    if isempty(findtype('DSPVECTORSCOPEXLimit'))
        schema.EnumType('DSPVECTORSCOPEXLimit', {'Auto','User-defined'});
    end % if
    % 36 38
    % 37 38
    schema.prop(this, 'Domain', 'DSPVECTORSCOPEDomain');
    schema.prop(this, 'HorizSpan', 'string');
    % 40 41
    schema.prop(this, 'AxisGrid', 'bool');
    schema.prop(this, 'Memory', 'bool');
    schema.prop(this, 'FrameNumber', 'bool');
    schema.prop(this, 'AxisLegend', 'bool');
    schema.prop(this, 'AxisZoom', 'bool');
    schema.prop(this, 'OpenScopeAtSimStart', 'bool');
    schema.prop(this, 'OpenScopeImmediately', 'bool');
    schema.prop(this, 'FigPos', 'string');
    % 49 50
    schema.prop(this, 'XUnits', 'DSPVECTORSCOPEXUnits');
    schema.prop(this, 'XRange', 'DSPVECTORSCOPEXRange');
    schema.prop(this, 'XLimit', 'DSPVECTORSCOPEXLimit');
    schema.prop(this, 'XMin', 'string');
    schema.prop(this, 'XMax', 'string');
    schema.prop(this, 'XStart', 'string');
    schema.prop(this, 'InheritXIncr', 'bool');
    schema.prop(this, 'XIncr', 'string');
    schema.prop(this, 'XLabel', 'string');
    schema.prop(this, 'YUnits', 'DSPVECTORSCOPEYUnits');
    schema.prop(this, 'YMin', 'string');
    schema.prop(this, 'YMax', 'string');
    schema.prop(this, 'YLabel', 'string');
    % 63 64
    schema.prop(this, 'LineDisables', 'string');
    schema.prop(this, 'LineStyles', 'string');
    schema.prop(this, 'LineMarkers', 'string');
    schema.prop(this, 'LineColors', 'string');
end % function
