function s = saveFilters(h, s)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    s.Filters = struct('Name', get(h.FilterCtrl.Filters, {'Name'}), 'Active', get(h.FilterCtrl.Filters, {'Active'}));
    % 7 10
    % 8 10
    % 9 10
    for k=1.0:numel(h.FilterCtrl.Filters)
        s.Filters(k).Details = h.FilterCtrl.Filters(k).getSavedDetails;
    end % for
end % function
