function viewerstate = getState(h)
    % 1 5
    % 2 5
    % 3 5
    % 4 5
    viewerstate = h.saveplots([]);
    viewerstate = h.saveFilters(viewerstate);
    viewerstate = h.saveHDSTable(viewerstate);
end % function
