function uniquename = hdluniqueentityname(nodename)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    nodename = hdllegalname(nodename);
    uniq = 1.0;
    uniq_limit = 100000.0;
    uname = nodename;
    while eq(hdlentitynameexists(uname), 1.0) && lt(uniq, uniq_limit)
        uname = sprintf('%s%s%d', nodename, hdlgetparameter('entity_conflict_postfix'), uniq);
        uniq = plus(uniq, 1.0);
    end % while
    if eq(uniq, uniq_limit)
        error(hdlerrormsgid('entitynameerror'), 'Too many subsystems with the same entity name %s.', nodename);
        % 18 19
    end % if
    uniquename = hdllegalnamersvd(uname);
end % function
