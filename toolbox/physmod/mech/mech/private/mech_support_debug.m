function debugMode = mech_support_debug(setting)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    persistent debugFlag;
    if eq(nargin, 1.0)
        debugFlag = setting;
    end
    % 18 20
    debugMode = debugFlag;
end
