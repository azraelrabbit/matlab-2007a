function schema
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    hCreateInPackage = findpackage('PMDialogs');
    % 11 13
    % 12 13
    hThisClass = schema.class(hCreateInPackage, 'DynCreateInstance');
    % 14 18
    % 15 18
    % 16 18
    % 17 18
    m = schema.method(hThisClass, 'invoke');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string','handle'};
    s.OutputTypes = {'handle'};
end % function
