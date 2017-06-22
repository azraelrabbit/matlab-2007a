function [retStatus, schema] = Render(hThis, schema)
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
    % 14 15
    retStatus = true;
    % 16 17
    textLabel.Name = hThis.DescrText;
    textLabel.Type = 'text';
    textLabel.WordWrap = true;
    textLabel.RowSpan = [1.0 1.0];
    textLabel.ColSpan = [1.0 1.0];
    % 22 24
    % 23 24
    lablStr = strrep(xlate(hThis.BlockTitle), sprintf('\n'), ' ');
    % 25 26
    lablStr = strrep(lablStr, '  ', ' ');
    % 27 28
    lablStr = strrep(lablStr, ' & ', ' && ');
    grpBox.Name = lablStr;
    grpBox.Type = 'group';
    grpBox.RowSpan = [1.0 1.0];
    grpBox.ColSpan = [1.0 1.0];
    grpBox.LayoutGrid = [1.0 1.0];
    grpBox.ColStretch = 1.0;
    grpBox.Items = cellhorzcat(textLabel);
    % 36 37
    schema = grpBox;
end % function
