function defn = csc_getref(which_defn, owner_package, defn_name)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    warnmsg = 'The %s ''%s'' can not be referenced because referencing of CSCDefn and MemorySectionDefn has been obsoleted.';
    % 10 13
    % 11 13
    % 12 13
    warning(sprintf(warnmsg, which_defn, defn_name));
    % 14 15
    defn = [];
end % function
