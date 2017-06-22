function B = subsref(cObj, S)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    switch S(1.0).type
    case '.'
        switch lower(S(1.0).subs)
        case 'resetparent'
            B = cObj.ResetParent;
        case 'items'
            B = validatehandles(cObj.Items);
            cObj.Items = B;
            if gt(length(S), 1.0)
                B = subsref(B, S(2.0:end));
            end % if
        case 'scribehgobj'
            if gt(length(S), 1.0)
                B = subsref(cObj.scribehgobj, S(2.0:end));
            end % if
        otherwise
            theHGobj = cObj.scribehgobj;
            B = subsref(theHGobj, S);
        end % switch
    otherwise
        theHGobj = cObj.scribehgobj;
        B = subsref(theHGobj, S);
    end % switch
