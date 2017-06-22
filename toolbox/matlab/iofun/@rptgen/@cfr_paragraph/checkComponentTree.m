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
    % 12 15
    % 13 15
    if strcmp(this.TitleType, 'subcomp') && isFirstChild(this, thisChild)
        thisContentType = this.getContentType;
        childContentType = thisChild.getContentType;
        if isempty(childContentType) || strcmp(childContentType, 'text')
        else
            % 19 21
            % 20 22
            errMsg = xlate('Paragraph draws title from first child - must be text');
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
    % 32 39
    % 33 39
    % 34 39
    % 35 39
    % 36 39
    % 37 39
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
