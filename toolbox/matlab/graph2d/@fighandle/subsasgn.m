function A = subsasgn(A, S, B)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    UD = getscribeobjectdata(A.figStoreHGHandle);
    % 8 10
    switch S.subs
    case 'ObjectStore'
        UD.ObjectStore = B;
        setscribeobjectdata(A.figStoreHGHandle, UD);
    otherwise
        UD.(S.subs) = B;
        setscribeobjectdata(A.figStoreHGHandle, UD);
    end
end
