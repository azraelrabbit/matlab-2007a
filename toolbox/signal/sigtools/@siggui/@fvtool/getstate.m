function s = getstate(hFVT)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    s.currentAnalysis = get(hFVT, 'Analysis');
    s.OverlayedAnalysis = get(hFVT, 'OVerlayedAnalysis');
end % function
