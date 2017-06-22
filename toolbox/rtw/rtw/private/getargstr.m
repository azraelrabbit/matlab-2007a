function retVal = getargstr(prmStr)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    tmpVal = regexprep(prmStr, '(\[\d+\]\s*|\*)', '');
    tmpVal = regexprep(tmpVal, '\s+,', '');
    retVal = regexprep(tmpVal, '\w+\s+', '');
end % function
