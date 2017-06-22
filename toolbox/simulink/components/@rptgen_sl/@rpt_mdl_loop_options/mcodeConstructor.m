function mcodeConstructor(this, code)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    code.generateDefaultPropValueSyntax;
    % 10 14
    % 11 14
    % 12 14
    % 13 14
    if not(isempty(this.up))
        % 15 16
        hFunc = codegen.codefunction('Name', 'addModel', 'CodeRef', code);
        addPostConstructorFunction(code, hFunc);
        % 18 20
        % 19 20
        hArg = codegen.codeargument('Value', this.up, 'IsParameter', true);
        addArgin(hFunc, hArg);
        % 22 24
        % 23 24
        hArg = codegen.codeargument('Value', this, 'IsParameter', true);
        addArgin(hFunc, hArg);
        % 26 27
    end % if
end % function
