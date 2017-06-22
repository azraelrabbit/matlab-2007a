function value = GetTokenValue(buildInfo, key, varargin)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    if eq(nargin, 3.0)
        field = varargin{1.0};
    else
        field = 'Tokens';
    end
    toks = get(buildInfo.(field), 'Key');
    tokVals = get(buildInfo.(field), 'Value');
    if isempty(toks)
        toks = {};
        tokVals = {};
    end
    if ~(iscell(toks))
        toks = cellhorzcat(toks);
        tokVals = cellhorzcat(tokVals);
    end
    tokIdx = find(eq(strcmp(toks, key), 1.0));
    if isempty(tokIdx)
        value = [];
    else
        value = tokVals{tokIdx};
    end
end
