function lst = DialogPropertyList(cls)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    lst = MECH.DialogPropertyList;
    % 11 12
    if gt(nargin, 0.0)
        % 13 16
        % 14 16
        % 15 16
        dot = find(eq(cls, '.'));
        pkg = cls(1.0:minus(dot, 1.0));
        cls = cls(plus(dot, 1.0):end);
        pkg = findpackage(pkg);
        cls = findclass(pkg, cls);
        % 21 25
        % 22 25
        % 23 25
        % 24 25
        properties = cls.Properties;
        % 26 30
        % 27 30
        % 28 30
        % 29 30
        for i=1.0:length(properties)
            if isempty(lst.Properties)
                lst.Properties = MECH.DialogProperty(properties(i));
            else
                lst.Properties(plus(end, 1.0)) = MECH.DialogProperty(properties(i));
            end % if
        end % for
        % 37 41
        % 38 41
        % 39 41
        % 40 41
        for i=2.0:length(properties)
            lst.Properties(i).compile(lst.Properties(minus(i, 1.0)));
        end % for
    end % if
end % function
