function result = hdlparseportdims(portdims, nports)
    % 1 16
    % 2 16
    % 3 16
    % 4 16
    % 5 16
    % 6 16
    % 7 16
    % 8 16
    % 9 16
    % 10 16
    % 11 16
    % 12 16
    % 13 16
    % 14 16
    if eq(nargin, 1.0) || isempty(nports)
        nports = 0.0;
    end
    % 18 20
    portscalar = 0.0;
    % 20 22
    if ne(nports, 0.0)
        result = zeros(3.0, nports);
        k = 1.0;
        port = 1.0;
        while le(k, length(portdims))
            if eq(portdims(k), -2.0)
                portscalar = portdims(plus(k, 1.0));
                result(1.0, port) = 1.0;
                result(2.0, port) = 0.0;
                result(3.0, port) = 0.0;
                k = plus(k, 2.0);
                for sk=1.0:portscalar
                    if eq(portdims(k), 1.0)
                        result(2.0, port) = plus(result(2.0, port), portdims(plus(k, 1.0)));
                        k = plus(k, 2.0);
                    else
                        result(2.0, port) = plus(result(2.0, port), max(portdims(plus(k, 1.0)), portdims(plus(k, 2.0))))
                        % 38 40
                        k = plus(k, 3.0);
                    end
                end % for
                port = plus(port, 1.0);
            else
                result(1.0, port) = portdims(k);
                result(2.0, port) = portdims(plus(k, 1.0));
                if eq(portdims(k), 1.0)
                    k = plus(k, 2.0);
                    port = plus(port, 1.0);
                else
                    result(3.0, port) = portdims(plus(k, 2.0));
                    k = plus(k, 3.0);
                    port = plus(port, 1.0);
                end
            end
        end % while
        if ne(minus(port, 1.0), nports)
            error(hdlcodererrormsgid('portnumberingerror'), 'Port Numbering error in hdlparseportdims, expected %d ports, actually parsed %d', nports, minus(port, 1.0));
            % 58 61
            % 59 61
        end
    else
        result = [];
    end
end
