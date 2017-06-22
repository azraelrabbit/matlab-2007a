function [retStat, retItems] = getPmSchemaFromChildren(hThis)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    retStat = true;
    % 13 15
    nItems = length(hThis.Items);
    retItems = cell(1.0, nItems);
    % 16 18
    for idx=1.0:nItems
        newSchema = [];
        [retStat, newSchema] = hThis.Items(idx).getPmSchema(newSchema);
        if retStat
            retItems(idx) = cellhorzcat(newSchema);
        else
            retStat = false;
            clsSchema = classhandle(hThis);
            originStr = horzcat(clsSchema.Package.Name, '.', clsSchema.Name, '::getPmSchema');
            error('%s - Failed to add schema object(%d): ''%s''', originStr, idx);
        end % if
    end % for
end % function
