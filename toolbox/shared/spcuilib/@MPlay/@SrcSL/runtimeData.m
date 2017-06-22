function runtimeData(srcObj, hSLSignalData)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    if gt(hSLSignalData.numComponents, 1.0)
        DemandUpdateMulti(srcObj, hSLSignalData);
    else
        DemandUpdateSingle(srcObj, hSLSignalData);
    end % if
end % function
