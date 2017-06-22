function ec_create_type_obj(varargin)
    % 1 17
    % 2 17
    % 3 17
    % 4 17
    % 5 17
    % 6 17
    % 7 17
    % 8 17
    % 9 17
    % 10 17
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    % 16 17
    if eq(exist('ec_get_info_for_aliastype.m', 'file'), 2.0)
        % 18 20
        % 19 20
        objectList = ec_get_info_for_aliastype(varargin);
    else
        % 22 23
        objectList = get_user_type_info_for_aliastype;
    end % if
    % 25 26
    aliasMisMatch = {};
    for i=1.0:length(objectList)
        mismatch = sldowprivate('create_object_aliastype', objectList{i});
        if not(isempty(mismatch))
            aliasMisMatch{plus(end, 1.0)} = mismatch;
        end % if
    end % for
    % 33 34
    aliasMisMatch = unique(aliasMisMatch);
    if not(isempty(aliasMisMatch))
        % 36 37
        str = cellstr2str(aliasMisMatch);
        warning(sprintf('The following registered user data type or types are inconsistent with existing Simulink.AliasType or Simulink.NumericType object or objects in the base workspace:\n    %s\n The existing object or objects are preserved.', str));
        % 39 42
        % 40 42
        % 41 42
    end % if
end % function
