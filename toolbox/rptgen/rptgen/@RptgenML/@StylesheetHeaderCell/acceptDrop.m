function tf = acceptDrop(this, dropObjects)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    tf = false;
    % 7 9
    if isLibrary(this) || isempty(dropObjects)
        return
    end
    % 11 13
    droppedObject = [];
    thisParentNode = this.JavaHandle.getParentNode;
    for i=length(dropObjects):-1.0:1.0
        if eq(dropObjects(i), this), else
            % 16 18
            if isa(dropObjects(i), 'RptgenML.StylesheetHeaderCell')
                try
                    droppedObject = RptgenML.createStylesheetElement(this.up, dropObjects(i), this);
                catch
                    % 21 23
                    % 22 24
                    droppedObject = [];
                end % try
                % 25 27
                if not(isempty(droppedObject))
                    tf = true;
                    % 28 32
                    % 29 32
                    % 30 32
                    this.setDirty(true);
                end
            else
                if isa(dropObjects(i), 'RptgenML.StylesheetElement') && not(isempty(this.up))
                    tf = max(tf, acceptDrop(this.up, dropObjects(i)));
                else
                end
            end
        end
    end % for
    r = RptgenML.Root;
    if not(isempty(r.Editor)) && not(isempty(droppedObject))
        ed = DAStudio.EventDispatcher;
        ed.broadcastEvent('HierarchyChangedEvent', r);
        r.Editor.view(droppedObject);
    end
end
