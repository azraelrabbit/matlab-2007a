function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('filtresp');
    % 9 11
    % 10 11
    c = schema.class(pk, 'noisemagnitude', pk.findclass('nlm'));
    % 12 14
    % 13 14
    p = schema.prop(c, 'DisplayMask', 'on/off');
    set(p, 'GetFunction', @getdisplaymask);
end % function
function out = getdisplaymask(hObj, out)
    % 18 20
    % 19 20
    if not(enablemask(hObj))
        out = 'off';
    end % if
end % function
