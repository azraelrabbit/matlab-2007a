function lines = simUtil_addLines(sys, outblocks, outports, inblocks, inports)
    % 1 21
    % 2 21
    % 3 21
    % 4 21
    % 5 21
    % 6 21
    % 7 21
    % 8 21
    % 9 21
    % 10 21
    % 11 21
    % 12 21
    % 13 21
    % 14 21
    % 15 21
    % 16 21
    % 17 21
    % 18 21
    % 19 21
    % 20 21
    for i=1.0:length(outblocks)
        outport = horzcat(outblocks{i}, '/', int2str(outports(i)));
        inport = horzcat(inblocks{i}, '/', int2str(inports(i)));
        add_line(sys, outport, inport, 'autorouting', 'on')
    end % for
end % function
