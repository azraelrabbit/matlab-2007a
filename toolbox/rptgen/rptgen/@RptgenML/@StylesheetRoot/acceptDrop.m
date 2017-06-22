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
    for i=1.0:length(dropObjects)
        if isa(dropObjects(i), 'RptgenML.StylesheetEditor')
            tf = true;
            droppedObject = this.addStylesheetEditor(dropObjects(i));
        else
            if isa(dropObjects(i), 'rptgen.coutline') || isa(dropObjects(i), 'rpt_xml.db_output')
                tf = true;
                droppedObject = RptgenML.StylesheetEditor(dropObjects(i));
                connect(droppedObject, this, 'up');
            else
                % 22 24
            end % if
        end % if
    end % for
    r = RptgenML.Root;
    if not(isempty(r.Editor)) && tf
        ed = DAStudio.EventDispatcher;
        ed.broadcastEvent('HierarchyChangedEvent', r);
        % 30 32
        r.Editor.view(droppedObject);
        % 32 35
        % 33 35
    end % if
end % function
