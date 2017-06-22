function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    package = findpackage('rfckt');
    parent = findclass(package, 'rfckt');
    % 8 11
    % 9 11
    h = schema.class(package, 'network', parent);
    % 11 14
    % 12 14
    p = schema.prop(h, 'Ckts', 'MATLAB array');
    p.FactoryValue = {};
    p.Description = 'Circuit objects';
    p.SetFunction = cellhorzcat(@setckts, p);
end
function out = setckts(h, out, prop)
    if isempty(out)
        return
    end
    if not(isa(out, 'cell'))
        id = sprintf('rf:%s:schema:NotACKTCell', strrep(class(h), '.', ':'));
        if isempty(h.Block)
            error(id, '%s: %s must be a cell array of 2-port RFCKT objects.', h.Name, prop.name);
        else
            error(id, '%s must be a cell array of 2-port RFCKT objects.', prop.Description);
        end
    end
    nckts = length(out);
    for i=1.0:nckts
        ckt = out{i};
        if not(isa(ckt, 'rfckt.rfckt'))
            id = sprintf('rf:%s:schema:NotACKTObj', strrep(class(h), '.', ':'));
            if isempty(h.Block)
                error(id, '%s: %s must be a cell array of 2-port RFCKT objects.', h.Name, prop.name);
            else
                error(id, '%s must be a cell array of 2-port RFCKT objects.', prop.Description);
            end
        else
            if ne(get(ckt, 'nPort'), 2.0)
                id = sprintf('rf:%s:schema:NotATwoPort', strrep(class(h), '.', ':'));
                if isempty(h.Block)
                    error(id, '%s: %s must be a cell array of 2-port RFCKT objects.', h.Name, prop.name);
                else
                    error(id, '%s must be a cell array of 2-port RFCKT objects.', prop.Description);
                end
            end
        end
        if h.CopyPropertyObj
            out{i} = copy(ckt);
        end
    end % for
end
