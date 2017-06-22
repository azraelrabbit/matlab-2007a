function n = getName(this)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    if isempty(this.OldComponent)
        n = xlate('Version 1.x Component Adapter');
    else
        i = getinfo(this);
        n = i.Name;
    end % if
end % function
