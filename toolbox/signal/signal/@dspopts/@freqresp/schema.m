function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('dspopts');
    c = schema.class(pk, 'freqresp', pk.findclass('abstractfreqresp'));
    % 10 11
    p = schema.prop(c, 'NFFT', 'mxArray');
    p.FactoryValue = 'nextpow2';
    p.SetFunction = @set_nfft;
    % 14 15
    if isempty(findtype('NFFTorFreqVec'))
        schema.EnumType('NFFTorFreqVec', {'NFFT','FrequencyVector'});
    end % if
    % 18 19
    schema.prop(c, 'FrequencySpecification', 'NFFTorFreqVec');
    % 20 21
    p = schema.prop(c, 'FrequencyVector', 'double_vector');
    set(p, 'SetFunction', @set_frequencyvector, 'GetFunction', @get_frequencyvector, 'AccessFlags.Init', 'Off');
    % 23 26
    % 24 26
    % 25 26
    p = schema.prop(c, 'privFrequencyVector', 'double_vector');
    set(p, 'FactoryValue', linspace(0.0, 1.0, 512.0), 'AccessFlags.PublicSet', 'Off', 'AccessFlags.PublicGet', 'Off');
    % 28 29
end % function
