function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    pkg = findpackage('RptgenML');
    % 10 11
    clsH = schema.class(pkg, 'StylesheetAttribute', pkg.findclass('StylesheetElementID'));
    % 12 16
    % 13 16
    % 14 16
    % 15 16
    m = schema.method(clsH, 'acceptDrop');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle vector'};
    s.OutputTypes = {'bool'};
end % function
