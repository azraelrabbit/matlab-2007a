function newCell = addCell(this)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    chooseEl = this.getChooseElement;
    if isempty(chooseEl)
        % 10 11
        newCell = [];
    else
        newCell = RptgenML.StylesheetHeaderCell(this, [], chooseEl.getFirstChild);
        % 14 17
        % 15 17
        % 16 17
        r = RptgenML.Root;
        if not(isempty(r.Editor)) && not(isempty(newCell))
            ed = DAStudio.EventDispatcher;
            ed.broadcastEvent('HierarchyChangedEvent', this);
            % 21 22
            r.Editor.view(newCell);
        end % if
    end % if
end % function
