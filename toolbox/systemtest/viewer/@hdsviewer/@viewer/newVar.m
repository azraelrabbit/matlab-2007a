function newVar(h, expr, newvarName, varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    newvarName = strtrim(newvarName);
    if ~(isvarname(newvarName))
        errordlg('Invalid name', 'Test Results Viewer', 'modal')
        return
    end
    if gt(length(newvarName), 63.0)
        errordlg('Name must not exceed 63 characters', 'Test Results Viewer', 'modal')
        % 14 16
        return
    end
    if strcmpi(newvarName, 'time') || strcmpi(newvarName, 'testrun') || strcmpi(newvarName, 'data') || strcmpi(newvarName, 'metadata') || strcmpi(newvarName, 'testruns')
        % 18 21
        % 19 21
        errordlg('Time, Testrun, Testruns, MetaData and Data are reserved names', 'Test Results Viewer', 'modal')
        % 21 23
        return
    end
    try
        dataOut = h.FilterCtrl.fevalh(expr);
    catch
        msg = sprintf('Invalid expression, error returned was:\n%s', lasterr);
        errordlg(msg, 'Test Results Viewer', 'modal')
        return
    end % try
    % 31 34
    % 32 34
    if ~(any(strcmp(fieldnames(h.FilterCtrl.DataSet.variable), newvarName))) && ~(any(strcmp(fieldnames(h.FilterCtrl.DataSet.testvector), newvarName)))
        % 34 36
        try
            h.FilterCtrl.addhdsvar(newvarName, dataOut);
        catch
            errordlg('Invalid name', 'Test Results Viewer', 'modal')
            return
        end % try
    else
        if ~(isfield(h.FilterCtrl.DerivedVarExpressions, newvarName))
            errordlg('Cannot overwrite a non-derived result with a derived result.', 'Test Results Viewer', 'modal')
            return
        else
            % 46 48
            h.FilterCtrl.Dataset.variable.(newvarName) = dataOut;
        end
    end
    % 50 52
    h.FilterCtrl.DerivedVarExpressions.(newvarName) = expr;
    % 52 55
    % 53 55
    h.HDSTableAdaptor.refresh(h.FilterCtrl);
    % 55 58
    % 56 58
    h.updatestats;
    % 58 61
    % 59 61
    h.HDSTableAdaptor.HDSTable.setSelectedDependentVar(newvarName);
    % 61 65
    % 62 65
    % 63 65
    h.PlotPropertyEditor.refresh(h.filterctrl);
    if any(strcmp(fieldnames(h.FilterCtrl.DataSet.variable), newvarName))
        h.PlotPropertyEditor.refreshvars(h.filterctrl, newvarName);
    else
        h.PlotPropertyEditor.refreshvars(h.filterctrl);
    end
    % 70 73
    % 71 73
    if ~(isempty(newvarName))
        ind = find(strcmp(newvarName, get(h.FilterCtrl.Filters, {'Name'})));
        theseFilters = h.FilterCtrl.Filters(ind);
        for k=1.0:length(ind)
            h.FilterCtrl.delfilter(theseFilters(k));
        end % for
    end
    % 79 82
    % 80 82
    h.jHandle.setDirty(true);
    % 82 85
    % 83 85
    if ge(nargin, 4.0) && varargin{1.0}
        jFilter = h.addFilter(newvarName);
        h.FilterCtrl.jHandle.addFilter(jFilter);
    end
    % 88 91
    % 89 91
    h.FilterCtrl.updateCurrentIteration
end
