function h = Template(templateFile, uncompiledTemplate)
    % 1 32
    % 2 32
    % 3 32
    % 4 32
    % 5 32
    % 6 32
    % 7 32
    % 8 32
    % 9 32
    % 10 32
    % 11 32
    % 12 32
    % 13 32
    % 14 32
    % 15 32
    % 16 32
    % 17 32
    % 18 32
    % 19 32
    % 20 32
    % 21 32
    % 22 32
    % 23 32
    % 24 32
    % 25 32
    % 26 32
    % 27 32
    % 28 32
    % 29 32
    % 30 32
    persistent templates;
    % 32 35
    % 33 35
    persistent templatehash;
    persistent templatearray;
    % 36 38
    if isempty(templatehash)
        templatehash = java.util.Hashtable;
    end
    % 40 42
    if eq(nargin, 2.0)
        % 42 45
        % 43 45
        if not(strcmp(templateFile, '<'))
            usage;
        end
        i = templatehash.get(uncompiledTemplate);
        if not(isempty(i))
            % 49 51
            h = templatearray(i);
        else
            h = MatlabTemplateEngine.Template;
            h.templateFile = '<';
            h.uncompiledTemplate = uncompiledTemplate;
            h.compile;
            templatearray = horzcat(templatearray, h);
            templatehash.put(uncompiledTemplate, length(templatearray));
        end
    else
        % 60 62
        if ne(nargin, 1.0)
            usage;
        end
        % 64 68
        % 65 68
        % 66 68
        template = [];
        if not(isempty(templates))
            template = templates(strcmp(cellhorzcat(templates.Name), templateFile));
        end
        % 71 73
        if isempty(template)
            % 73 76
            % 74 76
            template = [];
            h = MatlabTemplateEngine.Template;
            template.Name = templateFile;
            template.Object = h;
            templates = horzcat(templates, template);
            h.compiledTemplate = '';
        end
        % 82 84
        h = template.Object;
        % 84 88
        % 85 88
        % 86 88
        fullTemplateFile = which(templateFile);
        if isempty(fullTemplateFile)
            error(horzcat(templateFile, ' could not be found '));
        end
        h.templateFile = fullTemplateFile;
        % 92 94
    end
end
function usage
    % 96 98
    message = sprintf('Correct usage is\n\tMatlabTemplateEngine.Template(<templateFileName>)\nor\tMatlabTemplateEngine.Template(''<'',<templateText>)');
    % 98 103
    % 99 103
    % 100 103
    % 101 103
    error(message);
end
