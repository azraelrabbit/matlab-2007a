function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('hdlgui');
    c = schema.class(pk, 'abstracthdlgui', findclass(findpackage('siggui'), 'sigcontainer'));
    c.Description = 'abstract';
    % 11 12
    schema.event(c, 'UserModifiedSpecs');
end % function
