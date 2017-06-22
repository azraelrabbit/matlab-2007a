function mcodeConstructor(this, code)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    if not(this.Active)
        code.addProperty('Active');
    end
    % 10 12
    code.generateDefaultPropValueSyntax;
    % 12 14
    if isa(this.up, 'rptgen.summsrc')
        % 14 16
        summTable = this.up.up;
        if isa(summTable, 'rptgen.rptsummtable')
            % 17 22
            % 18 22
            % 19 22
            % 20 22
            hFunc = codegen.codefunction('Name', 'set', 'CodeRef', code);
            addPostConstructorFunction(code, hFunc);
            % 23 25
            hArg = codegen.codeargument('Value', summTable, 'IsParameter', true);
            addArgin(hFunc, hArg);
            % 26 29
            % 27 29
            hArg = codegen.codeargument('Value', 'LoopComp');
            addArgin(hFunc, hArg);
            % 30 32
            hArg = codegen.codeargument('Value', this, 'IsParameter', true);
            addArgin(hFunc, hArg);
        end
    else
        if not(isempty(this.up))
            hFunc = codegen.codefunction('Name', 'setParent', 'CodeRef', code);
            addPostConstructorFunction(code, hFunc);
            % 38 41
            % 39 41
            hArg = codegen.codeargument('Value', this, 'IsParameter', true);
            addArgin(hFunc, hArg);
            % 42 45
            % 43 45
            hArg = codegen.codeargument('Value', this.up, 'IsParameter', true);
            addArgin(hFunc, hArg);
            % 46 48
        end
    end
end
