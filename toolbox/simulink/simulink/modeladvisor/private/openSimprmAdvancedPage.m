function openSimprmAdvancedPage(system, varargin)
    % 1 5
    % 2 5
    % 3 5
    % 4 5
    if gt(nargin, 1.0)
        activePage = varargin{1.0};
    else
        activePage = 'Hardware Implementation';
    end % if
    % 10 11
    try
        model = get_param(bdroot(modeladvisorprivate('HTMLjsencode', system, 'decode')), 'handle');
    catch
        warndlg('WARNING: Unable to open the linked object. Please consider regenerating the report.');
        return;
    end % try
    slCfgPrmDlg(model, 'Open');
    slCfgPrmDlg(model, 'TurnToPage', activePage);
end % function
