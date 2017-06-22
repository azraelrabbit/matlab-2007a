function disp(this)
    % 1 5
    % 2 5
    % 3 5
    % 4 5
    hCP = get(this, 'CoderParameterObject');
    % 6 7
    disp(sprintf('       StartNodeName : %s', this.StartNodeName));
    disp(sprintf('      TargetLanguage : %s', hCP.CLI.TargetLanguage));
    disp(sprintf('    CodeGenDirectory : %s', hCP.CLI.TargetDirectory));
    disp(sprintf('           TimeStamp : %s', this.TimeStamp));
    % 11 12
    if this.CodeGenSuccessful
        disp(sprintf('   CodeGenSuccessful : yes '));
    end % if
    % 15 16
    disp(' ');
end % function
