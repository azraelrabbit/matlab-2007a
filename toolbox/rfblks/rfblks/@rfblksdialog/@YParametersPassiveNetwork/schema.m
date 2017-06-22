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
    rfPackage = findpackage('rfblksdialog');
    this = schema.class(rfPackage, 'YParametersPassiveNetwork', parent);
    % 13 15
    % 14 15
    m = schema.method(this, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 20 26
    % 21 26
    % 22 26
    % 23 26
    % 24 26
    % 25 26
    if isempty(findtype('InterpMethodType'))
        schema.EnumType('InterpMethodType', {'Linear','Spline','Cubic'});
        % 28 31
        % 29 31
        % 30 31
    end % if
    % 32 33
    schema.prop(this, 'NetParamData', 'string');
    schema.prop(this, 'NetParamFreq', 'string');
    schema.prop(this, 'InterpMethod', 'InterpMethodType');
    % 36 42
    % 37 42
    % 38 42
    % 39 42
    % 40 42
    % 41 42
    if isempty(findtype('YNetworkFreqType'))
        schema.EnumType('YNetworkFreqType', {'Same as the y-parameters frequency','User-specified','Derived from Input Port parameters'});
        % 44 47
        % 45 47
        % 46 47
    end % if
    % 48 49
    if isempty(findtype('SourcePinType'))
        schema.EnumType('SourcePinType', {'Extracted from data source','User-specified'});
        % 51 53
        % 52 53
    end % if
    % 54 55
    if isempty(findtype('AllPlotType'))
        schema.EnumType('AllPlotType', {'Composite data','X-Y plane','Polar plane','Z Smith chart','Y Smith chart','ZY Smith chart'});
        % 57 63
        % 58 63
        % 59 63
        % 60 63
        % 61 63
        % 62 63
    end % if
    % 64 65
    if isempty(findtype('AxesOptionType'))
        schema.EnumType('AxesOptionType', {'Linear','Log'});
        % 67 69
        % 68 69
    end % if
    % 70 71
    schema.prop(this, 'SourceFreq', 'YNetworkFreqType');
    schema.prop(this, 'Freq', 'string');
    schema.prop(this, 'SourcePin', 'SourcePinType');
    schema.prop(this, 'Pin', 'string');
    schema.prop(this, 'AllPlotType', 'AllPlotType');
    schema.prop(this, 'YOption', 'AxesOptionType');
    schema.prop(this, 'XOption', 'AxesOptionType');
    schema.prop(this, 'PlotZ0', 'string');
end % function
