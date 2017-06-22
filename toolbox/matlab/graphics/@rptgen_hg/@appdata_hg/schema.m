function schema
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    pkg = findpackage('rptgen_hg');
    pkgRG = findpackage('rptgen');
    % 8 9
    h = schema.class(pkg, 'appdata_hg', pkgRG.findclass('appdata'));
    % 10 11
    p = newSchema(h, 'CurrentFigure', 'handle');
    p.getFunction = @gvCurrentFigure;
    p = newSchema(h, 'CurrentAxes', 'handle');
    p.getFunction = @gvCurrentAxes;
    p = newSchema(h, 'CurrentObject', 'handle');
    p.getFunction = @gvCurrentObject;
    % 17 22
    % 18 22
    % 19 22
    % 20 22
    % 21 22
    p = newSchema(h, 'PreRunOpenFigures', 'handle vector', handle(0.0));
    p.getFunction = @gvPreRunOpenFigures;
end % function
function p = newSchema(h, name, dataType, factoryValue)
    % 26 28
    % 27 28
    p = schema.prop(h, name, dataType);
    p.AccessFlags.Init = 'on';
    p.AccessFlags.Reset = 'on';
    p.AccessFlags.AbortSet = 'off';
    % 32 33
    if gt(nargin, 3.0)
        p.FactoryValue = factoryValue;
    end % if
end % function
function val = gvCurrentFigure(this, val)
    % 38 40
    % 39 40
    if isempty(val)
        val = get(handle(0.0), 'CurrentFigure');
        if not(isempty(val))
            % 43 46
            % 44 46
            % 45 46
            if any(strcmp(this.getSafeTags, get(val, 'Tag')))
                val = handle([]);
            end % if
        end % if
    end % if
end % function
function val = gvCurrentAxes(this, val)
    % 53 55
    % 54 55
    if isempty(val)
        val = handle(get(this.CurrentFigure, 'CurrentAxes'));
    end % if
end % function
function val = gvCurrentObject(this, val)
    % 60 62
    % 61 62
    if isempty(val)
        val = handle(get(this.CurrentFigure, 'CurrentObject'));
        if isempty(val)
            ax = this.CurrentAxes;
            if not(isempty(ax))
                val = get(ax, 'Children');
                if not(isempty(val))
                    val = val(1.0);
                end % if
            end % if
        end % if
    end % if
end % function
function val = gvPreRunOpenFigures(this, val)
    % 76 78
    % 77 78
    if eq(length(val), 1.0) && eq(val, handle(0.0))
        val = handle(findall(allchild(0.0), 'type', 'figure'));
        this.PreRunOpenFigures = val;
    end % if
end % function
