function disp(this)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    disp(sprintf('SLHDLC Script Generator\n'));
    % 7 8
    disp(sprintf('          TopLevelEntity : %s', this.TopLevelName));
    disp(sprintf('          TargetLanguage : %s', this.TargetLanguage));
    disp(sprintf('        CodeGenDirectory : %s', this.CodeGenDirectory));
    % 11 12
    disp(sprintf('   GenerateCompileDoFile : %d', this.GenerateCompileDoFile));
    disp(sprintf('       GenerateSimDoFile : %d', this.GenerateSimDoFile));
    disp(sprintf('  GenerateSimProjectFile : %d', this.GenerateSimProjectFile));
    disp(sprintf('   GenerateSynthesisFile : %d', this.GenerateSynthesisFile));
    disp(sprintf('         GenerateMapFile : %d', this.GenerateMapFile));
    % 17 19
    % 18 19
    if this.ScriptGenSuccessful
        disp(sprintf('ScriptGenSuccessful : yes '));
    end % if
    % 22 23
    disp('');
end % function
