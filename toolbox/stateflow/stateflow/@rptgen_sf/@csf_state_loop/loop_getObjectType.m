function oType = loop_getObjectType(this, obj, ps)
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    if (lt(nargin, 2.0)) | (isempty(obj))
        objProps = vertcat(cellhorzcat('isAndOrStates', xlate('And/Or State')), cellhorzcat('isBoxStates', xlate('Box')), cellhorzcat('isFcnStates', xlate('Function')), cellhorzcat('isTruthTables', xlate('Truth Table')), cellhorzcat('isEMFunctions', xlate('EM Function')));
        % 15 23
        % 16 23
        % 17 23
        % 18 23
        % 19 23
        % 20 23
        % 21 23
        objVal = get(this, objProps(:, 1.0));
        objVal = horzcat(objVal{:});
        trueProps = find(objVal);
        if eq(length(trueProps), 1.0)
            % 26 29
            % 27 29
            oType = objProps{trueProps, 2.0};
        else
            % 30 32
            oType = xlate('State');
        end
    else
        if lt(nargin, 3.0)
            ps = this.loop_getPropSrc;
        end
        oType = ps.getObjectType(obj);
    end
end
