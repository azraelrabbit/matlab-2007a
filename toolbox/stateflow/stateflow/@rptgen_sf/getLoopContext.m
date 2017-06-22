function ctxt = getLoopContext(c)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    classList = {'rptgen_sf.csf_obj_loop';'rptgen_sf.csf_state_loop';'rptgen_sf.csf_chart_loop';'rptgen_sf.csf_machine_loop'};
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    % 13 14
    contextList = {'Object';'State';'Chart';'Machine'};
    % 15 21
    % 16 21
    % 17 21
    % 18 21
    % 19 21
    % 20 21
    ctxt = rptgen.loopContext(classList, contextList, c);
end % function
