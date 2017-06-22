function sizes = hdlsignalsizes(idx)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    if hdlisbeta2
        % 10 12
        % 11 12
        if isscalar(idx)
            [sltype, sldtprops] = getslsignaltype(idx.Type);
            [size, bp, signed] = hdlwordsize(sltype.native);
            sizes = horzcat(size, bp, signed);
        else
            numSigs = length(idx);
            sizes = zeros(numSigs, 3.0);
            for n=1.0:numSigs
                [sltype, sldtprops] = getslsignaltype(idx(n).Type);
                [size, bp, signed] = hdlwordsize(sltype.native);
                sizes(n, :) = horzcat(size, bp, signed);
            end % for
        end % if
    else
        % 26 28
        % 27 28
        signalTable = hdlgetsignaltable;
        signalTable.checkSignalIndices(idx);
        sizes = signalTable.getSizes(idx);
        % 31 32
    end % if
end % function
