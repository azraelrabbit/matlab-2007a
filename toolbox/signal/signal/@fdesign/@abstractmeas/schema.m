function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fdesign');
    c = schema.class(pk, 'abstractmeas');
    set(c, 'Description', 'abstract');
    % 11 12
    p = schema.prop(c, 'NormalizedFrequency', 'bool');
    set(p, 'AccessFlags.PublicSet', 'off', 'FactoryValue', true);
    % 14 15
    p = schema.prop(c, 'Fs', 'mxArray');
    set(p, 'AccessFlags.PublicSet', 'off', 'FactoryValue', 1.0, 'GetFunction', @get_fs);
    % 17 19
    % 18 19
    p = schema.prop(c, 'Specification', 'mxArray');
    set(p, 'AccessFlags.PublicSet', 'off', 'AccessFlags.PublicGet', 'off');
end % function
function fs = get_fs(this, fs)
    % 23 25
    % 24 25
    if this.NormalizedFrequency
        fs = 'normalized';
    end % if
end % function
