function retStatus = Refresh(hThis)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    retStatus = true;
    % 10 11
    try
        % 12 14
        % 13 14
        if isempty(hThis.Value)
            hThis.Value = xlate('None');
        end % if
        % 17 19
        % 18 19
        hThis.EnableStatus = pm_getenablestatus(pm_getsl_dblhandle(hThis.BlockHandle), hThis.BlkParamName);
        % 20 23
        % 21 23
        % 22 23
        hThis.getJointInfo();
        % 24 27
        % 25 27
        % 26 27
        l_ValidateValue(hThis);
        % 28 30
        % 29 30
        hThis.buildDropDownInfo();
    catch
        % 32 33
        retStatus = false;
    end % try
end % function
function l_ValidateValue(hThis)
    % 37 43
    % 38 43
    % 39 43
    % 40 43
    % 41 43
    % 42 43
    if isempty(hThis.PrimList) || eq(numel(hThis.PrimList), 0.0)
        % 44 45
        hThis.IsConnected = false;
    else
        hThis.IsConnected = true;
        nPrims = numel(hThis.PrimList);
        found = false;
        for idx=1.0:nPrims
            if strcmpi(hThis.PrimList(idx).Name, hThis.Value)
                found = true;
                break
            end % if
        end % for
        if not(found)
            hThis.Value = hThis.PrimList(1.0).Name;
        end % if
    end % if
    % 60 61
end % function
