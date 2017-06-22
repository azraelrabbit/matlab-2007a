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
    hBasePackage = findpackage('NetworkEngine');
    hBaseObj = hBasePackage.findclass('PmNeDropDown');
    hCreateInPackage = hBasePackage;
    % 13 15
    % 14 15
    hThisClass = schema.class(hCreateInPackage, 'DynNeDropDown', hBaseObj);
    % 16 22
    % 17 22
    % 18 22
    % 19 22
    % 20 22
    % 21 22
    m = schema.method(hThisClass, 'OnDropDownChange');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle','handle','mxArray','string'};
    s.OutputTypes = {};
    % 27 29
    % 28 29
    m = schema.method(hThisClass, 'PreDlgDisplay');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','mxArray'};
    s.OutputTypes = {'mxArray'};
end % function
