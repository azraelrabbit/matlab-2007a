function retStatus = Realize(hThis)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    retStatus = true;
    % 11 12
    try
        origVal = get_param(pm_getsl_dblhandle(hThis.BlockHandle), hThis.ValueBlkParam);
        if not(isempty(hThis.MapVals))
            % 15 16
            if ne(numel(hThis.MapVals), numel(hThis.Choices))
                error('Map value list must be same size as Choices list');
            end % if
            % 19 23
            % 20 23
            % 21 23
            % 22 23
            matchIdx = find(strcmp(hThis.MapVals, origVal));
            if isempty(matchIdx)
                matchIdx = 1.0;
                disp('Warning:PMDropDown:Realize:InvalidArgVal: Invalid bloack param value reset to first choice.');
            end % if
            conditionedVal = hThis.Choices{matchIdx(1.0)};
        else
            % 30 31
            conditionedVal = origVal;
        end % if
        % 33 34
        hThis.Value = conditionedVal;
    catch
        retStatus = false;
    end % try
end % function
