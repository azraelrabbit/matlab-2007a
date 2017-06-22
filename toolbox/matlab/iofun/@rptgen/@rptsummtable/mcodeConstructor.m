function mcodeConstructor(this, code)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if not(this.Active)
        code.addProperty('Active');
    end % if
    % 11 14
    % 12 14
    % 13 14
    code.addProperty('Properties');
    code.addProperty('Anchor');
    code.addProperty('ColumnWidths');
    % 17 18
    code.ignoreProperty('LoopComp');
    % 19 20
    code.generateDefaultPropValueSyntax;
    % 21 22
    if not(isempty(this.up))
        % 23 24
        hFunc = codegen.codefunction('Name', 'setParent', 'CodeRef', code);
        addPostConstructorFunction(code, hFunc);
        % 26 28
        % 27 28
        hArg = codegen.codeargument('Value', this, 'IsParameter', true);
        addArgin(hFunc, hArg);
        % 30 32
        % 31 32
        hArg = codegen.codeargument('Value', this.up, 'IsParameter', true);
        addArgin(hFunc, hArg);
        % 34 35
    end % if
end % function
