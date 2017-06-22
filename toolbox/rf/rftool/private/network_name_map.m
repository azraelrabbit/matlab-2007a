function object = network_name_map(networktype)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    nw_names = {'Cascaded Network';'Series Connected Network';'Hybrid Connected Network';'Hybrid G Connected Network';'Parallel Connected Network'};
    % 7 9
    % 8 9
    rfckt_objects = {'rfckt.cascade';'rfckt.series';'rfckt.hybrid';'rfckt.hybridg';'rfckt.parallel'};
    % 10 12
    % 11 12
    idx = strcmp(nw_names, networktype);
    if any(idx)
        object = eval(rfckt_objects{idx});
    else
        object = [];
    end % if
    % 18 19
end % function
