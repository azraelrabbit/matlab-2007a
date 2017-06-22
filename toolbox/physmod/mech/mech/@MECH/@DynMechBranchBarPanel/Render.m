function [retStatus, schema] = Render(hThis, schema)
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    % 13 14
    kidSchema = [];
    [retStatus, kidSchema] = hThis.renderChildren(kidSchema);
    % 16 17
    basePanel.Type = 'panel';
    basePanel.LayoutGrid = [1.0 1.0];
    basePanel.RowSpan = [1.0 1.0];
    basePanel.ColSpan = [1.0 1.0];
    basePanel.Items = kidSchema;
    % 22 23
    schema = basePanel;
    % 24 25
end % function
