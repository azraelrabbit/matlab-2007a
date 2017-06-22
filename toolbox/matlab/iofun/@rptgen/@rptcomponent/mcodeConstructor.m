function mcodeConstructor(this, code)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    if not(this.Active)
        code.addProperty('Active');
    end % if
    % 9 12
    % 10 12
    % 11 12
    if not(isempty(this.up))
        % 13 14
        hFunc = codegen.codefunction('Name', 'setParent', 'CodeRef', code);
        addPostConstructorFunction(code, hFunc);
        % 16 18
        % 17 18
        hArg = codegen.codeargument('Value', this, 'IsParameter', true);
        addArgin(hFunc, hArg);
        % 20 22
        % 21 22
        hArg = codegen.codeargument('Value', this.up, 'IsParameter', true);
        addArgin(hFunc, hArg);
    end % if
    % 25 26
    code.generateDefaultPropValueSyntax;
end % function
