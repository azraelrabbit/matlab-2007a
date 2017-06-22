function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    pk = findpackage('dspfwiztargets');
    % 8 10
    % 9 10
    c = schema.class(pk, 'dspblkstarget', pk.findclass('realizemdltarget'));
    c.Description = 'Floating-point blocks';
end % function
