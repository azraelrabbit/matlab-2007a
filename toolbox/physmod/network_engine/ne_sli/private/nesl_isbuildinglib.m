function retStatus = nesl_isbuildinglib(statusVal)
    % 1 17
    % 2 17
    % 3 17
    % 4 17
    % 5 17
    % 6 17
    % 7 17
    % 8 17
    % 9 17
    % 10 17
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    persistent internalStatus;
    if isempty(internalStatus)
        internalStatus = 0.0;
    end
    if eq(nargin, 1.0)
        internalStatus = statusVal;
    end
    retStatus = internalStatus;
end
