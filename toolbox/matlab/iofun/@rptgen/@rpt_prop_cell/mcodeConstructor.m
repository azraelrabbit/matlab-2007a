function mcodeConstructor(this, code)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    if not(isempty(this.up))
        % 7 8
        if this.TitleMode
            % 9 11
            % 10 11
            code.addProperty('TitleMode');
            code.ignoreProperty('Align');
            code.ignoreProperty('BorderLower');
            code.ignoreProperty('BorderRight');
            code.ignoreProperty('RowSpan');
            code.ignoreProperty('ColSpan');
            % 17 21
            % 18 21
            % 19 21
            % 20 21
            hFunc = codegen.codefunction('Name', 'set', 'CodeRef', code);
            addPostConstructorFunction(code, hFunc);
            % 23 25
            % 24 25
            hArg = codegen.codeargument('Value', this.up, 'IsParameter', true);
            addArgin(hFunc, hArg);
            % 27 29
            % 28 29
            hArg = codegen.codeargument('Value', 'TableTitle');
            addArgin(hFunc, hArg);
            % 31 33
            % 32 33
            hArg = codegen.codeargument('Value', this, 'IsParameter', true);
            addArgin(hFunc, hArg);
        else
            % 36 37
            hFunc = codegen.codefunction('Name', 'addCell', 'CodeRef', code);
            addPostConstructorFunction(code, hFunc);
            % 39 40
            hArg = codegen.codeargument('Value', this.up, 'IsParameter', true);
            addArgin(hFunc, hArg);
            % 42 43
            hArg = codegen.codeargument('Value', this, 'IsParameter', true);
            addArgin(hFunc, hArg);
            % 45 46
            if not(isempty(this.SpanOrigin)) && ishandle(this.SpanOrigin)
                % 47 59
                % 48 59
                % 49 59
                % 50 59
                % 51 59
                % 52 59
                % 53 59
                % 54 59
                % 55 59
                % 56 59
                % 57 59
                % 58 59
                hArg = codegen.codeargument('Value', this.SpanOrigin, 'IsParameter', true);
                addArgin(hFunc, hArg);
                % 61 75
                % 62 75
                % 63 75
                % 64 75
                % 65 75
                % 66 75
                % 67 75
                % 68 75
                % 69 75
                % 70 75
                % 71 75
                % 72 75
                % 73 75
                % 74 75
            end % if
            % 76 80
            % 77 80
            % 78 80
            % 79 80
        end % if
    end % if
    % 82 84
    % 83 84
    code.generateDefaultPropValueSyntax;
end % function
