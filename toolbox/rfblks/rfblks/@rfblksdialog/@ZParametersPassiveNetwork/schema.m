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
    rfPackage = findpackage('rfblksdialog');
    this = schema.class(rfPackage, 'ZParametersPassiveNetwork', parent);
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
    if isempty(findtype('InterpMethodType'))
        schema.EnumType('InterpMethodType', {'Linear','Spline','Cubic'});
        % 27 30
        % 28 30
        % 29 30
    end % if
    % 31 32
    schema.prop(this, 'NetParamData', 'string');
    schema.prop(this, 'NetParamFreq', 'string');
    schema.prop(this, 'InterpMethod', 'InterpMethodType');
    % 35 41
    % 36 41
    % 37 41
    % 38 41
    % 39 41
    % 40 41
    if isempty(findtype('ZNetworkFreqType'))
        schema.EnumType('ZNetworkFreqType', {'Same as the z-parameters frequency','User-specified','Derived from Input Port parameters'});
        % 43 46
        % 44 46
        % 45 46
    end % if
    % 47 48
    if isempty(findtype('SourcePinType'))
        schema.EnumType('SourcePinType', {'Extracted from data source','User-specified'});
        % 50 52
        % 51 52
    end % if
    % 53 54
    if isempty(findtype('AllPlotType'))
        schema.EnumType('AllPlotType', {'Composite data','X-Y plane','Polar plane','Z Smith chart','Y Smith chart','ZY Smith chart'});
        % 56 62
        % 57 62
        % 58 62
        % 59 62
        % 60 62
        % 61 62
    end % if
    % 63 64
    if isempty(findtype('AxesOptionType'))
        schema.EnumType('AxesOptionType', {'Linear','Log'});
        % 66 68
        % 67 68
    end % if
    % 69 70
    schema.prop(this, 'SourceFreq', 'ZNetworkFreqType');
    schema.prop(this, 'Freq', 'string');
    schema.prop(this, 'SourcePin', 'SourcePinType');
    schema.prop(this, 'Pin', 'string');
    schema.prop(this, 'AllPlotType', 'AllPlotType');
    schema.prop(this, 'YOption', 'AxesOptionType');
    schema.prop(this, 'XOption', 'AxesOptionType');
    schema.prop(this, 'PlotZ0', 'string');
end % function
