function tf = acceptDrop(this, dropObjects)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    tf = false;
    % 7 9
    if isempty(dropObjects)
        return
    end
    % 11 13
    for i=length(dropObjects):-1.0:1.0
        if isa(dropObjects(i), 'RptgenML.ComponentMakerData')
            tf = true;
            droppedObject = dropObjects(i);
            droppedObject = this.addProperty(droppedObject);
            droppedObject.updateErrorState;
        else
            if isa(dropObjects(i), 'rptgen.rptcomponent')
                tf = true;
                droppedObject = this;
                this.loadComponent(dropObjects(i));
            else
                if isa(dropObjects(i), 'RptgenML.LibraryComponent')
                    tf = true;
                    droppedObject = this;
                    this.loadComponent(dropObjects(i).makeComponent);
                end
            end
        end
    end % for
    r = RptgenML.Root;
    if not(isempty(r.Editor)) && tf
        ed = DAStudio.EventDispatcher;
        ed.broadcastEvent('HierarchyChangedEvent', r);
        r.Editor.view(droppedObject);
    end
end
