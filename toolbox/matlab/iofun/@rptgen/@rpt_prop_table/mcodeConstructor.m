function mcodeConstructor(this, code)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if not(this.Active)
        code.addProperty('Active');
    end % if
    % 10 13
    % 11 13
    % 12 13
    code.ignoreProperty('TableTitle');
    code.ignoreProperty('TableContent');
    % 15 16
    if isa(this.up, 'rptgen.rptcomponent')
        % 17 18
        hFunc = codegen.codefunction('Name', 'setParent', 'CodeRef', code);
        addPostConstructorFunction(code, hFunc);
        % 20 22
        % 21 22
        hArg = codegen.codeargument('Value', this, 'IsParameter', true);
        addArgin(hFunc, hArg);
        % 24 26
        % 25 26
        hArg = codegen.codeargument('Value', this.up, 'IsParameter', true);
        addArgin(hFunc, hArg);
        % 28 29
    end % if
    % 30 38
    % 31 38
    % 32 38
    % 33 38
    % 34 38
    % 35 38
    % 36 38
    % 37 38
    code.generateDefaultPropValueSyntax;
end % function
