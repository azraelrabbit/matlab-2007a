function SPSErrorOut = showSPSerror(SPSErrorIn)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    persistent SPS_ERROR;
    % 11 13
    if gt(nargin, 0.0)
        if isempty(SPSErrorIn)
            SPS_ERROR = struct('message', '', 'identifier', '');
        else
            SPS_ERROR = cat(2.0, SPS_ERROR, SPSErrorIn);
        end
        % 18 20
    end
    SPSErrorOut = SPS_ERROR;
    % 21 23
end
