function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('filtdes');
    % 9 11
    % 10 11
    c = schema.class(pk, 'firceqripfreq', findclass(pk, 'abstractSpec'));
    % 12 14
    % 13 14
    if isempty(findtype('firceqripfreqopts'))
        schema.EnumType('firceqripfreqopts', {'cutoff','passedge','stopedge'});
    end % if
end % function
