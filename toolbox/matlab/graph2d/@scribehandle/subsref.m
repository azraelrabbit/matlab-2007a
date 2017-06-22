function B = subsref(hndl, S)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    switch S(1.0).type
    case {'()','{}'}
        indices = S(1.0).subs;
        structH = struct(hndl);
        tmp = structH(indices{:});
        % 13 16
        % 14 16
        B = builtin('class', tmp, 'scribehandle');
        if gt(length(S), 1.0)
            B = subsref(B, S(2.0:end));
        end % if
    case '.'
        Hstruct = struct(hndl);
        HG = squeeze(struct2cell(Hstruct));
        switch S(1.0).subs
        case 'Object'
            for idx=1.0:numel(HG)
                ud = getscribeobjectdata(HG{idx});
                MLObj = ud.ObjectStore;
                if eq(idx, 1.0)
                    B = MLObj;
                else
                    B = horzcat(B, MLObj);
                end % if
            end % for
            B = reshape(B, size(hndl));
        case 'HGHandle'
            if eq(numel(HG), 1.0)
                B = HG{1.0};
            else
                B = HG;
            end % if
        otherwise
            for idx=1.0:numel(HG)
                ud = getscribeobjectdata(HG{idx});
                MLObj = ud.ObjectStore;
                if eq(idx, 1.0)
                    B = cellhorzcat(subsref(MLObj, S));
                else
                    B = horzcat(B, cellhorzcat(subsref(MLObj, S)));
                end % if
            end % for
            if eq(numel(hndl), 1.0)
                B = B{:};
            else
                B = reshape(B, size(hndl));
            end % if
        end % switch
    end % switch
