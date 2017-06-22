function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    package = findpackage('rfbbequiv');
    parent = findclass(findpackage('rfckt'), 'rfckt');
    % 8 11
    % 9 11
    h = schema.class(package, 'ampinput', parent);
    % 11 14
    % 12 14
    p = schema.prop(h, 'OriginalCkt', 'handle');
    p.FactoryValue = [];
    p.Description = 'Original circuit object';
    p.SetFunction = cellhorzcat(@setamplifier, p);
end % function
function out = setamplifier(h, out, prop)
    % 19 21
    if isempty(out)
        return;
    end % if
    if not(isa(out, 'rfckt.amplifier'))
        id = sprintf('rfblks:%s:schema:NotAnAmplifier', strrep(class(h), '.', ':'));
        error(id, '%s: %s must be a RFCKT.AMPLIFIER object.', h.Name, prop.name);
    end % if
end % function
