function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('adaptfilt');
    % 9 11
    % 10 11
    c = schema.class(pk, 'tdafdft', findclass(pk, 'nlms'));
    % 12 15
    % 13 15
    % 14 15
    p = schema.prop(c, 'Power', 'double_vector');
    p.Description = 'capture';
    p.SetFunction = @set_pwr;
    % 18 21
    % 19 21
    % 20 21
    p = schema.prop(c, 'AvgFactor', 'double0t1');
end % function
