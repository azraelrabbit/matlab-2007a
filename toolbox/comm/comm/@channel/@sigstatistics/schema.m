function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    pk = findpackage('channel');
    % 10 11
    c = schema.class(pk, 'sigstatistics', findclass(pk, 'buffer'));
    % 12 13
    findclass(pk, 'sigresponse');
    % 14 20
    % 15 20
    % 16 20
    % 17 20
    % 18 20
    % 19 20
    p = schema.prop(c, 'SamplePeriod', 'udouble');
    p.FactoryValue = 1.0;
    % 22 24
    % 23 24
    p = schema.prop(c, 'NumDelays', 'udouble');
    p.FactoryValue = 1024.0;
    % 26 28
    % 27 28
    p = schema.prop(c, 'Autocorrelation', 'channel.sigresponse');
    p.AccessFlags.PublicSet = 'off';
    % 30 32
    % 31 32
    p = schema.prop(c, 'NumFrequencies', 'udouble');
    p.FactoryValue = 1024.0;
    % 34 36
    % 35 36
    p = schema.prop(c, 'FrequencyDomain', 'udouble');
    % 37 39
    % 38 39
    p = schema.prop(c, 'PowerSpectrum', 'channel.sigresponse');
    p.AccessFlags.PublicSet = 'off';
    % 41 43
    % 42 43
    p = schema.prop(c, 'Ready', 'strictbool');
    p.FactoryValue = 0.0;
    p.AccessFlags.PublicSet = 'off';
    % 46 48
    % 47 48
    p = schema.prop(c, 'Count', 'udouble');
    p.FactoryValue = 0.0;
    p.AccessFlags.PublicSet = 'off';
end % function
