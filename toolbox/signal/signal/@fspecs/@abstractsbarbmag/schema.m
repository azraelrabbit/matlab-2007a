function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    pk = findpackage('fspecs');
    c = schema.class(pk, 'abstractsbarbmag', pk.findclass('abstractspecwithfs'));
    set(c, 'Description', 'abstract');
    % 10 13
    % 11 13
    B1 = [0.0 .01 .02 .03 .04 .05 .06 .07 .08 .09 .09999999999999999 .10999999999999999 .12 .13 .13999999999999999 .15 .16 .16999999999999998 .18];
    B2 = [.2 .38 .4 .55 .562 .585 .6 .78];
    B3 = [.79 .8 .81 .8200000000000001 .8300000000000001 .8400000000000001 .8500000000000001 .8600000000000001 .87 .88 .89 .9 .91 .92 .9299999999999999 .94 .95 .96 .97 .98 .99 1.0];
    A1 = plus(.5, mrdivide(sin(mtimes(47.12388980384689, B1)), 4.0));
    A2 = [.5 2.3 1.0 1.0 .001 .001 1.0 1.0];
    A3 = plus(.2, mtimes(18.0, power(minus(1.0, B3), 2.0)));
    % 18 20
    F = horzcat(B1, B2, B3);
    A = horzcat(A1, A2, A3);
    % 21 23
    p = schema.prop(c, 'Frequencies', 'double_vector');
    set(p, 'FactoryValue', F, 'SetFunction', @set_frequencies)
    % 24 26
    p = schema.prop(c, 'Amplitudes', 'double_vector');
    set(p, 'FactoryValue', A, 'SetFunction', @set_amplitudes)
end % function
