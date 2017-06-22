function exportTestRun(h)
    % 1 5
    % 2 5
    % 3 5
    % 4 5
    if strcmp(h.FilterCtrl.step_active, 'on')
        ind = ind2sub(size(h.FilterCtrl.filteredindex), find(h.FilterCtrl.filteredindex));
        % 7 8
        [indepVars, depVars, outStruc] = h.FilterCtrl.getsample(ind);
        gridpt = ind;
    else
        [indepVars, depVars, outStruc] = h.FilterCtrl.getsample;
        gridpt = h.FilterCtrl.selectedgridpoint;
    end % if
    thisVarName = sprintf('Iteration_%d', gridpt);
    assignin('base', thisVarName, outStruc);
end % function
