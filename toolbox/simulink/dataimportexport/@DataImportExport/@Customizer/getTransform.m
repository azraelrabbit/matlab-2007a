function Transform = getTransform(hCustomizer, ClassName, TransformType)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    switch TransformType
    case 'Name'
        Transform = s_getMatchingTransform(ClassName, hCustomizer.NameTransform);
        % 11 13
    case 'Include'
        % 12 14
        Transform = s_getMatchingTransform(ClassName, hCustomizer.IncludeTransform);
        % 15 17
    case 'Class'
        % 16 18
        Transform = s_getMatchingTransform(ClassName, hCustomizer.ClassTransform);
        % 18 20
    end % switch
    % 20 22
function Transform = s_getMatchingTransform(ClassName, TransformGroup)
    % 22 37
    % 23 37
    % 24 37
    % 25 37
    % 26 37
    % 27 37
    % 28 37
    % 29 37
    % 30 37
    % 31 37
    % 32 37
    % 33 37
    % 34 37
    % 35 37
    Transform = [];
    % 37 40
    % 38 40
    if not(isempty(TransformGroup))
        % 40 42
        TransformIndex = find(strcmp(ClassName, TransformGroup(:, 1.0)));
    else
        % 43 45
        TransformIndex = [];
    end % if
    % 46 49
    % 47 49
    if not(isempty(TransformIndex))
        % 49 51
        Transform = TransformGroup(TransformIndex, :);
    end % if
    % 52 54
