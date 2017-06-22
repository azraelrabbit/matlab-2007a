function dest = simUtil_addBlock(sys, src, name, props, iportcon, outportcon, location)
    % 1 26
    % 2 26
    % 3 26
    % 4 26
    % 5 26
    % 6 26
    % 7 26
    % 8 26
    % 9 26
    % 10 26
    % 11 26
    % 12 26
    % 13 26
    % 14 26
    % 15 26
    % 16 26
    % 17 26
    % 18 26
    % 19 26
    % 20 26
    % 21 26
    % 22 26
    % 23 26
    % 24 26
    % 25 26
    dest = horzcat(sys, '/', name);
    add_block(src, dest);
    simUtil_setPosition(dest, location);
    % 29 30
    if not(isempty(props))
        set_param(dest, props{:});
    end % if
    % 33 34
    for i=1.0:size(iportcon, 1.0)
        srcPort = horzcat(iportcon{i, 1.0}, '/', int2str(iportcon{i, 2.0}));
        destPort = horzcat(name, '/', int2str(iportcon{i, 3.0}));
        add_line(sys, srcPort, destPort, 'autorouting', 'on');
    end % for
    % 39 40
    for i=1.0:size(outportcon, 1.0)
        srcPort = horzcat(name, '/', int2str(outportcon{i, 3.0}));
        destPort = horzcat(outportcon{i, 1.0}, '/', int2str(outportcon{i, 2.0}));
        add_line(sys, srcPort, destPort, 'autorouting', 'on');
    end % for
end % function
