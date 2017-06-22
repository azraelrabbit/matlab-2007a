function populatePlotEditor(h, filterctrl, currentPlotPanel)
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    import com.mathworks.toolbox.systemtest.viewer.*;
    import java.util.*;
    % 12 14
    inVars = java.util.Vector;
    gridvars = fieldnames(filterctrl.DataSet.testvector);
    for k=1.0:length(gridvars)
        inVars.add(java.lang.String(gridvars{k}));
    end % for
    currentPlotPanel.independentVars = inVars;
    % 19 21
    ordvars = fieldnames(filterctrl.DataSet.variable);
    outVars = java.util.Vector;
    for k=1.0:length(ordvars)
        outVars.add(java.lang.String(ordvars{k}));
    end % for
    currentPlotPanel.fDependentVars = outVars;
