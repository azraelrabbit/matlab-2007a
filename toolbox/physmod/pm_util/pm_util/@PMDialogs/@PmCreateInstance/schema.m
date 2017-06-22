function schema
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    hCreateInPackage = findpackage('PMDialogs');
    % 12 14
    % 13 14
    hThisClass = schema.class(hCreateInPackage, 'PmCreateInstance');
    % 15 19
    % 16 19
    % 17 19
    % 18 19
    m = schema.method(hThisClass, 'invoke');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string','handle'};
    s.OutputTypes = {'handle'};
end % function
