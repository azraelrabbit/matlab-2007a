function objList = appendContext(psUD, objList, ctxt)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    objList = objList(:);
    for i=1.0:length(objList)
        objList(i, 2.0) = ctxt;
    end % for
end % function
