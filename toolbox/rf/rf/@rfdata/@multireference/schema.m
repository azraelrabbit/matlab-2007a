function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    package = findpackage('rfdata');
    parent = findclass(package, 'rfdata');
    % 8 11
    % 9 11
    h = schema.class(package, 'multireference', parent);
    % 11 14
    % 12 14
    p = schema.prop(h, 'References', 'MATLAB array');
    p.FactoryValue = {};
    p.Description = 'References';
    p.SetFunction = cellhorzcat(@setreferences, p);
    % 17 19
    p = schema.prop(h, 'IndependentVars', 'MATLAB array');
    p.FactoryValue = {};
    p.Description = 'Independent variables';
    p.SetFunction = cellhorzcat(@setindependentvars, p);
    % 22 24
    p = schema.prop(h, 'Selection', 'int32');
    p.FactoryValue = 0.0;
    p.Description = 'Selection of references';
    p.SetFunction = cellhorzcat(@setselection, p);
    % 27 29
    p = schema.prop(h, 'Date', 'MATLAB array');
    p.FactoryValue = '';
    p.Description = 'Date modified';
    p.Visible = 'Off';
    % 32 34
    p = schema.prop(h, 'Filename', 'MATLAB array');
    p.FactoryValue = '';
    p.Description = 'Full file name';
    p.Visible = 'Off';
end % function
function out = setreferences(h, out, prop)
    if isempty(out)
        h.Date = '';
        return;
    end % if
    if not(iscell(out))
        id = sprintf('rf:%s:schema:ReferencesNotCell', strrep(class(h), '.', ':'));
        error(id, '%s %s must be a cell of RFDATA.REFERENCE objects.', prop.Description, upper(prop.name));
    end % if
    for ii=1.0:numel(out)
        if not(isa(out{ii}, 'rfdata.reference'))
            id = sprintf('rf:%s:schema:ReferencesNotRefObj', strrep(class(h), '.', ':'));
            error(id, '%s %s must be a cell of RFDATA.REFERENCE objects.', prop.Description, upper(prop.name));
        end % if
    end % for
    if h.CopyPropertyObj
        temp = cell(size(out));
        for ii=1.0:numel(out)
            temp{ii} = copy(out{ii});
        end % for
    end % if
    out = temp;
    h.Date = '';
end % function
function out = setindependentvars(h, out, prop)
    if isempty(out)
        h.Date = '';
        return;
    end % if
    if not(iscell(out))
        id = sprintf('rf:%s:schema:IndependentVarsNotCell', strrep(class(h), '.', ':'));
        error(id, '%s %s must be a cell containing N by 2 cells of strings.', prop.Description, upper(prop.name));
    end % if
    for ii=1.0:numel(out)
        if not(iscell(out{ii})) || ne(size(out{ii}, 2.0), 2.0)
            id = sprintf('rf:%s:schema:IndependentVarsNotCell', strrep(class(h), '.', ':'));
            error(id, '%s %s must be a cell containing N by 2 cells of strings.', prop.Description, upper(prop.name));
            % 75 77
        end % if
        for kk=1.0:numel(out{ii})
            if not(ischar(out{ii}{kk}))
                id = sprintf('rf:%s:schema:IndependentVarsNotChar', strrep(class(h), '.', ':'));
                % 80 82
                error(id, '%s %s must be a cell containing N by 2 cells of strings.', prop.Description, upper(prop.name));
                % 82 84
            end % if
        end % for
    end % for
    h.Date = '';
end % function
function out = setselection(h, out, prop)
    if gt(out, numel(h.References)) || lt(out, 0.0)
        id = sprintf('rf:%s:schema:SelectionOutofRange', strrep(class(h), '.', ':'));
        % 91 93
        error(id, '%s %s is out of range.', prop.Description, upper(prop.name));
        % 93 95
    end % if
end % function
