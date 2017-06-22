function modeout = hdlcodegenmode(modein)
    % 1 19
    % 2 19
    % 3 19
    % 4 19
    % 5 19
    % 6 19
    % 7 19
    % 8 19
    % 9 19
    % 10 19
    % 11 19
    % 12 19
    % 13 19
    % 14 19
    % 15 19
    % 16 19
    % 17 19
    persistent modecache;
    % 19 21
    if eq(nargin, 1.0)
        % 21 23
        switch modein
        case 'filtercoder'
            modecache = modein;
        case 'slcoder'
            % 26 29
            % 27 29
            hdriver = hdlcurrentdriver;
            codegenmethod = hdriver.coderParameters.code_gen_method;
            % 30 32
            if strcmp(codegenmethod, 'beta1')
                modecache = 'slcoder_beta1';
            else
                modecache = 'slcoder_beta2';
            end
        case 'slcoder_beta1'
            % 37 39
            modecache = modein;
        case 'slcoder_beta2'
            % 40 42
            modecache = modein;
        case 'reset'
            % 43 45
            modecache = [];
        otherwise
            % 46 48
            error(hdlerrormsgid('unknownmode'), 'Unknown HDL code gen mode');
            % 48 51
            % 49 51
        end
    else
        % 52 56
        % 53 56
        % 54 56
        if isempty(modecache)
            modecache = 'filtercoder';
        end
    end
    % 59 61
    modeout = modecache;
end
