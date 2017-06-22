function output = hdlevalestimate(input)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    if ~(isfield(input, 'EstimateFunction') && isfield(input, 'EstimateParams'))
        error(hdlcodererrormsgid('invalidblackboxdata'), 'Internal Error: Invalid Black box data');
        % 12 14
    end
    % 14 16
    fcn = input.EstimateFunction;
    params = input.EstimateParams;
    % 17 20
    % 18 20
    if not(isempty(fcn))
        output = feval(fcn, params{:});
    else
        output = [];
    end
end
