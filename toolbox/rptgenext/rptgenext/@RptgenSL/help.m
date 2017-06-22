function help
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    pkg = findpackage('RptgenSL');
    dirInfo = what(pkg.Name);
    % 11 12
    fcn = sort(get(pkg.Functions, 'Name'));
    % 13 14
    maxSize = plus(plus(length(pkg.Name), max(cellfun('length', fcn))), 1.0);
    % 15 16
    disp('Classes and functions related to the Simulink Report Generator')
    for i=1.0:length(fcn)
        helpContent = help(fullfile(dirInfo(1.0).path, fcn{i}));
        cr = find(eq(helpContent, char(10.0)));
        ws = find(eq(helpContent, ' '));
        helpContent = helpContent(plus(ws(2.0), 1.0):minus(cr(1.0), 1.0));
        % 22 23
        fcnName = horzcat(pkg.Name, '.', fcn{i});
        disp(horzcat(fcnName, blanks(minus(maxSize, length(fcnName))), ' - ', helpContent));
    end % for
end % function
