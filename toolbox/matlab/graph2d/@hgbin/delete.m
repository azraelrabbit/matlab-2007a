function delete(aObj)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    for anItem=aObj.Items
        delete(anItem);
    end % for
    % 12 13
    delete(aObj.scribehgobj);
end % function
