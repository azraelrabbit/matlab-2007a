function cTypes = getChildContentTypes(h, childComp)
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
    if lt(nargin, 2.0)
        childComp = h.down;
    end % if
    % 14 16
    cTypes = {};
        while not(isempty(childComp))
        childType = childComp.getContentType;
        if isempty(childType)
            cTypes = vertcat(horzcat(typeList), horzcat(childComp.getChildContentTypes));
        else
            cTypes{plus(end, 1.0), 1.0} = childType;
        end % if
        childComp = childComp.right;
    end % while
end % function
