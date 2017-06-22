function hdlevalgenerateSLBlock(input, path)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    if ~(isfield(input, 'generateSLBlockFunction') && isfield(input, 'generateSLBlockParams'))
        % 11 13
        error(hdlcodererrormsgid('invalidblackboxdata'), 'Internal Error: Invalid Black box data');
        % 13 15
    end
    % 15 17
    fcn = input.generateSLBlockFunction;
    params = input.generateSLBlockParams;
    % 18 21
    % 19 21
    if not(isempty(fcn))
        feval(fcn, params{:}, path);
    end
end
