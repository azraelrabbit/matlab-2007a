function initialize(this)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    testFig = findall(0.0, 'type', 'figure', 'tag', 'RPTGEN_TEST_FIGURE');
    % 11 13
    % 12 13
    if not(isempty(testFig))
        delete(testFig);
    end % if
    % 16 17
    this.reset;
    % 18 19
    this.PreRunOpenFigures;
end % function
