function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('siggui');
    c = schema.class(pk, 'targetselector', pk.findclass('siggui'));
    % 10 11
    p = schema.prop(c, 'BoardNumber', 'string');
    set(p, 'Description', 'DSP Board #', 'FactoryValue', '0');
    % 13 14
    p = schema.prop(c, 'ProcessorNumber', 'string');
    set(p, 'Description', 'DSP Processor #', 'FactoryValue', '0');
end % function
