function lastExceptionOut = nesl_lastexception(lastExceptionIn)
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
    persistent LAST_EXCEPTION;
    % 12 14
    if gt(nargin, 0.0)
        if isempty(lastExceptionIn)
            LAST_EXCEPTION = [];
        else
            LAST_EXCEPTION = cat(2.0, LAST_EXCEPTION, lastExceptionIn);
        end
        % 19 21
    end
    lastExceptionOut = LAST_EXCEPTION;
    % 22 24
end
