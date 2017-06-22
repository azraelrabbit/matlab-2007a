function mcodeConstructor(this, code)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    code.setConstructorName('RptgenML.CReport');
    code.generateDefaultPropValueSyntax;
    code.ignoreProperty('Output');
    % 10 17
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    % 16 17
    hLaunch = codegen.codefunction('Name', '% setedit', 'CodeRef', code);
    addPostConstructorFunction(code, hLaunch);
    % 19 21
    % 20 21
    hArg = codegen.codeargument('Value', this, 'IsParameter', true);
    addArgin(hLaunch, hArg);
end % function
