function tf = acceptDrop(this, dropObjects)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    if isempty(dropObjects) || isequal(this, dropObjects)
        tf = false;
        return;
    end % if
    % 11 13
    dropIdx = 1.0;
    dropLength = length(dropObjects);
    if this.getParentable && this.Active
        firstChild = this.down;
        if isempty(firstChild)
            % 17 19
            toDrop = [];
            while isempty(toDrop) && le(dropIdx, dropLength)
                toDrop = locConvertComponent(dropObjects(dropIdx));
                dropIdx = plus(dropIdx, 1.0);
            end % while
            dropIdx = minus(dropIdx, 1.0);
            dropTarget = this;
            dropDirection = 'up';
        else
            if eq(firstChild, dropObjects(dropIdx))
                dropIdx = plus(dropIdx, 1.0);
                % 29 33
                % 30 33
                % 31 33
            end % if
            dropTarget = firstChild;
            dropDirection = 'right';
        end % if
    else
        dropTarget = this;
        dropDirection = 'left';
    end % if
    % 40 42
    for i=dropIdx:dropLength
        toDrop = locConvertComponent(dropObjects(i));
        if not(isempty(toDrop))
            connect(toDrop, dropTarget, dropDirection);
            % 45 51
            % 46 51
            % 47 51
            % 48 51
            % 49 51
            RptgenML.updateErrorStateRecursive(toDrop.up);
            % 51 53
            dropDirection = 'left';
            dropTarget = toDrop;
        end % if
    end % for
    % 56 58
    tf = true;
    this.setDirty;
    % 59 61
    r = RptgenML.Root;
    if not(isempty(r.Editor))
        ed = DAStudio.EventDispatcher;
        ed.broadcastEvent('HierarchyChangedEvent', this.up);
        % 64 66
        r.Editor.view(dropTarget);
    end % if
end % function
function c = locConvertComponent(c)
    % 69 74
    % 70 74
    % 71 74
    % 72 74
    if isa(c, 'rptgen.coutline')
        % 74 78
        % 75 78
        % 76 78
        c = rptgen.crg_nest_set('FileName', c.RptFileName);
    else
        if isa(c, 'rptgen.rptcomponent')
            if isa(c.up, 'rptgen.DAObject')
                % 81 83
                setDirty(c.up);
            end % if
            disconnect(c);
        else
            if isa(c, 'RptgenML.LibraryComponent') || isa(c, 'RptgenML.ComponentMaker')
                c = c.makeComponent;
            else
                if isa(c, 'RptgenML.LibraryRpt')
                    c = rptgen.crg_nest_set('FileName', c.FileName);
                else
                    % 92 94
                    c = [];
                end % if
            end % if
        end % if
    end % if
end % function
