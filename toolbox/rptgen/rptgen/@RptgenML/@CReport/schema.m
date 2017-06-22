function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    pkg = findpackage('rptgen');
    pkgRG = findpackage('RptgenML');
    % 9 10
    h = schema.class(pkgRG, 'CReport', pkg.findclass('coutline'));
    % 11 13
    % 12 13
    p = rptgen.prop(h, 'WarnOnSaveFileName', 'String', '', '', 2.0);
    % 14 18
    % 15 18
    % 16 18
    % 17 18
    rptgen.makeStaticMethods(h, {}, {'getDisplayLabel';'copyReport'});
    % 19 35
    % 20 35
    % 21 35
    % 22 35
    % 23 35
    % 24 35
    % 25 35
    % 26 35
    % 27 35
    % 28 35
    % 29 35
    % 30 35
    % 31 35
    % 32 35
    % 33 35
    % 34 35
    m = find(h.Method, 'Name', 'getDisplayIcon');
    if not(isempty(m))
        s = m.Signature;
        s.varargin = 'off';
        s.InputTypes = {'handle'};
        s.OutputTypes = {'string'};
    end % if
end % function
