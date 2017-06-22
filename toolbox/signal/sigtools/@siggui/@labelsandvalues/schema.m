function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    pk = findpackage('siggui');
    % 10 12
    % 11 12
    c = schema.class(pk, 'labelsandvalues', pk.findclass('siggui'));
    % 13 14
    p = schema.prop(c, 'Maximum', 'double');
    set(p, 'AccessFlags.PublicSet', 'Off', 'FactoryValue', 4.0);
    % 16 18
    % 17 18
    p = schema.prop(c, 'Values', 'string vector');
    set(p, 'SetFunction', @setstrings);
    % 20 22
    % 21 22
    p = schema.prop(c, 'Labels', 'string vector');
    set(p, 'SetFunction', @setstrings);
    % 24 25
    p = vertcat(schema.prop(c, 'HiddenLabels', 'posint_vector'), schema.prop(c, 'HiddenValues', 'posint_vector'), schema.prop(c, 'DisabledValues', 'posint_vector'));
    % 26 30
    % 27 30
    % 28 30
    % 29 30
    set(p, 'SetFunction', @setlengths);
    % 31 33
    % 32 33
    e = schema.event(c, 'UserModifiedSpecs');
end % function
function out = setlengths(this, out)
    % 36 39
    % 37 39
    % 38 39
    idx = find(gt(out, this.Maximum));
    out(idx) = [];
end % function
function out = setstrings(this, out)
    % 43 45
    % 44 45
    m = get(this, 'Maximum');
    % 46 47
    if gt(length(out), m)
        error(generatemsgid('TooManyStrings'), 'Internal Error:   Cell must be %d or less.', m)
    end % if
end % function
