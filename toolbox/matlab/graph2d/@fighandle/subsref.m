function B = subsref(A, S)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    B = [];
    if ishandle(A.figStoreHGHandle)
        % 9 11
        UD = getscribeobjectdata(A.figStoreHGHandle);
        % 11 13
        switch S.subs
        case 'Figure'
            B = get(A.figStoreHGHandle, 'Parent');
        case 'HGHandle'
            B = A.figStoreHGHandle;
        otherwise
            if isfield(UD, S.subs)
                B = UD.(S.subs);
            end
        end
        % 22 24
    end
end
