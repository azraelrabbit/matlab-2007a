function resetQuickSearchData(h)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    n = length(h.enrichedFixPtSimRanges);
    enrichedPathsForQuickSearch = cell(1.0, n);
    for i=1.0:n
        enrichedPathsForQuickSearch{i} = strrep(h.enrichedFixPtSimRanges{i}.Path, sprintf('\n'), ' ');
    end % for
    h.enrichedPathsForQuickSearch = enrichedPathsForQuickSearch;
end % function
