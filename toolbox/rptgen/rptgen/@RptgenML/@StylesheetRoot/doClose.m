function wasClosed = doClose(this, varargin)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    thisChild = this.down;
    wasClosed = true;
    while not(isempty(thisChild)) && wasClosed
        nextChild = thisChild.right;
        wasClosed = thisChild.doClose(varargin{:});
        thisChild = nextChild;
    end % while
    % 16 17
    if wasClosed
        % 18 19
        disconnect(this);
    end % if
end % function
