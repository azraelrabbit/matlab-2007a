function ct = getContextType(ad, c, excludeEmpty)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    if lt(nargin, 3.0)
        excludeEmpty = logical(0);
    end
    % 14 18
    % 15 18
    % 16 18
    classList = {'rptgen_hg.chg_obj_loop';'rptgen_hg.chg_ax_loop';'rptgen_hg.chg_fig_loop'};
    % 18 23
    % 19 23
    % 20 23
    % 21 23
    contextList = {'Object';'Axes';'Figure'};
    % 23 28
    % 24 28
    % 25 28
    % 26 28
    ct = rptgen.loopContext(classList, contextList, c, excludeEmpty);
end
