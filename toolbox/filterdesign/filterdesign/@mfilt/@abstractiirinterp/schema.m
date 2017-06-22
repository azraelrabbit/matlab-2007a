function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('mfilt');
    c = schema.class(pk, 'abstractiirinterp', pk.findclass('abstractiirmultirate'));
    % 10 11
    set(c, 'Description', 'abstract');
    % 12 13
    p = schema.prop(c, 'InterpolationFactor', 'posint');
    p.AccessFlags.PublicSet = 'off';
    p.GetFunction = @get_interpolationfactor;
end % function
