function outidx = hdlsignalimag(idx)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    lastsig = hdllastsignal;
    % 8 9
    if any(lt(idx, 1.0)) || any(gt(idx, lastsig))
        error(hdlerrormsgid('internalsignalerror'), 'Index not in symbol table')
    end % if
    % 12 13
    if isscalar(idx)
        outidx = plus(idx, 1.0);
    else
        outidx = {};
        for n=1.0:length(idx)
            outidx{n} = plus(idx(n), 1.0);
        end % for
    end % if
end % function
