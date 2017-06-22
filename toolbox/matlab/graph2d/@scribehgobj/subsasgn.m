function A = subsasgn(A, S, B)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    switch S.type
    case '.'
        switch S.subs
        case 'HGHandle'
            A.HGHandle = B;
        case 'IsSelected'
            A.ObjSelected = B;
        otherwise
            A = set(A, S.subs, B);
        end % switch
    case '()'
        % 19 20
        structA = struct(A);
        structA(S.subs{:}) = struct(B);
        A = class(A, 'scribehgobj');
    end % switch
end % function
