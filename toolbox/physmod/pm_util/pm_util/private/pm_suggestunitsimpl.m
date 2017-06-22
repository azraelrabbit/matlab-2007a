function list = pm_suggestunitsimpl(u)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    persistent TABLE;
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    if isempty(TABLE)
        TABLE = lBuildUnitTable;
    end
    % 17 22
    % 18 22
    % 19 22
    % 20 22
    idx = pm_commensurate(cellhorzcat(TABLE.Base), u);
    % 22 27
    % 23 27
    % 24 27
    % 25 27
    list = {};
    if any(idx)
        list = TABLE(idx).Group;
    end
    % 30 35
    % 31 35
    % 32 35
    % 33 35
    if not(any(pm_equivalentunit(list, u)))
        list = horzcat(cellhorzcat(u), list{:});
    end
end
function table = lBuildUnitTable
    % 39 42
    % 40 42
    table = struct('Base', {}, 'Group', {});
    % 42 45
    % 43 45
    units = pm_unitexpressions;
    m = pm_commensurate(units, units);
    rows = unique(m, 'rows');
    nGroups = length(rows(:, 1.0));
    % 48 50
    for i=1.0:nGroups
        group = units(rows(i, :));
        table(plus(end, 1.0)) = struct('Base', group(1.0), 'Group', cellhorzcat(group));
        % 52 54
    end % for
    % 54 56
end
