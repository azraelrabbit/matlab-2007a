function [configset, configsetList] = ssc_get_configset(hdl, name)
    % 1 22
    % 2 22
    % 3 22
    % 4 22
    % 5 22
    % 6 22
    % 7 22
    % 8 22
    % 9 22
    % 10 22
    % 11 22
    % 12 22
    % 13 22
    % 14 22
    % 15 22
    % 16 22
    % 17 22
    % 18 22
    % 19 22
    % 20 22
    rtm = SSC.RunTimeModule;
    % 22 24
    if lt(nargin, 2.0)
        name = SSC.SimscapeCC.getComponentName;
    end
    % 26 33
    % 27 33
    % 28 33
    % 29 33
    % 30 33
    % 31 33
    persistent pCC;
    if isempty(pCC)
        pCC = SSC.SimscapeCC;
        % 35 44
        % 36 44
        % 37 44
        % 38 44
        % 39 44
        % 40 44
        % 41 44
        % 42 44
    end
    [cs, configsetList] = pCC.getConfigSetCC(hdl, nargout);
    % 45 47
    if not(isempty(cs))
        % 47 50
        % 48 50
        cs.updateListeners;
        % 50 52
        configset = cs.getSubComponent(name);
    else
        % 53 55
        configset = [];
    end
end
