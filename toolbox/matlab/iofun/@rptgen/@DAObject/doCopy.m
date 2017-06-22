function thisCopy = doCopy(this, copySiblings)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    thisCopy = copy(this);
    % 9 11
    % 10 11
    thisChild = this.down;
        while not(isempty(thisChild))
        if isa(thisChild, 'rptgen.DAObject')
            try
                thisChildCopy = doCopy(thisChild, thisChild);
            catch
                warning(lasterr);
                thisChildCopy = [];
            end % try
        else
            try
                thisChildCopy = copy(thisChild);
            catch
                warning(lasterr);
                thisChildCopy = [];
            end % try
        end % if
        if not(isempty(thisChildCopy))
            connect(thisChildCopy, thisCopy, 'up');
        end % if
        thisChild = thisChild.right;
    end % while
end % function
