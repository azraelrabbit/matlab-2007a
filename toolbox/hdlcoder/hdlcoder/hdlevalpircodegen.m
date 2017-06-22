function output = hdlevalpircodegen(input)
    % 1 20
    % 2 20
    % 3 20
    % 4 20
    % 5 20
    % 6 20
    % 7 20
    % 8 20
    % 9 20
    % 10 20
    % 11 20
    % 12 20
    % 13 20
    % 14 20
    % 15 20
    % 16 20
    % 17 20
    % 18 20
    if ~(isfield(input, 'CodeGenFunction') && isfield(input, 'CodeGenParams'))
        error(hdlcodererrormsgid('invalidblackboxdata'), 'Internal Error: Invalid Black box data');
        % 21 23
    end
    % 23 25
    fcn = input.CodeGenFunction;
    params = input.CodeGenParams;
    % 26 36
    % 27 36
    % 28 36
    % 29 36
    % 30 36
    % 31 36
    % 32 36
    % 33 36
    % 34 36
    hDriver = hdlcurrentdriver;
    oldNetwork = hDriver.getCurrentNetwork;
    % 37 39
    if isa(params{1.0}, 'hdlcoder.HDLImplementation')
        % 39 41
        hN = params{2.0}.Owner;
    else
        if isa(params{1.0}, 'hdlcoder.component')
            hN = params{1.0}.Owner;
        else
            if isa(params{1.0}, 'double')
                p = pir;
                name = get_param(params{1.0}, 'parent');
                h = get_param(name, 'handle');
                hN = p.findNetwork('sl_handle', h);
            end
        end
    end
    hDriver.setCurrentNetwork(hN);
    hDriver.setCurrentClkBundle(hN);
    % 55 63
    % 56 63
    % 57 63
    % 58 63
    % 59 63
    % 60 63
    % 61 63
    if ~(isempty(fcn))
        output = feval(fcn, params{:});
    else
        output = [];
    end
    % 67 74
    % 68 74
    % 69 74
    % 70 74
    % 71 74
    % 72 74
    hDriver.setCurrentNetwork(oldNetwork);
    hDriver.setCurrentClkBundle(oldNetwork);
    % 75 84
    % 76 84
    % 77 84
    % 78 84
    % 79 84
    % 80 84
    % 81 84
    % 82 84
    fn = fieldnames(output);
    for ii=1.0:length(fn)
        hdlstr = output.(fn{ii});
        if isempty(hdlstr)
            hdlstr = '';
        end
        if ~(ischar(hdlstr))
            hdlstr = '';
            % 91 93
            if isa(params{1.0}, 'hdlcoder.HDLImplementation')
                warning(sprintf('Invalid string ''hdlcode.%s'' returned from ''%s::%s''', fn{ii}, class(params{1.0}), fcn));
            else
                if isa(params{1.0}, 'double')
                    warning(sprintf('Invalid string ''hdlcode.%s'' returned by M function ''%s''', fn{ii}, fcn));
                end
            end
        end
        hdlstr = regexprep(hdlstr, '\\n', char(10.0));
        output.(fn{ii}) = hdlstr;
    end % for
end
