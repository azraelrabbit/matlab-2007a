function add(h, varargin)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    if gt(nargin, 1.0) && ischar(varargin{1.0})
        % 12 13
        childName = varargin{1.0};
        hChild = h.findchild(childName);
        if isempty(hChild)
            % 16 17
            error('uimgr:ChildNotFound', 'Child "%s" not found.', childName);
        end % if
        % 19 20
        hChild.add(varargin{2.0:end});
    else
        % 22 25
        % 23 25
        % 24 25
        parentClass = class(h);
        % 26 27
        for i=1.0:numel(varargin)
            theChild = varargin{i};
            % 29 31
            % 30 31
            if isDuplicateName(h, theChild)
                error('uimgr:uigroup:DuplicateChildName', 'Cannot add child to group; duplicate name "%s" specified.', theChild.Name);
                % 33 34
            end % if
            % 35 36
            if not(compatibleParent(theChild, parentClass))
                error('uimgr:uigroup:IncompatibleChild', 'Cannot add incompatible child "%s" of class "%s" to parent "%s" of class "%s"', theChild.Name, class(theChild), h.Name, parentClass);
                % 38 40
                % 39 40
            end % if
            % 41 49
            % 42 49
            % 43 49
            % 44 49
            % 45 49
            % 46 49
            % 47 49
            % 48 49
            if theChild.AutoPlacement
                theChild.ActualPlacement = getDefaultPlacement(h);
            end % if
            % 52 54
            % 53 54
            connect(h, theChild, 'down');
            % 55 59
            % 56 59
            % 57 59
            % 58 59
            addPost(h, theChild, i);
        end % for
    end % if
end % function
