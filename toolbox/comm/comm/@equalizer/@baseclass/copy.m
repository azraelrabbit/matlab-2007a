function eq2 = copy(eq)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    alg2 = copy(eq.AdaptAlg);
    switch eq.EqType
    case 'Linear Equalizer'
        eq2 = feval(class(equalizer.lineareq), eq.nWeights, alg2, eq.SigConst, eq.nSampPerSym);
    case 'Decision Feedback Equalizer'
        eq2 = feval(class(equalizer.dfe), eq.nWeights(1.0), eq.nWeights(2.0), alg2, eq.SigConst, eq.nSampPerSym);
    otherwise
        % 16 17
        error('comm:copy:equalizer', 'Unrecognized equalizer type.')
    end % switch
    eq2.RefTap = eq.RefTap;
    eq2.Weights = eq.Weights;
    eq2.WeightInputs = eq.WeightInputs;
    eq2.ResetBeforeFiltering = eq.ResetBeforeFiltering;
    eq2.NumSamplesProcessed = eq.NumSamplesProcessed;
end % function
