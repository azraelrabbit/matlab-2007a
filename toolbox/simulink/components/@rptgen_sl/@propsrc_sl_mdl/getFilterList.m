function fList = getFilterList(h)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    fList = vertcat(cellhorzcat('main', xlate('Main Properties')), cellhorzcat('all', xlate('All Properties')), cellhorzcat('version', xlate('Version History Properties')), cellhorzcat('fcn', xlate('Function Properties')), cellhorzcat('sim', xlate('Simulation Properties')), cellhorzcat('ext', xlate('Ext Mode')), cellhorzcat('paper', xlate('Print Properties')));
    % 9 18
    % 10 18
    % 11 18
    % 12 18
    % 13 18
    % 14 18
    % 15 18
    % 16 18
    % 17 18
    if strcmp(get_param(0.0, 'rtwlicensed'), 'on')
        fList(plus(end, 1.0):plus(end, 2.0), :) = {'rtw','Realtime Workshop Properties';'rtwsummary','Model Summary (req RTW)'};
        % 20 21
    end % if
end % function
