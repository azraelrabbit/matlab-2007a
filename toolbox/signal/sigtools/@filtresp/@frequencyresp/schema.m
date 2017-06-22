function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('filtresp');
    % 9 10
    c = schema.class(pk, 'frequencyresp', findclass(findpackage('sigresp'), 'freqaxiswfreqvec'));
    c.Description = 'abstract';
    % 12 14
    % 13 14
    p = schema.prop(c, 'DisplayMask', 'on/off');
    set(p, 'GetFunction', @getdisplaymask);
    % 16 17
    findclass(pk, 'filterutils');
    % 18 19
    p = vertcat(schema.prop(c, 'FilterListener', 'handle.listener'), schema.prop(c, 'FilterUtils', 'filtresp.filterutils'));
    % 20 23
    % 21 23
    % 22 23
    set(p, 'AccessFlags.PublicSet', 'Off', 'AccessFlags.PublicGet', 'Off');
    % 24 26
    % 25 26
    p = schema.prop(c, 'hiddenImagCrumb', 'bool');
    set(p, 'Visible', 'Off', 'FactoryValue', false);
end % function
function out = getdisplaymask(hObj, out)
    % 30 32
    % 31 32
    if not(enablemask(hObj))
        out = 'off';
    end % if
end % function
