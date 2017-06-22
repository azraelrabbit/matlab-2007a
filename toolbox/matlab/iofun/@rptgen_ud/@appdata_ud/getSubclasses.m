function sc = getSubclasses(adUD, cls)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if not(isa(cls, 'schema.class'))
        sc = [];
        return;
    end % if
    ciTable = adUD.ClassInheritanceTable;
    % 13 14
    if not(isempty(ciTable{1.0}))
        tableIdx = find(eq(ciTable{1.0}, cls));
        if isempty(tableIdx)
            sc = [];
        else
            sc = ciTable{2.0}{tableIdx(1.0)};
        end % if
    else
        sc = [];
    end % if
end % function
