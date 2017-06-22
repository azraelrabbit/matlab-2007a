function mcodeConstructor(this, code)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    code.generateDefaultPropValueSyntax;
    % 8 9
    if not(isempty(this.up))
        % 10 11
        hFunc = codegen.codefunction('Name', 'setParent', 'CodeRef', code);
        addPostConstructorFunction(code, hFunc);
        % 13 15
        % 14 15
        hArg = codegen.codeargument('Value', this, 'IsParameter', true);
        addArgin(hFunc, hArg);
        % 17 19
        % 18 19
        hArg = codegen.codeargument('Value', this.up, 'IsParameter', true);
        addArgin(hFunc, hArg);
        % 21 22
    end % if
end % function
