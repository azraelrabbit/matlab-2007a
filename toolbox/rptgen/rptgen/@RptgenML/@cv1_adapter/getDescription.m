function d = getDescription(this)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    if isempty(this.OldComponent)
        d = xlate('Provides a wrapper for version 1.x Report Generator components');
    else
        i = getinfo(this);
        d = i.Desc;
    end % if
end % function
