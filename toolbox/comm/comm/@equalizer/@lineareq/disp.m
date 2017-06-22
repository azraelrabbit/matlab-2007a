function disp(eq)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    g = get(eq);
    % 9 12
    % 10 12
    first = {'EqType','AlgType','nWeights','nSampPerSym'};
    % 12 16
    % 13 16
    % 14 16
    if ~(eq.AdaptAlg.BlindMode)
        first = cellhorzcat(first{:}, 'RefTap', 'SigConst');
    else
        % 18 20
        g = rmfield(g, 'RefTap');
        first = cellhorzcat(first{:}, 'SigConst');
    end
    % 22 25
    % 23 25
    last = {'Weights','WeightInputs','ResetBeforeFiltering','NumSamplesProcessed'};
    % 25 35
    % 26 35
    % 27 35
    % 28 35
    % 29 35
    % 30 35
    % 31 35
    % 32 35
    % 33 35
    for n=1.0:length(first)
        x = first{n};
        s.(x) = g.(x);
        g = rmfield(g, x);
    end % for
    % 39 44
    % 40 44
    % 41 44
    % 42 44
    for n=1.0:length(last)
        x = last{n};
        s2.(x) = g.(x);
        g = rmfield(g, x);
    end % for
    % 48 51
    % 49 51
    names = fieldnames(g);
    for n=1.0:length(names)
        x = names{n};
        s.(x) = g.(x);
    end % for
    % 55 57
    for n=1.0:length(last)
        x = last{n};
        s.(x) = s2.(x);
    end % for
    % 60 63
    % 61 63
    disp(s)
end
