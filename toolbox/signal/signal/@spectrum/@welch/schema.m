function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('spectrum');
    c = schema.class(pk, 'welch', findclass(pk, 'periodogram'));
    % 10 11
    findpackage('sigdatatypes');
    % 12 14
    % 13 14
    p = schema.prop(c, 'SegmentLength', 'spt_uint32');
    p = schema.prop(c, 'OverlapPercent', 'SignalSpectrumPercent');
end % function
