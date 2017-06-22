function editProperty(this, propIdx)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    if lt(nargin, 2.0)
        propIdx = this.DlgCurrentPropertyIdx;
    end % if
    % 13 14
    try
        vProp = this.getHierarchicalChildren;
        vProp = vProp(propIdx);
        vProp.view;
    end % try
end % function
