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
    this = schema.class(package, 'PeakFinder', parent);
    % 11 13
    % 12 13
    m = schema.method(this, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 18 19
    if isempty(findtype('DSPPeakFinderPolarityEnum'))
        schema.EnumType('DSPPeakFinderPolarityEnum', {'Maxima','Minima','Maxima and Minima'});
        % 21 24
        % 22 24
        % 23 24
    end % if
    % 25 27
    % 26 27
    schema.prop(this, 'overflowMode', 'DSPOverflowModeEnum');
    schema.prop(this, 'polarity', 'DSPPeakFinderPolarityEnum');
    schema.prop(this, 'outputIdx', 'bool');
    schema.prop(this, 'outputVal', 'bool');
    schema.prop(this, 'maxPeaks', 'string');
    schema.prop(this, 'NoiseDistinguish', 'bool');
    schema.prop(this, 'thresh', 'string');
end % function
