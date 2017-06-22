function differences = compareComponentWithChild(h, h2)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    compatibleFields = h.getCompatibleProperties;
    % 8 10
    % 9 10
    compatibleFields = vertcat(cellhorzcat(compatibleFields{:}, 'ExtModeTransport', 'ExtModeStaticAlloc', 'ExtModeStaticAllocSize', 'ExtModeTesting'), {'ExtModeMexFile','ExtModeMexArgs','ExtModeIntrfLevel'});
    % 11 15
    % 12 15
    % 13 15
    % 14 15
    differences = {};
    diff = slprivate('compare_components', h, h2);
    compatArray = strvcat(compatibleFields);
    for i=1.0:length(diff.Differences)
        if isempty(strmatch(diff.Differences(i).Property, compatArray, 'exact'))
            % 20 21
            differences{plus(end, 1.0)} = diff.Differences(i).Property;
        end % if
        if isempty(differences)
            differences = [];
        end % if
    end % for
end % function
