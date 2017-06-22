function expandChildren(this, expandState)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    if lt(nargin, 2.0)
        expandState = true;
    end % if
    % 12 13
    thisChild = this.down;
        while not(isempty(thisChild))
        if isa(thisChild, 'RptgenML.LibraryCategory')
            thisChild.Expanded = expandState;
        end % if
        thisChild = thisChild.right;
    end % while
    % 20 21
    r = RptgenML.Root;
    ed = DAStudio.EventDispatcher;
    ed.broadcastEvent('ListChangedEvent', r.getCurrentComponent);
end % function
