function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fdadesignpanel');
    spk = findpackage('siggui');
    % 10 12
    % 11 12
    c = schema.class(pk, 'abstractfiltertype', findclass(spk, 'sigcontainer'));
    c.Description = 'abstract';
end % function
