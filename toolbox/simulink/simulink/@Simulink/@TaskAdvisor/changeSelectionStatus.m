function success = changeSelectionStatus(this, newstatus)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    success = false;
    % 8 10
    if this.Visible && this.Enable
        % 10 12
        if ne(this.MACIndex, 0.0)
            if this.ByTaskMode
                this.MAObj.updateCheckForTask(this.MACIndex, newstatus);
            else
                this.MAObj.updateCheck(this.MACIndex, newstatus);
            end
        else
            if ne(this.MATIndex, 0.0)
                this.MAObj.updateTask(this.MATIndex, newstatus);
            end
        end
        for i=1.0:length(this.ChildrenObj)
            childsuccess = changeSelectionStatus(this.ChildrenObj{i}, newstatus);
            if not(childsuccess)
                success = false;
            end
        end % for
        this.Selected = newstatus;
        success = true;
        % 30 32
        dlgs = DAStudio.ToolRoot.getOpenDialogs(this);
        if isa(dlgs, 'DAStudio.Dialog')
            dlgs.restoreFromSchema;
        end
        % 35 37
        ed = DAStudio.EventDispatcher;
        ed.broadcastEvent('PropertyChangedEvent', this);
        this.updateStates(this.State, 'fastmode');
    else
        success = false;
    end
end
