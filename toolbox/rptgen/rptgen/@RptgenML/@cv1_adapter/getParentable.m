function p = getParentable(this)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    i = getinfo(this);
    % 10 11
    p = or(isempty(i.ValidChildren), not(i.ValidChildren{1.0}));
end % function
