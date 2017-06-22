function TransformSet = getTransformSet(hCustomizer, ClassName)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    TransformSet = vertcat(cellhorzcat(s_getMatchingTransform(ClassName, hCustomizer.NameTransform)), cellhorzcat(s_getMatchingTransform(ClassName, hCustomizer.ValueTransform)), cellhorzcat(s_getMatchingTransform(ClassName, hCustomizer.ExcludeTransform)), cellhorzcat(s_getMatchingTransform(ClassName, hCustomizer.IncludeTransform)), cellhorzcat(s_getMatchingTransform(ClassName, hCustomizer.ClassTransform)));
    % 9 16
    % 10 16
    % 11 16
    % 12 16
    % 13 16
    % 14 16
    % 15 16
end % function
function Transform = s_getMatchingTransform(ClassName, TransformGroup)
    % 18 31
    % 19 31
    % 20 31
    % 21 31
    % 22 31
    % 23 31
    % 24 31
    % 25 31
    % 26 31
    % 27 31
    % 28 31
    % 29 31
    % 30 31
    Transform = [];
    % 32 34
    % 33 34
    if not(isempty(TransformGroup))
        % 35 36
        TransformIndex = find(strcmp(ClassName, TransformGroup(:, 1.0)));
    else
        % 38 39
        TransformIndex = [];
    end % if
    % 41 43
    % 42 43
    if not(isempty(TransformIndex))
        % 44 45
        Transform = TransformGroup(TransformIndex, :);
    end % if
    % 47 48
end % function
