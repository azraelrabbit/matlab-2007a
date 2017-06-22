function [retStatus, schema] = renderChildren(hThis, schema)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    retStatus = true;
    schema = [];
    % 16 19
    % 17 19
    nItems = length(hThis.Items);
    childItems = cell(1.0, nItems);
    % 20 22
    for idx=1.0:nItems
        newSchema = [];
        status = false;
        hObj = hThis.Items(idx);
        [status, newSchema] = hObj.Render(newSchema);
        if status
            childItems(idx) = cellhorzcat(newSchema);
        else
            retStatus = false;
            clsSchema = classhandle(hThis);
            idStr = sprintf('%s.renderChildren', class(hThis));
            error(idStr, 'Failed to render schema for item(%d): ''%s''', idx, class(hThis.Items(idx)));
        end % if
    end % for
    schema = childItems;
end % function
