function delete(A)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    myhandle = get(A, 'MyHandle');
    if get(myhandle, 'IsSelected')
        set(myhandle, 'IsSelected', 0.0);
    end % if
    myParent = get(A, 'MyBin');
    if not(isempty(myParent))
        myParent.RemoveItem = A;
    end % if
end % function
