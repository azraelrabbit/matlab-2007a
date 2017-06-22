function outArray = fevalh(h, fcnstr, varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    GridSize = h.getGridSize;
    if isscalar(GridSize)
        GridSize = horzcat(GridSize, 1.0);
    end
    outArray = cell(GridSize);
    % 12 15
    % 13 15
    numiterations = numel(outArray);
    if gt(numiterations, 1000.0)
        wb = waitbar(0.0, 'Evaluating the specified function at each test...', 'Name', 'Test Results Viewer');
        % 17 19
    end
    for k=1.0:numiterations
        try
            outArray{k} = localfeval(h, fcnstr, k);
        catch
            if gt(numiterations, 1000.0)
                close(wb)
            end
            rethrow(lasterror);
        end % try
        if gt(numiterations, 1000.0) && eq(minus(ceil(mrdivide(mtimes(100.0, k), numiterations)), mrdivide(mtimes(100.0, k), numiterations)), 0.0)
            waitbar(mrdivide(k, numiterations), wb);
        end
    end % for
    if gt(numiterations, 1000.0)
        close(wb)
    end
end
function outvec_veryraresuffix = localfeval(h_veryraresuffix, fcnstr_veryraresuffix, k_veryraresuffix)
    % 37 40
    % 38 40
    instruc_veryraresuffix = h_veryraresuffix.gethdssample(k_veryraresuffix);
    fieldnames__veryraresuffix = fieldnames(instruc_veryraresuffix);
    for i__veryraresuffix=1.0:length(fieldnames__veryraresuffix)
        eval(sprintf('%s = instruc_veryraresuffix.(fieldnames__veryraresuffix{i__veryraresuffix});', fieldnames__veryraresuffix{i__veryraresuffix}));
        % 43 45
    end % for
    % 45 48
    % 46 48
    try
        outvec_veryraresuffix = eval(fcnstr_veryraresuffix);
    catch
        % 50 52
        for k=1.0:length(fieldnames__veryraresuffix)
            if isa(instruc_veryraresuffix.(fieldnames__veryraresuffix{k}), 'Simulink.Timeseries') && ~(isempty(strfind(fcnstr_veryraresuffix, sprintf('%s{', fieldnames__veryraresuffix{k}))))
                % 53 55
                error('Invalid syntax for accessing the contents of Simulink Timeseries. Use ''()'' instead of ''{}''');
            end
        end % for
        rethrow(lasterror)
    end % try
end
