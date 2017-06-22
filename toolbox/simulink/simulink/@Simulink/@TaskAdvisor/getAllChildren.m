function childrenObj = getAllChildren(this)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if isempty(this.ChildrenObj)
        childrenObj = cellhorzcat(this);
    else
        childrenObj = {};
        for i=1.0:length(this.ChildrenObj)
            childrenObj = horzcat(childrenObj, getAllChildren(this.ChildrenObj{i}));
        end % for
    end % if
end % function
