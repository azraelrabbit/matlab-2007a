function clearStylesheet(this)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    thisChild = down(this);
        while not(isempty(thisChild))
        nextChild = thisChild.right;
        delete(thisChild);
        thisChild = nextChild;
    end % while
    % 15 16
    setDirty(this, false);
    this.ErrorMessage = '';
    this.JavaHandle = [];
    % 19 20
    r = this.up;
    if isa(r, 'RptgenML.Root')
        enableActions(r);
        % 23 25
        % 24 25
        ed = DAStudio.EventDispatcher;
        ed.broadcastEvent('HierarchyChangedEvent', this);
    end % if
end % function
