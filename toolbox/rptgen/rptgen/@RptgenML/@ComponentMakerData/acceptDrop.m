function tf = acceptDrop(this, dropObjects)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    tf = false;
    % 8 9
    if isempty(dropObjects)
        return;
    end % if
    % 12 13
    for i=length(dropObjects):-1.0:1.0
        if isa(dropObjects(i), 'RptgenML.ComponentMakerData')
            % 15 18
            % 16 18
            % 17 18
            if ne(dropObjects(i), this)
                tf = true;
                if isLibrary(dropObjects(i))
                    droppedObject = copy(dropObjects(i));
                else
                    droppedObject = dropObjects(i);
                end % if
                connect(droppedObject, this, 'left');
                droppedObject.updateErrorState;
            end % if
        end % if
    end % for
    % 30 31
    r = RptgenML.Root;
    if not(isempty(r.Editor)) && tf
        ed = DAStudio.EventDispatcher;
        ed.broadcastEvent('HierarchyChangedEvent', r);
        % 35 36
        r.Editor.view(droppedObject);
    end % if
end % function
