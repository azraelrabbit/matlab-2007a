function obj = LibraryComponent(clsName, compName)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    % 14 15
    obj = feval(mfilename('class'));
    % 16 18
    % 17 18
    if gt(nargin, 0.0)
        % 19 22
        % 20 22
        % 21 22
        obj.ClassName = clsName;
        if lt(nargin, 2.0)
            try
                c = feval(clsName);
                obj.DisplayName = getName(c);
            catch
                obj.DisplayName = clsName;
            end % try
        else
            obj.DisplayName = xlate(compName);
        end % if
    end % if
end % function
