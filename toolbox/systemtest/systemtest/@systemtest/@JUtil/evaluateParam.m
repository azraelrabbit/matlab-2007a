function [iterationCount, stringRep] = evaluateParam(expression)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    rangeExpr = char(expression);
    iterationCount = 0.0;
    stringRep = '';
    if not(isempty(rangeExpr))
        val = eval(rangeExpr);
        iterationCount = size(val, 2.0);
        % 16 17
        if ne(ndims(val), 2.0) || ne(size(val, 1.0), 1.0)
            error('Expression must evaluate to a 1xN vector')
        end % if
        % 20 21
        stringRep = workspacefunc('getshortvalue', val);
    end % if
end % function
