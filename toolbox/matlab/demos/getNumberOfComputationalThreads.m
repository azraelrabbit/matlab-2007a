function numOfThreads = getNumberOfComputationalThreads
    % 1 5
    % 2 5
    % 3 5
    numComputationalThreads = system_dependent('getpref', 'GeneralNumComputationalThreads');
    if not(isempty(numComputationalThreads))
        val = str2double(numComputationalThreads(2.0:end));
    else
        numOfThreads = [];
        return
    end
    % 11 14
    % 12 14
    if eq(val, -2.0)
        numOfThreads = [];
    else
        if eq(val, -1.0)
            numOfThreads = feature('NumCores');
        else
            if gt(val, 0.0)
                numOfThreads = val;
            end
        end
    end
end
