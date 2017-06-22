function stresults = convertCell2Mat(result)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    stresults = result.stresults;
    if isempty(stresults.variable)
        return
    end
    % 16 19
    % 17 19
    variableNames = fieldnames(stresults.variable);
    for resultn_index=1.0:length(variableNames)
        % 20 22
        currentVarName = variableNames{resultn_index};
        currentVar = stresults.variable.(currentVarName);
        % 23 27
        % 24 27
        % 25 27
        if any(cellfun('isempty', currentVar))
            continue;
        end
        % 29 34
        % 30 34
        % 31 34
        % 32 34
        sizeOfCellGrid = size(currentVar);
        sizeOfCellElements = size(currentVar{1.0});
        % 35 39
        % 36 39
        % 37 39
        if ~(isnumeric(currentVar{1.0}))
            continue;
        end
        % 41 47
        % 42 47
        % 43 47
        % 44 47
        % 45 47
        cell2matElement1 = cell(1.0, prod(sizeOfCellGrid));
        for resulti_index=1.0:prod(sizeOfCellGrid)
            cell2matElement1{resulti_index} = currentVar{resulti_index}(:);
        end % for
        % 50 54
        % 51 54
        % 52 54
        try
            % 54 61
            % 55 61
            % 56 61
            % 57 61
            % 58 61
            % 59 61
            cell2matElement2 = reshape(horzcat(cell2matElement1{:}), horzcat(prod(sizeOfCellElements), sizeOfCellGrid));
            % 61 68
            % 62 68
            % 63 68
            % 64 68
            % 65 68
            % 66 68
            cell2matElement3 = permute(cell2matElement2, horzcat(2.0:plus(length(sizeOfCellGrid), 1.0), 1.0));
            % 68 75
            % 69 75
            % 70 75
            % 71 75
            % 72 75
            % 73 75
            stresults.variable.(currentVarName) = reshape(cell2matElement3, horzcat(sizeOfCellGrid, sizeOfCellElements));
        catch
            % 76 79
            % 77 79
            if com.mathworks.toolbox.systemtest.util.DebuggingUtil.isDebuggingMCode
                % 79 83
                % 80 83
                % 81 83
                warnState = warning('off', 'backtrace');
                warning('systemtest:convertCell2Mat:resultNotConverted', 'Unable to convert Test Result ''%s'' from a cell to numeric array.', currentVarName);
                % 84 87
                % 85 87
                warning(warnState);
            end
        end % try
    end % for
end
