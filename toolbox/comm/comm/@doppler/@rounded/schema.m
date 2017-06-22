function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    pk = findpackage('doppler');
    % 9 12
    % 10 12
    c = schema.class(pk, 'rounded', findclass(pk, 'baseclass'));
    % 12 21
    % 13 21
    % 14 21
    % 15 21
    % 16 21
    % 17 21
    % 18 21
    % 19 21
    p = schema.prop(c, 'CoeffRounded', 'double_vector');
    p.FactoryValue = [1.0 -1.72 .785];
    p.Description = 'Polynomial coefficients';
    p.SetFunction = @setCoeffRounded;
end % function
function coeffRounded = setCoeffRounded(h, coeffRounded)
    % 26 30
    % 27 30
    % 28 30
    [nrows, ncolumns] = size(coeffRounded);
    if ne(nrows, 1.0) || ne(ncolumns, 3.0) || not(isnumeric(coeffRounded)) || not(isreal(coeffRounded)) || any(isnan(coeffRounded)) || any(isinf(coeffRounded))
        % 31 34
        % 32 34
        error(horzcat(getErrorId(h), ':InvalidCoeffRounded'), 'CoeffRounded must be a row vector of 3 finite real numbers.');
        % 34 36
    end % if
end % function
