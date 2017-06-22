function hndl = subsasgn(hndl, S, B)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    switch S(1.0).type
    case {'()','{}'}
        % 9 11
        idx = S(1.0).subs;
        hndlstruct = struct(hndl);
        % 12 14
        if gt(length(S), 1.0)
            if eq(length(idx), 1.0)
                indices = idx{:};
                tmp = class(hndlstruct(idx{:}), 'scribehandle');
                tmp = subsasgn(tmp, S(2.0:end), B);
                hndl(indices) = tmp;
            else
                tmp = class(hndlstruct(idx{1.0}(:), idx{2.0}(:)), 'scribehandle');
                tmp = subsasgn(tmp, S(2.0:end), B);
                hndl(idx{1.0}(:), idx{2.0}(:)) = tmp;
            end % if
        else
            Bstruct = struct(B);
            hndlstruct(idx{:}) = Bstruct;
            hndl = class(hndlstruct, 'scribehandle');
        end % if
    case '.'
        % 30 33
        % 31 33
        if eq(length(hndl), 1.0)
            hndls = hndl;
        else
            if iscell(hndl)
                hndls = horzcat(hndl{:});
            end % if
            [row, col] = size(hndl);
            if eq(col, 1.0)
                hndls = ctranspose(hndl);
            else
                hndls = hndl;
            end % if
        end % if
        % 45 47
        for idx=1.0:numel(hndls)
            aHndl = hndls(idx);
            ud = getscribeobjectdata(aHndl.HGHandle);
            MLObj = ud.ObjectStore;
            switch S(1.0).subs
            case 'Object'
                MLObj = B;
                % 53 55
                ud.ObjectStore = MLObj;
                setscribeobjectdata(aHndl.HGHandle, ud);
            otherwise
                if eq(length(S), 1.0)
                    if eq(numel(hndls), 1.0)
                        MLObj = subsasgn(MLObj, S, B);
                    else
                        MLObj = subsasgn(MLObj, S, B{idx});
                    end % if
                else
                    subSet = subsref(MLObj, S(1.0));
                    subSet = subsasgn(subSet, S(2.0:end), B);
                end % if
                % 67 69
                ud.ObjectStore = MLObj;
                setscribeobjectdata(aHndl.HGHandle, ud);
            end % switch
        end % for
    end % switch
