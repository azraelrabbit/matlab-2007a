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
            if isa(dropObjects(i), 'RptgenML.StylesheetHeaderCell'), else
                % 18 20
                if isa(dropObjects(i), 'RptgenML.StylesheetAttribute')
                    try
                        droppedObject = RptgenML.createStylesheetElement(this.up, dropObjects(i), this);
                    catch
                        % 23 25
                        % 24 26
                        droppedObject = [];
                    end % try
                    % 27 29
                    if not(isempty(droppedObject))
                        tf = true;
                        % 30 34
                        % 31 34
                        % 32 34
                        this.setDirty(true);
                    end
                else
                    if isa(dropObjects(i), 'RptgenML.StylesheetElement') && not(isempty(this.up))
                        tf = max(tf, acceptDrop(this.up, dropObjects(i)));
                    else
                    end
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
