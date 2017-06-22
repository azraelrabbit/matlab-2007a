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
    this = schema.class(package, 'SpectrumScope', parent);
    % 12 14
    % 13 14
    m = schema.method(this, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 19 24
    % 20 24
    % 21 24
    % 22 24
    % 23 24
    if isempty(findtype('DSPSPECTRUMSCOPEXUnits'))
        schema.EnumType('DSPSPECTRUMSCOPEXUnits', {'Hertz','rad/sec'});
    end % if
    if isempty(findtype('DSPSPECTRUMSCOPEXRange'))
        schema.EnumType('DSPSPECTRUMSCOPEXRange', {'[0...Fs/2]','[-Fs/2...Fs/2]','[0...Fs]'});
    end % if
    if isempty(findtype('DSPSPECTRUMSCOPEYUnits'))
        schema.EnumType('DSPSPECTRUMSCOPEYUnits', {'Magnitude-squared','dB'});
    end % if
    if isempty(findtype('DSPSPECTRUMSCOPEWinType'))
        schema.EnumType('DSPSPECTRUMSCOPEWinType', {'Bartlett','Blackman','Boxcar','Chebyshev','Hamming','Hann','Hanning','Kaiser','Triang'});
    end % if
    if isempty(findtype('DSPSPECTRUMSCOPEWinSamp'))
        schema.EnumType('DSPSPECTRUMSCOPEWinSamp', {'Symmetric','Periodic'});
    end % if
    if isempty(findtype('DSPVECTORSCOPEXLimit'))
        schema.EnumType('DSPVECTORSCOPEXLimit', {'Auto','User-defined'});
    end % if
    % 42 44
    % 43 44
    schema.prop(this, 'UseBuffer', 'bool');
    schema.prop(this, 'BufferSize', 'string');
    schema.prop(this, 'Overlap', 'string');
    schema.prop(this, 'wintypeSpecScope', 'DSPSPECTRUMSCOPEWinType');
    schema.prop(this, 'RsSpecScope', 'string');
    schema.prop(this, 'betaSpecScope', 'string');
    schema.prop(this, 'winsampSpecScope', 'DSPSPECTRUMSCOPEWinSamp');
    schema.prop(this, 'inpFftLenInherit', 'bool');
    schema.prop(this, 'FFTlength', 'string');
    schema.prop(this, 'numAvg', 'string');
    % 54 55
    schema.prop(this, 'AxisGrid', 'bool');
    schema.prop(this, 'Memory', 'bool');
    schema.prop(this, 'FrameNumber', 'bool');
    schema.prop(this, 'AxisLegend', 'bool');
    schema.prop(this, 'AxisZoom', 'bool');
    schema.prop(this, 'OpenScopeAtSimStart', 'bool');
    schema.prop(this, 'OpenScopeImmediately', 'bool');
    schema.prop(this, 'FigPos', 'string');
    % 63 64
    schema.prop(this, 'XUnits', 'DSPSPECTRUMSCOPEXUnits');
    schema.prop(this, 'XRange', 'DSPSPECTRUMSCOPEXRange');
    schema.prop(this, 'XLimit', 'DSPVECTORSCOPEXLimit');
    schema.prop(this, 'XMin', 'string');
    schema.prop(this, 'XMax', 'string');
    schema.prop(this, 'InheritXIncr', 'bool');
    schema.prop(this, 'XIncr', 'string');
    schema.prop(this, 'YUnits', 'DSPSPECTRUMSCOPEYUnits');
    schema.prop(this, 'YMin', 'string');
    schema.prop(this, 'YMax', 'string');
    schema.prop(this, 'YLabel', 'string');
    % 75 76
    schema.prop(this, 'LineDisables', 'string');
    schema.prop(this, 'LineStyles', 'string');
    schema.prop(this, 'LineMarkers', 'string');
    schema.prop(this, 'LineColors', 'string');
end % function
