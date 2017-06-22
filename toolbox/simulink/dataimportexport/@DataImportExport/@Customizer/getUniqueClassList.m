function UniqueClasses = getUniqueClassList(hCustomizer)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    UniqueClasses = [];
    % 9 11
    % 10 11
    if not(isempty(hCustomizer.NameTransform))
        UniqueClasses = vertcat(UniqueClasses, hCustomizer.NameTransform(:, 1.0));
    end % if
    % 14 16
    % 15 16
    if not(isempty(hCustomizer.ValueTransform))
        UniqueClasses = vertcat(UniqueClasses, hCustomizer.ValueTransform(:, 1.0));
    end % if
    % 19 21
    % 20 21
    if not(isempty(hCustomizer.ExcludeTransform))
        UniqueClasses = vertcat(UniqueClasses, hCustomizer.ExcludeTransform(:, 1.0));
    end % if
    % 24 26
    % 25 26
    if not(isempty(hCustomizer.IncludeTransform))
        UniqueClasses = vertcat(UniqueClasses, hCustomizer.IncludeTransform(:, 1.0));
    end % if
    % 29 31
    % 30 31
    if not(isempty(hCustomizer.ClassTransform))
        UniqueClasses = vertcat(UniqueClasses, hCustomizer.ClassTransform(:, 1.0));
    end % if
    % 34 36
    % 35 36
    UniqueClasses = unique(UniqueClasses);
    % 37 38
end % function
