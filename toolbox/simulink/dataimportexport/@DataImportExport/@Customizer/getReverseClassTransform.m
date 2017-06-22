function Transform = getReverseClassTransform(hCustomizer, ReverseClassName)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    Transform = s_getReverseMatchingTransform(ReverseClassName, hCustomizer.ClassTransform);
    % 10 12
    % 11 12
end % function
function Transform = s_getReverseMatchingTransform(ReverseClassName, TransformGroup)
    % 14 28
    % 15 28
    % 16 28
    % 17 28
    % 18 28
    % 19 28
    % 20 28
    % 21 28
    % 22 28
    % 23 28
    % 24 28
    % 25 28
    % 26 28
    % 27 28
    Transform = [];
    % 29 31
    % 30 31
    if not(isempty(TransformGroup))
        % 32 33
        TransformIndex = find(strcmp(ReverseClassName, TransformGroup(:, 2.0)));
    else
        % 35 36
        TransformIndex = [];
    end % if
    % 38 40
    % 39 40
    if not(isempty(TransformIndex))
        % 41 42
        Transform = TransformGroup(TransformIndex, :);
    end % if
    % 44 45
end % function
