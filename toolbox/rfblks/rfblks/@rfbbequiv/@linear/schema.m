function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    package = findpackage('rfbbequiv');
    parent = findclass(package, 'rfbbequiv');
    % 8 11
    % 9 11
    h = schema.class(package, 'linear', parent);
    % 11 14
    % 12 14
    p = schema.prop(h, 'RFckt', 'handle');
    p.FactoryValue = [];
    p.Description = 'Circuit.';
    p.SetFunction = cellhorzcat(@setckt, p);
    % 17 19
    p = schema.prop(h, 'DeleteCkt', 'bool');
    p.FactoryValue = true;
    p.Description = 'Delete Flag';
    p.Visible = 'Off';
    % 22 24
    p = schema.prop(h, 'AllPassFilter', 'bool');
    p.FactoryValue = false;
    p.Description = 'Simulation Flag';
    p.Visible = 'Off';
end % function
function out = setckt(h, out, prop)
    % 29 31
    if isempty(out)
        return;
    end % if
    if not(isa(out, 'rfckt.rfckt'))
        id = sprintf('rfblks:%s:schema:NotACKTObj', strrep(class(h), '.', ':'));
        error(id, '%s: %s must be a an RFCKT object.', h.Name, prop.name);
    end % if
end % function
