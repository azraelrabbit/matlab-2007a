function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    package = findpackage('dspfixptddg');
    parent = findclass(package, 'DSPDDGBase');
    commPackage = findpackage('commdialog');
    this = schema.class(commPackage, 'RaisedCosineFilterRx', parent);
    % 13 15
    % 14 15
    m = schema.method(this, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 20 22
    % 21 22
    if isempty(findtype('RCFilterType'))
        schema.EnumType('RCFilterType', {'Normal','Square root'});
    end % if
    if isempty(findtype('RCFilterSamplingMode'))
        schema.EnumType('RCFilterSamplingMode', {'Frame-based','Sample-based'});
    end % if
    if isempty(findtype('RCFilterRateMode'))
        schema.EnumType('RCFilterRateMode', {'Downsampling','None'});
    end % if
    if isempty(findtype('RCFilterGain'))
        schema.EnumType('RCFilterGain', {'Normalized','User-specified'});
    end % if
    % 34 37
    % 35 37
    % 36 37
    schema.prop(this, 'filtType', 'RCFilterType');
    schema.prop(this, 'N', 'string');
    schema.prop(this, 'D', 'string');
    schema.prop(this, 'R', 'string');
    schema.prop(this, 'sampMode', 'RCFilterSamplingMode');
    schema.prop(this, 'rateMode', 'RCFilterRateMode');
    schema.prop(this, 'downFactor', 'string');
    schema.prop(this, 'downOffset', 'string');
    schema.prop(this, 'checkGain', 'RCFilterGain');
    schema.prop(this, 'filterGain', 'string');
    schema.prop(this, 'checkCoeff', 'bool');
    schema.prop(this, 'variableName', 'string');
end % function
