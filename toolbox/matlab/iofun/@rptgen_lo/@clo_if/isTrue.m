function tf = isTrue(c)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if ~(isempty(c.ConditionalString))
        try
            evalTF = evalin('base', c.ConditionalString);
        catch
            evalTF = logical(0);
            c.status(sprintf('Could not evaluate IF expression (%s)', c.ConditionalString), 2.0);
            % 12 14
        end % try
    else
        evalTF = [];
    end
    % 17 20
    % 18 20
    if (eq(exist('evalTF', 'var'), 0.0)) | (isempty(evalTF))
        tf = logical(0);
        c.status(sprintf('IF expression "%s" did not return a value', c.ConditionalString), 2.0);
    else
        if islogical(evalTF)
            tf = evalTF(1.0);
        else
            if isnumeric(evalTF)
                tf = logical(evalTF(1.0));
            else
                tf = logical(0);
                c.status(sprintf('IF expression "%s" did not return a logical value', c.ConditionalString), 2.0);
            end
        end
    end
end
