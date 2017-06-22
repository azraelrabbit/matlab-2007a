function [InitialFlux_pu, Tolerances, HT, UpperFlux, LowerFlux, Current] = inithysteresis(matfile, fluxbase, currentbase, InitialFlux)
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
    HT = [];
    eval(horzcat('load ', matfile));
    % 13 14
    InitialFlux_pu = InitialFlux;
    Tolerances = horzcat(mrdivide(mtimes(HT.Fs, HT.Tolerances(1.0)), 100.0), mrdivide(mtimes(HT.Ic, HT.Tolerances(2.0)), 100.0));
    UpperFlux = horzcat(uminus(HT.Fj_sat(end:-1.0:2.0)), ctranspose(HT.Y_d), HT.Fj_sat(2.0:end));
    LowerFlux = horzcat(uminus(HT.Fj_sat(end:-1.0:2.0)), ctranspose(HT.Y_a), HT.Fj_sat(2.0:end));
    Current = horzcat(uminus(HT.Ij_sat(end:-1.0:2.0)), ctranspose(HT.X_i), HT.Ij_sat(2.0:end));
    % 19 20
    if eq(HT.UnitsPopup, 1.0)
        % 21 22
        UpperFlux = mtimes(UpperFlux, fluxbase);
        LowerFlux = mtimes(LowerFlux, fluxbase);
        Current = mtimes(Current, currentbase);
        % 25 27
        % 26 27
        if not(exist('InitialFlux', 'var'))
            % 28 30
            % 29 30
            block = gcb;
            ResolvedLink = strcmp(get_param(block, 'linkstatus'), 'resolved');
            if not(ResolvedLink)
                % 33 35
                % 34 35
                warndlg(horzcat('The library link for the Transformer block named ''', strrep(block, char(10.0), ' '), ''' apears to be broken. Please restore the link for this block otherwise the model may not work properly.'));
            end % if
            InitialFlux = 0.0;
        end % if
        InitialFlux_pu = mrdivide(InitialFlux, fluxbase);
    end % if
end % function
