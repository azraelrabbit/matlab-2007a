function val = getPreferredProperties(h)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    % 11 12
    base_props = h.getBaseBuildInfoClassProperties();
    additional_props = {'Path'};
    val = horzcat(base_props, additional_props);
end % function