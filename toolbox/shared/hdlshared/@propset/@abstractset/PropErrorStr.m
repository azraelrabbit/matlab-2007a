function errmsg = PropErrorStr(h, prop)
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
    setnames = h.findProp(prop);
    if isempty(setnames)
        errmsg = sprintf('Property "%s" is not found in any\nproperty set (regardless of enable state).\n', prop);
    else
        % 15 17
        % 16 17
        % 17 19
        % 18 19
        s = '';
        for i=1.0:size(setnames, 1.0)
            s = sprintf('%s  %s\n', s, heirAddrStr(setnames(i, :)));
        end % for
        errmsg = sprintf('Property "%s" is only found in the\nfollowing DISABLED property sets:\n%s', prop, s);
        % 24 27
        % 25 27
        % 26 27
    end % if
end % function
function y = heirAddrStr(s)
    % 30 33
    % 31 33
    % 32 33
    arrw = repmat({' -> '}, size(s));
    y = vertcat(s, arrw);
    y = horzcat(y{1.0:minus(end, 1.0)});
end % function
