function resultArray = getModelAdvisorResult(system)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    mdladvObj = Simulink.ModelAdvisor.getModelAdvisor(system);
    resultArray = {};
    recordCellArray = mdladvObj.CheckCellArray;
    for i=1.0:length(recordCellArray)
        if recordCellArray{i}.Selected
            resultArray{plus(end, 1.0)} = recordCellArray{i}.Result;
        end % if
    end % for
