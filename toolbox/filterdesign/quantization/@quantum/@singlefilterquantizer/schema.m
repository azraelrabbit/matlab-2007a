function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('quantum');
    dfiltpk = findpackage('dfilt');
    c = schema.class(pk, 'singlefilterquantizer', findclass(dfiltpk, 'filterquantizer'));
end % function
