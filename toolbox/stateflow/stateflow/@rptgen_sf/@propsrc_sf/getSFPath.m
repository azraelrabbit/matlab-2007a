function sfPath = getSFPath(ps, obj, d)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    if lt(nargin, 3.0)
        d = get(rptgen.appdata_rg, 'CurrentDocument');
    end % if
    % 10 12
    sfPath = cellhorzcat(ps.getObjectName(obj));
    % 12 14
    obj = locGetParent(obj);
    while not(isempty(obj)) && not(isa(obj, 'Stateflow.Root')) && not(isa(obj, 'Simulink.Root'))
        sfPath = horzcat(cellhorzcat(d.makeLink(ps.getObjectID(obj), ps.getObjectName(obj), 'link'), '/'), sfPath);
        % 16 19
        % 17 19
        obj = locGetParent(obj);
    end % while
    % 20 22
    sfPath = d.createDocumentFragment(sfPath{:});
end % function
function par = locGetParent(obj)
    % 24 28
    % 25 28
    % 26 28
    if isa(obj, 'Stateflow.Machine')
        % 28 30
        par = [];
    else
        par = up(obj);
        % 32 38
        % 33 38
        % 34 38
        % 35 38
        % 36 38
        if isa(par, 'Simulink.BlockDiagram') || isa(par, 'Simulink.SubSystem')
            par = obj.Machine;
        end % if
    end % if
end % function
