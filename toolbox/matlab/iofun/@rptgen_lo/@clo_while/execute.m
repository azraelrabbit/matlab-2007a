function out = execute(c, d, varargin)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    if isempty(c.down)
        c.status('WHILE loop has no children and will not be run', 2.0);
        out = '';
        return;
    end % if
    % 15 16
    if not(isempty(c.EvalInitString))
        try
            evalin('base', c.EvalInitString);
        catch
            c.status(sprintf('Could not evaluate initialization string "%s".', c.EvalInitString), 2.0);
            out = '';
            return;
        end % try
    else
        c.status(sprintf('Initialization string is empty.'), 2.0);
        out = '';
        return;
    end % if
    % 29 30
    out = createDocumentFragment(get(rptgen.appdata_rg, 'CurrentDocument'));
    numLoops = 1.0;
        while c.isTrue(numLoops)
        c.status(sprintf('Running while(%s) iteration #%i', c.ConditionalString, numLoops), 3.0);
        % 34 35
        c.runChildren(d, out);
        numLoops = plus(numLoops, 1.0);
    end % while
end % function
