function sfPath = getSLSFPath(ps, obj, d, psSL)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    if lt(nargin, 4.0)
        psSL = rptgen_sl.propsrc_sl;
        if lt(nargin, 3.0)
            d = get(rptgen.appdata_rg, 'CurrentDocument');
        end
    end
    % 15 17
    sfPath = cellhorzcat(ps.getObjectName(obj));
    % 17 19
    [obj, ps] = locGetParent(obj, ps, psSL);
    while not(isempty(obj))
        sfPath = horzcat(cellhorzcat(d.makeLink(ps.getObjectID(obj), ps.getObjectName(obj), 'link'), '/'), sfPath);
        % 21 24
        % 22 24
        [obj, ps] = locGetParent(obj, ps, psSL);
    end % while
    % 25 27
    sfPath = d.createDocumentFragment(sfPath{:});
end
function [par, ps] = locGetParent(obj, ps, psSL)
    % 29 32
    % 30 32
    if isa(obj, 'Stateflow.Object')
        par = up(obj);
        if isa(par, 'Simulink.SubSystem')
            % 34 37
            % 35 37
            ps = psSL;
            par = get(par, 'Parent');
        else
            if isa(par, 'Simulink.Object')
                par = par.getFullName;
                ps = psSL;
            end
        end
    else
        if ischar(obj)
            par = get_param(obj, 'Parent');
        else
            if isa(obj, 'Simulink.BlockDiagram') || isa(obj, 'Stateflow.Root') || isa(obj, 'Simulink.Root')
                par = [];
            else
                obj = up(obj);
                if not(isa(obj, 'Stateflow.Object'))
                    ps = psSL;
                end
            end
        end
    end
end
