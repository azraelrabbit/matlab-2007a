function newHandle = copyobj(A, newParentH)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    newHandle = [];
    % 8 10
    if isa(A, 'scribehandle')
        aHG = A.HGHandle;
        ud = getscribeobjectdata(aHG);
        aObj = ud.ObjectStore;
    else
        if isa(A, 'scribehgobj')
            aObj = A;
            aHG = A.HGHandle;
        else
            error('MATLAB:copyobj:NeedHandle', 'must supply an HGOBJ or a handle to an HGOBJ object')
            return;
        end % if
        % 21 23
    end % if
    selected = get(A, 'IsSelected');
    if eq(nargin, 1.0)
        HGParent = get(aHG, 'parent');
    else
        HGParent = newParentH;
        % 28 34
        % 29 34
        % 30 34
        % 31 34
        % 32 34
    end % if
    % 34 36
    newObj = copyobj(aObj, HGParent);
    if isempty(newObj)
        return;
    end % if
    newHandle = scribehandle(newObj);
    if selected
        set(newHandle, 'IsSelected', selected);
    end % if
end % function
