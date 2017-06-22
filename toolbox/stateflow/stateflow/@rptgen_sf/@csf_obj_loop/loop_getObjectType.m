function oType = loop_getObjectType(c, obj, ps)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    if (lt(nargin, 2.0)) | (isempty(obj))
        termTypes = listTerminalTypes(rptgen_sf.appdata_sf);
        oType = '';
        numAdded = 0.0;
        for i=1.0:length(termTypes)
            if get(c, horzcat('isReport', termTypes{i}))
                if eq(numAdded, 0.0)
                    oType = termTypes{i};
                else
                    if gt(numAdded, 3.0)
                        oType = 'Terminal';
                        return
                    else
                        oType = horzcat(oType, '/', termTypes{i});
                    end
                end
                numAdded = plus(numAdded, 1.0);
            end
        end % for
        if eq(numAdded, 0.0)
            oType = 'Terminal';
        end
    else
        oType = ps.getObjectType(obj);
    end
end
