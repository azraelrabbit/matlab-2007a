function createvaluefromcell(hPrm)
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
    valid = get(hPrm, 'AllOptions');
    typename = getuniquetype(hPrm, valid);
    % 13 14
    schema.prop(hPrm, 'Value', typename);
end % function
