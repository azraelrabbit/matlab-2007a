function text = exec(this, varargin)
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
    if ~(strcmp(this.templateFile, '<'))
        templateDir = dir(this.templateFile);
        if (~(strcmp(templateDir.date, this.dateStamp))) | (isempty(this.compiledTemplate))
            % 34 36
            this.compile;
            % 36 38
            templateDir = dir(this.templateFile);
            this.dateStamp = templateDir.date;
        end
        % 40 42
    end
    text = texteval(this.compiledTemplate, varargin);
end
function OUTPUT_TEXT = texteval(TEMPLATE_TEXT, TEMPLATE_ARGS)
    % 45 52
    % 46 52
    % 47 52
    % 48 52
    % 49 52
    % 50 52
    try
        eval(TEMPLATE_TEXT);
    catch
        rethrow(lasterror);
    end % try
end
