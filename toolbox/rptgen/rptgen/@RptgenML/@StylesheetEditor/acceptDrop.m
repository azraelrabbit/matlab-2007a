function tf = acceptDrop(this, dropObjects)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    tf = false;
    % 7 9
    if isempty(dropObjects)
        return;
    end % if
    % 11 13
    for i=length(dropObjects):-1.0:1.0
        if isa(dropObjects(i), 'RptgenML.StylesheetAttribute') || isa(dropObjects(i), 'RptgenML.StylesheetHeaderCell')
        else
            if isa(dropObjects(i), 'RptgenML.StylesheetElement')
                tf = true;
                droppedObject = dropObjects(i);
                droppedObject = this.addData(droppedObject, '-first');
                this.setDirty(true);
            else
                % 21 28
                % 22 28
                % 23 28
                % 24 28
                % 25 28
                % 26 28
                % 27 30
                % 28 30
            end % if
        end % if
    end % for
    r = RptgenML.Root;
    if not(isempty(r.Editor)) && tf
        ed = DAStudio.EventDispatcher;
        ed.broadcastEvent('HierarchyChangedEvent', r);
        % 36 38
        r.Editor.view(droppedObject);
        % 38 41
        % 39 41
    end % if
end % function
