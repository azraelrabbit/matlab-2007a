function rptRoot = findRpt(c)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    rptRoot = c;
    while not(isempty(rptRoot)) && not(isa(rptRoot, 'RptgenML.CReport'))
        rptRoot = rptRoot.getParent;
    end % while
end % function
