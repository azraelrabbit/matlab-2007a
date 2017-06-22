function [retVal, schema] = Render(hThis, schema)
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
    retVal = true;
    % 15 20
    % 16 20
    % 17 20
    % 18 20
    % 19 20
    mainGroup = [];
    % 21 22
    [retVal, mainGroup] = hThis.renderChildren(mainGroup);
    % 23 29
    % 24 29
    % 25 29
    % 26 29
    % 27 29
    % 28 29
    nRows = mainGroup{1.0}.LayoutGrid(1.0);
    nRows = plus(nRows, 1.0);
    mainGroup{1.0}.LayoutGrid(1.0) = nRows;
    mainGroup{1.0}.RowStretch = zeros(1.0, nRows);
    % 33 34
    editBtn = [];
    editBtn.Type = 'pushbutton';
    editBtn.Name = xlate('Edit spline...');
    editBtn.Alignment = 6.0;
    editBtn.ColSpan = horzcat(mainGroup{1.0}.LayoutGrid(2.0), mainGroup{1.0}.LayoutGrid(2.0));
    editBtn.RowSpan = horzcat(nRows, nRows);
    editBtn.Source = hThis;
    editBtn.ObjectMethod = 'OnEditClick';
    editBtn.MethodArgs = {'%source','%dialog','%tag'};
    editBtn.ArgDataTypes = {'handle','handle','string'};
    % 44 45
    mainGroup{1.0}.Items = cellhorzcat(mainGroup{1.0}.Items{:}, editBtn);
    % 46 47
    schema = mainGroup{1.0};
end % function
