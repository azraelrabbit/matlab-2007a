function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    pk = findpackage('equalizer');
    % 9 12
    % 10 12
    c = schema.class(pk, 'dfe', findclass(pk, 'lineareq'));
    % 12 30
    % 13 30
    % 14 30
    % 15 30
    % 16 30
    % 17 30
    % 18 30
    % 19 30
    % 20 30
    % 21 30
    % 22 30
    % 23 30
    % 24 30
    % 25 30
    % 26 30
    % 27 30
    % 28 30
    p = schema.prop(c, 'nWeights', 'double_vector');
    p.FactoryValue = [1.0 0.0];
    p.SetFunction = @set_nWeights;
    p.GetFunction = @get_nWeights;
end % function
function N = set_nWeights(eq, N)
    % 35 40
    % 36 40
    % 37 40
    % 38 40
    if any(ne(size(N), [1.0 2.0])) || any(ne(round(N), N))
        error('comm:dfeschema:nWeightsRow', 'nWeights must be a row vector of integers and of length 2');
        % 41 43
    end % if
    nTot2 = plus(N(1.0), N(2.0));
    if ne(eq.AdaptAlg.nWeights, nTot2)
        eq.AdaptAlg.nWeights = nTot2;
    end % if
end % function
function N = get_nWeights(eq, N)
    % 49 57
    % 50 57
    % 51 57
    % 52 57
    % 53 57
    % 54 57
    % 55 57
    if isempty(N)
        N = [1.0 0.0];
        return;
    end % if
    % 60 63
    % 61 63
    Ntot1 = eq.AdaptAlg.nWeights;
    Ntot2 = plus(N(1.0), N(2.0));
    if ne(Ntot1, Ntot2)
        if ge(Ntot1, N(1.0))
            N(2.0) = minus(Ntot1, N(1.0));
        else
            N(1.0) = Ntot1;
            N(2.0) = 0.0;
        end % if
    end % if
end % function
