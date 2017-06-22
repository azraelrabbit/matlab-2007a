function cplx = hdlsignalcomplex(idx)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if hdlisbeta2
        % 9 11
        % 10 11
        if isscalar(idx)
            cplx = idx.Imag;
            if isempty(cplx)
                cplx = 0.0;
            end % if
        else
            for n=1.0:length(idx)
                cplxSig = idx(n).Imag;
                if isempty(cplxSig)
                    cplx(n) = 0.0;
                else
                    cplx(n) = cplxSig;
                end % if
            end % for
        end % if
    else
        % 27 29
        % 28 29
        signalTable = hdlgetsignaltable;
        signalTable.checkSignalIndices(idx);
        cplx = signalTable.getComplex(idx);
        % 32 33
    end % if
end % function
