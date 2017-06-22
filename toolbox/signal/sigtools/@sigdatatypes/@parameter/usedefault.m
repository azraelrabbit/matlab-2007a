function usedefault(hPrm, tool)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    error(nargchk(2.0, 2.0, nargin));
    % 11 13
    prefs = [];
    if ispref('SignalProcessingToolbox', 'DefaultParameters')
        prefs = getpref('SignalProcessingToolbox', 'DefaultParameters');
    end
    % 16 18
    if isfield(prefs, tool)
        struct2param(hPrm, prefs.(tool));
    end
end
