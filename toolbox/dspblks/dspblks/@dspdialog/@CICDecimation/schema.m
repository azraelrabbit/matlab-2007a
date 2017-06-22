function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    package = findpackage('dspdialog');
    parent = findclass(package, 'DSPDDG');
    % 11 12
    this = schema.class(package, 'CICDecimation', parent);
    % 13 15
    % 14 15
    m = schema.method(this, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 20 22
    % 21 22
    if isempty(findtype('DSPCICDecimationFilterStructure'))
        schema.EnumType('DSPCICDecimationFilterStructure', {'Decimator','Zero-latency decimator'});
        % 24 26
        % 25 26
    end % if
    % 27 28
    if isempty(findtype('DSPCICDecimationFilterInternals'))
        schema.EnumType('DSPCICDecimationFilterInternals', {'Full precision','Minimum section word lengths','Specify word lengths','Binary point scaling'});
        % 30 34
        % 31 34
        % 32 34
        % 33 34
    end % if
    % 35 37
    % 36 37
    schema.prop(this, 'FilterSource', 'int');
    schema.prop(this, 'mfiltObjectName', 'string');
    schema.prop(this, 'FilterStructure', 'DSPCICDecimationFilterStructure');
    schema.prop(this, 'DecimationFactor', 'string');
    schema.prop(this, 'DifferentialDelay', 'string');
    schema.prop(this, 'NumberOfSections', 'string');
    schema.prop(this, 'FilterInternals', 'DSPCICDecimationFilterInternals');
    schema.prop(this, 'SectionWordLengths', 'string');
    schema.prop(this, 'SectionFracLengths', 'string');
    schema.prop(this, 'OutputWordLength', 'string');
    schema.prop(this, 'OutputFracLength', 'string');
end % function
