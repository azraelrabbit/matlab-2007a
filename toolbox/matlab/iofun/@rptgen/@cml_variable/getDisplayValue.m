function [dValue, dName] = getDisplayValue(h, dName)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    switch h.source
    case 'W'
        try
            dValue = evalin('base', dName);
        catch
            error(sprintf('"%s" not found in workspace.', dName));
        end % try
    case 'M'
        fileName = rptgen.findFile(rptgen.parseExpressionText(h.filename), logical(1), 'mat');
        mymat = load(fileName, '-mat');
        if isfield(mymat, dName)
            dValue = mymat.(dName);
        else
            error(sprintf('"%s" not found in MAT file "%s"', dName, fileName));
        end
    case 'G'
        if ~(isempty(whos('global', dName)))
            feval('global', dName);
            dValue = eval(dName);
        else
            error(sprintf('"%s" not global.', dName));
        end
    case 'direct'
        dValue = h.SourceDirect;
    otherwise
        error('Invalid value for "Source" property');
    end
end
