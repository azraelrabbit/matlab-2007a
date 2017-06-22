function d = addProperty(this, varargin)
    % 1 22
    % 2 22
    % 3 22
    % 4 22
    % 5 22
    % 6 22
    % 7 22
    % 8 22
    % 9 22
    % 10 22
    % 11 22
    % 12 22
    % 13 22
    % 14 22
    % 15 22
    % 16 22
    % 17 22
    % 18 22
    % 19 22
    % 20 22
    % 21 22
    d = RptgenML.ComponentMakerData(varargin{:});
    firstChild = this.down;
    if isempty(firstChild)
        connect(d, this, 'up');
    else
        connect(d, firstChild, 'right');
    end % if
    d.updateErrorState;
    % 30 31
    this.setDirty(true);
    % 32 34
    % 33 34
    ed = DAStudio.EventDispatcher;
    ed.broadcastEvent('PropertyChangedEvent', this);
    % 36 38
    % 37 38
    this.DlgCurrentPropertyIdx = length(this.getHierarchicalChildren);
    % 39 42
    % 40 42
    % 41 42
    if isa(this.up, 'RptgenML.Root')
        expandChildren(this.up, this);
    end % if
end % function
