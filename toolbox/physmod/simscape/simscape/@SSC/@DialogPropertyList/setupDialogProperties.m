function setupDialogProperties(this, properties)
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
    for i=1.0:length(properties)
        if isempty(this.Properties)
            this.Properties = SSC.DialogProperty(properties(i));
        else
            this.Properties(plus(end, 1.0)) = SSC.DialogProperty(properties(i));
        end % if
    end % for
    % 18 20
    % 19 20
    if false
        % 21 22
        if gt(nargin, 0.0)
            % 23 26
            % 24 26
            % 25 26
            dot = find(eq(cls, '.'));
            pkg = cls(1.0:minus(dot, 1.0));
            cls = cls(plus(dot, 1.0):end);
            pkg = findpackage(pkg);
            cls = findclass(pkg, cls);
            % 31 35
            % 32 35
            % 33 35
            % 34 35
            properties = cls.Properties;
            % 36 40
            % 37 40
            % 38 40
            % 39 40
            for i=1.0:length(properties)
                if isempty(this.Properties)
                    this.Properties = SSC.DialogProperty(properties(i));
                else
                    this.Properties(plus(end, 1.0)) = SSC.DialogProperty(properties(i));
                end % if
            end % for
            % 47 51
            % 48 51
            % 49 51
            % 50 51
            for i=2.0:length(properties)
                this.Properties(i).compile(this.Properties(minus(i, 1.0)));
            end % for
        end % if
    end % if
end % function
