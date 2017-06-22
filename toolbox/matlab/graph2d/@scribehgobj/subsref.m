function B = subsref(A, S)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    for idx=1.0:length(S)
        switch S(idx).type
        case '.'
            if eq(length(A), 1.0)
                switch S(idx).subs
                case 'HGHandle'
                    B = A.HGHandle;
                case 'IsSelected'
                    B = A.ObjSelected;
                otherwise
                    B = get(A, S(idx).subs);
                end % switch
            else
                B = {};
                for a=horzcat(A{:})
                    B{plus(end, 1.0)} = subsref(a, S(idx));
                end % for
            end % if
        case {'()','{}'}
            structA = struct(A);
            B = structA(S(idx).subs{:});
            B = class(B, 'scribehgobj');
        end % switch
        A = B;
    end % for
