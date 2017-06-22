function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    pk = findpackage('siggui');
    % 8 11
    % 9 11
    c = schema.class(pk, 'dfiltwfsdlg', pk.findclass('helpdialog'));
    % 11 13
    findclass(findpackage('dfilt'), 'dfiltwfs');
    % 13 15
    schema.prop(c, 'Filters', 'dfilt.dfiltwfs vector');
    % 15 19
    % 16 19
    % 17 19
    p = schema.prop(c, 'Index', 'double');
    p.SetFunction = @setindx;
    % 20 24
    % 21 24
    % 22 24
    p = vertcat(schema.prop(c, 'BackupNames', 'string vector'), schema.prop(c, 'BackupFs', 'MATLAB array'), schema.prop(c, 'FilterListener', 'handle.listener'));
    % 24 30
    % 25 30
    % 26 30
    % 27 30
    % 28 30
    set(p, 'AccessFlags.PublicSet', 'Off', 'AccessFlags.PublicGet', 'Off');
end
function indx = setindx(hObj, indx)
    % 32 35
    % 33 35
    if gt(indx, length(get(hObj, 'Filters')))
        indx = length(get(hObj, 'Filters'));
    else
        if lt(indx, 0.0)
            indx = 0.0;
        end
    end
end
