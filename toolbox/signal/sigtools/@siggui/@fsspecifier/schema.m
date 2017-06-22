function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('siggui');
    % 9 11
    % 10 11
    c = schema.class(pk, 'fsspecifier', pk.findclass('siggui'));
    % 12 13
    p = schema.prop(c, 'Units', 'signalFrequencyUnits');
    p = schema.prop(c, 'Value', 'string');
    set(p, 'FactoryValue', 'Fs');
end % function
