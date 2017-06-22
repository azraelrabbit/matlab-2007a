function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fspecs');
    c = schema.class(pk, 'parameqflfhapast', pk.findclass('abstractparameqflfhap'));
    % 10 12
    % 11 12
    p = schema.prop(c, 'Gstop', 'double');
    p.FactoryValue = -9.0;
end % function
