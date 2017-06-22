function delVar(h, varName)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    import com.mathworks.toolbox.systemtest.viewer.*;
    % 7 10
    % 8 10
    h.Filterctrl.delhdsvar(varName);
    % 10 13
    % 11 13
    h.HDSTableAdaptor.refresh(h.FilterCtrl);
    % 13 17
    % 14 17
    % 15 17
    h.PlotPropertyEditor.refreshvars(h.filterctrl, varName);
    h.PlotPropertyEditor.refresh(h.FilterCtrl);
    % 18 21
    % 19 21
    ind = find(strcmp(varName, get(h.FilterCtrl.Filters, {'Name'})));
    theseFilters = h.FilterCtrl.Filters(ind);
    for k=1.0:length(ind)
        h.FilterCtrl.delfilter(theseFilters(k));
    end % for
    % 25 28
    % 26 28
    h.updatestats;
    % 28 31
    % 29 31
    h.FilterCtrl.updateCurrentIteration
