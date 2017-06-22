function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    pk = findpackage('dspfwiztargets');
    % 8 9
    c = schema.class(pk, 'fxptblkstarget', pk.findclass('realizemdltarget'));
    c.Description = 'Fixed-point blocks';
end % function
