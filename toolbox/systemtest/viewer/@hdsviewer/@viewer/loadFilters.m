function loadFilters(h, s)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    if isempty(s.Filters)
        return;
    end % if
    jFilters = javaArray('com.mathworks.toolbox.systemtest.viewer.abstractFilterPanel', numel(s.Filters));
    % 10 13
    % 11 13
    % 12 13
    for k=1.0:numel(s.Filters)
        detailNames = fieldnames(s.Filters(k).Details);
        detailValues = struct2cell(s.Filters(k).Details);
        pvPairs = vertcat(ctranspose(detailNames(:)), ctranspose(detailValues(:)));
        [jFilters(k), thisFilter] = h.addFilter(s.Filters(k).Name, 'Active', s.Filters(k).Active, pvPairs{:});
        % 18 19
    end % for
    % 20 22
    % 21 22
    h.FilterCtrl.jHandle.addFilter(jFilters);
    h.FilterCtrl.refresh
    % 24 26
    % 25 26
    h.FilterCtrl.getfilteredgridindex([], [])
end % function
