function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('mfilt');
    c = schema.class(pk, 'firfracdecim', pk.findclass('abstractfirfrac'));
    % 10 12
    % 11 12
    p = schema.prop(c, 'PolyphaseAccum', 'mxArray');
    p.FactoryValue = [];
    p.SetFunction = @set_polyphaseaccum;
    p.AccessFlags.AbortSet = 'off';
    % 16 18
    % 17 18
    p = schema.prop(c, 'outBufIdx', 'spt_uint32');
    p.FactoryValue = 1.0;
    p.AccessFlags.PublicGet = 'Off';
    p.AccessFlags.PublicSet = 'Off';
    % 22 24
    % 23 24
    p = schema.prop(c, 'inBufIdx', 'mxArray');
    p.AccessFlags.PublicGet = 'Off';
    p.AccessFlags.PublicSet = 'Off';
    % 27 29
    % 28 29
    p = schema.prop(c, 'inBufWIdx', 'spt_uint32');
    p.AccessFlags.PublicGet = 'Off';
    p.AccessFlags.PublicSet = 'Off';
end % function
function S = set_polyphaseaccum(Hm, S)
    % 34 41
    % 35 41
    % 36 41
    % 37 41
    % 38 41
    % 39 41
    % 40 41
    error(nargchk(2.0, 2.0, nargin));
    % 42 43
    if not(isnumeric(S))
        error('PolyphaseAccum must be numeric.');
    end % if
    if issparse(S)
        error('PolyphaseAccum cannot be a sparse matrix.');
    end % if
    % 49 51
    % 50 51
    R = Hm.RateChangeFactors;
    nacc = R(1.0);
    % 53 54
    if isempty(S)
        S = 0.0;
    end % if
    % 57 58
    if eq(length(S), 1.0)
        S = S(ones(nacc, 1.0), :);
    end % if
    % 61 63
    % 62 63
    if ne(size(S, 1.0), nacc)
        error(sprintf('The PolyphaseAccum must be a vector or matrix with %d rows and one column per channel.', nacc));
    end % if
end % function
