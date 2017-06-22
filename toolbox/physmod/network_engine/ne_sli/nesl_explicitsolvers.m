function supportedOut = nesl_explicitsolvers(supportedIn)
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
    persistent SUPPORTED;
    % 17 19
    if isempty(SUPPORTED)
        SUPPORTED = false;
    end
    % 21 23
    if gt(nargin, 0.0)
        SUPPORTED = supportedIn;
    end
    % 25 27
    supportedOut = SUPPORTED;
end
