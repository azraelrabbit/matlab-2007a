function schema
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    schema.package('dfilt');
    % 10 12
    findpackage('sigdatatypes');
    % 12 16
    % 13 16
    % 14 16
    if isempty(findtype('DFILTCoefficientVector'))
        schema.UserType('DFILTCoefficientVector', 'MATLAB array', @checkCoefficientVector);
        % 17 19
    end
    % 19 23
    % 20 23
    % 21 23
    if isempty(findtype('DFILTNonemptyVector'))
        schema.UserType('DFILTNonemptyVector', 'DFILTCoefficientVector', @checkNonemptyVector);
        % 24 26
    end
    % 26 29
    % 27 29
    if isempty(findtype('DFILTScalar'))
        schema.UserType('DFILTScalar', 'MATLAB array', @checkScalar);
        % 30 32
    end
end
function checkCoefficientVector(coeffs)
    % 34 38
    % 35 38
    % 36 38
    if ~(isnumeric(coeffs))
        error('Coefficients must be numeric.');
    end
    if ~(issigvector(coeffs))
        error('Coefficients must be entered in a vector.');
    end
    if issparse(coeffs)
        error('Coefficients cannot be a sparse matrix.');
    end
end
function checkNonemptyVector(coeffs)
    % 48 53
    % 49 53
    % 50 53
    % 51 53
    if isempty(coeffs)
        error('Coefficients must be nonempty.');
    end
    % 55 58
    % 56 58
    if ~(all(isfinite(coeffs)))
        error('Coefficients must be finite.');
    end
end
function checkScalar(x)
    % 62 65
    % 63 65
    if ~(isnumeric(x))
        error('Must be numeric.');
    end
    if (~(isscalar(x))) | (isempty(x))
        error('Must be nonempty scalar.');
    end
    if issparse(x)
        error('Cannot be a sparse matrix.');
    end
end
function t = issigvector(v)
    % 75 80
    % 76 80
    % 77 80
    % 78 80
    t = and(eq(ndims(v), 2.0), le(min(size(v)), 1.0));
end
function t = isscalar(v)
    % 82 87
    % 83 87
    % 84 87
    % 85 87
    t = and(eq(ndims(v), 2.0), le(prod(size(v)), 1.0));
end
