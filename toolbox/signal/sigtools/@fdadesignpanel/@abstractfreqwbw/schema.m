function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    pk = findpackage('fdadesignpanel');
    c = schema.class(pk, 'abstractfreqwbw', pk.findclass('abstractfiltertypewfs'));
    c.Description = 'abstract';
    % 10 12
    p = schema.prop(c, 'TransitionMode', 'string');
    set(p, 'Description', 'spec', 'FactoryValue', 'Bandwidth', 'SetFunction', @settmode, 'GetFunction', @gettmode);
    % 13 16
    % 14 16
    p = schema.prop(c, 'Bandwidth', 'string');
    set(p, 'Description', 'spec', 'FactoryValue', '1200');
    % 17 19
    p = schema.prop(c, 'isTrans', 'bool');
    set(p, 'Description', 'spec', 'FactoryValue', true);
end % function
function out = settmode(hObj, out)
    % 22 25
    % 23 25
    if isempty(find(strcmpi(out, cellhorzcat('bandwidth', getnonbwlabel(hObj))), 1.0))
        error(generatemsgid('InvalidPropertyValue'), '''%s'' is not a valid transition mode.', out);
    end % if
end % function
function out = gettmode(hObj, out)
    % 29 32
    % 30 32
    if not(hObj.isTrans)
        out = 'none';
    end % if
end % function
