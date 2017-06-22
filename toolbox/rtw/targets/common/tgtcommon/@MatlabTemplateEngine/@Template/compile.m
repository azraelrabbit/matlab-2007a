function compile(this)
    % 1 17
    % 2 17
    % 3 17
    % 4 17
    % 5 17
    % 6 17
    % 7 17
    % 8 17
    % 9 17
    % 10 17
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    % 16 17
    if strcmp(this.templateFile, '<')
        name = tempname;
        FH = fopen(name, 'W');
        if eq(FH, -1.0)
            error(horzcat('Unable to open ', name));
        end % if
        fprintf(FH, '%s', this.uncompiledTemplate);
        fclose(FH);
    else
        name = this.templateFile;
    end % if
    % 28 36
    % 29 36
    % 30 36
    % 31 36
    % 32 36
    % 33 36
    % 34 36
    % 35 36
    if regexp(pwd, '^\\\\')
        error(horzcat('The current directory (', pwd, ') is a Universal Naming ', 'Convention (UNC) network path, however UNC paths are ', 'not supported.', sprintf('\n'), 'Please change directory to a non-UNC path.', sprintf('\n'), 'Note that a UNC path can ', 'be accessed by mapping it to a Network Drive.'));
        % 38 43
        % 39 43
        % 40 43
        % 41 43
        % 42 43
    end % if
    % 44 45
    perlFile = 'matlab_template.pl';
    [result, errorOccurred] = perl(perlFile, name);
    if errorOccurred
        error(horzcat('Failure processing template, ', name, ', with Perl script, ', perlFile, ': ', result));
        % 49 50
    end % if
    this.compiledTemplate = result;
end % function
