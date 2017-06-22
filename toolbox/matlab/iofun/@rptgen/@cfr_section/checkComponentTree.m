function errMsg = checkComponentTree(this, thisChild)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    errMsg = '';
    % 12 14
    if this.isTitleFromSubComponent && isFirstChild(this, thisChild)
        thisContentType = this.getContentType;
        childContentType = thisChild.getContentType;
        if isempty(childContentType) || strcmp(childContentType, 'text')
        else
            % 18 20
            % 19 21
            errMsg = xlate('Section draws title from first child - must be text');
        end
    else
        try
            errMsg = RptgenML.checkComponentTree(this, thisChild);
        catch
            errMsg = lasterr;
        end % try
    end
end
function tf = isFirstChild(this, thisChild)
    % 31 38
    % 32 38
    % 33 38
    % 34 38
    % 35 38
    % 36 38
    tf = false;
    firstChild = this.down;
    while not(isempty(thisChild))
        if eq(thisChild, firstChild)
            tf = true;
            return
        else
            if eq(thisChild, this)
                return
            end
        end
        thisChild = thisChild.up;
    end % while
end
