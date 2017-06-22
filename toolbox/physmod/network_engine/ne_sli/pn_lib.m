function varargout = pn_lib
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
    persistent HAS_WARNED;
    if isempty(HAS_WARNED)
        pm_warning('network_engine:pn_lib:PnLibObsolete', pmsl_defaultlibrary);
        HAS_WARNED = true;
    end
    % 17 19
    if eq(nargout, 0.0)
        open_system(pmsl_defaultlibrary);
    else
        varargout{1.0} = pmsl_defaultlibrary;
    end
    % 23 25
end
