function [tout, yout, iout, vnew, stop] = ne_odezero(ntrpfun, eventfun, eventargs, v, t, y, tnew, ynew, t0, varargin)
    % 1 21
    % 2 21
    % 3 21
    % 4 21
    % 5 21
    % 6 21
    % 7 21
    % 8 21
    % 9 21
    % 10 21
    % 11 21
    % 12 21
    % 13 21
    % 14 21
    % 15 21
    % 16 21
    % 17 21
    % 18 21
    % 19 21
    tol = mtimes(128.0, max(eps(t), eps(tnew)));
    tol = min(tol, abs(minus(tnew, t)));
    tout = [];
    yout = [];
    iout = [];
    tdir = sign(minus(tnew, t));
    stop = 0.0;
    rmin = 2.2250738585072014e-308;
    % 28 31
    % 29 31
    tL = t;
    yL = y;
    vL = v;
    [vnew, isterminal, direction] = feval(eventfun, tnew, ynew, eventargs{:});
    if isempty(direction)
        direction = zeros(size(vnew));
    end % if
    tR = tnew;
    yR = ynew;
    vR = vnew;
    % 40 43
    % 41 43
    ttry = tR;
    % 43 46
    % 44 46
        while true
        % 46 48
        lastmoved = 0.0;
            while true
            % 49 52
            % 50 52
            indzc = find(and(ne(sign(vL), sign(vR)), ge(times(direction, minus(vR, vL)), 0.0)));
            if isempty(indzc)
                if ne(lastmoved, 0.0)
                    error('MATLAB:odezero:LostEvent', 'odezero: an event disappeared (internal error)');
                    % 55 57
                end % if
                return;
            end % if
            % 59 62
            % 60 62
            delta = minus(tR, tL);
            if le(abs(delta), tol)
                break
            end % if
            % 65 67
            if eq(tL, t) && any(and(eq(vL(indzc), 0.0), ne(vR(indzc), 0.0)))
                ttry = plus(tL, mtimes(mtimes(tdir, .5), tol));
            else
                % 69 72
                % 70 72
                change = 1.0;
                for j=ctranspose(indzc(:))
                    % 73 75
                    if eq(vL(j), 0.0)
                        if gt(mtimes(tdir, ttry), mtimes(tdir, tR)) && ne(vtry(j), vR(j))
                            maybe = minus(1.0, mrdivide(mtimes(vR(j), minus(ttry, tR)), mtimes(minus(vtry(j), vR(j)), delta)));
                            if lt(maybe, 0.0) || gt(maybe, 1.0)
                                maybe = .5;
                            end % if
                        else
                            maybe = .5;
                        end % if
                    else
                        if eq(vR(j), 0.0)
                            if lt(mtimes(tdir, ttry), mtimes(tdir, tL)) && ne(vtry(j), vL(j))
                                maybe = mrdivide(mtimes(vL(j), minus(tL, ttry)), mtimes(minus(vtry(j), vL(j)), delta));
                                if lt(maybe, 0.0) || gt(maybe, 1.0)
                                    maybe = .5;
                                end % if
                            else
                                maybe = .5;
                            end % if
                        else
                            maybe = mrdivide(uminus(vL(j)), minus(vR(j), vL(j)));
                        end % if
                    end % if
                    if lt(maybe, change)
                        change = maybe;
                    end % if
                end % for
                change = mtimes(change, abs(delta));
                change = max(mtimes(.5, tol), min(change, minus(abs(delta), mtimes(.5, tol))));
                % 103 105
                ttry = plus(tL, mtimes(tdir, change));
            end % if
            % 106 109
            % 107 109
            ytry = feval(ntrpfun, ttry, t, y, tnew, ynew, varargin{:});
            vtry = feval(eventfun, ttry, ytry, eventargs{:});
            % 110 113
            % 111 113
            indzc = find(and(ne(sign(vL), sign(vtry)), ge(times(direction, minus(vtry, vL)), 0.0)));
            if not(isempty(indzc))
                % 114 116
                tswap = tR;
                tR = ttry;
                ttry = tswap;
                yswap = yR;
                yR = ytry;
                ytry = yswap;
                vswap = vR;
                vR = vtry;
                vtry = vswap;
                if eq(lastmoved, 2.0)
                    maybe = mtimes(.5, vL);
                    i = find(ge(abs(maybe), rmin));
                    vL(i) = maybe(i);
                end % if
                lastmoved = 2.0;
            else
                tswap = tL;
                tL = ttry;
                ttry = tswap;
                yswap = yL;
                yL = ytry;
                ytry = yswap;
                vswap = vL;
                vL = vtry;
                vtry = vswap;
                if eq(lastmoved, 1.0)
                    maybe = mtimes(.5, vR);
                    i = find(ge(abs(maybe), rmin));
                    vR(i) = maybe(i);
                end % if
                lastmoved = 1.0;
            end % if
        end % while
        j = ones(1.0, length(indzc));
        tout = horzcat(tout, tR(j));
        yout = horzcat(yout, yR(:, j));
        iout = horzcat(iout, ctranspose(indzc));
        if any(isterminal(indzc))
            stop = 1.0;
            break
        else
            if le(abs(minus(tnew, tR)), tol)
                break
            else
                ttry = tR;
                ytry = yR;
                vtry = vR;
                tL = plus(tR, mtimes(mtimes(tdir, .5), tol));
                yL = feval(ntrpfun, tL, t, y, tnew, ynew, varargin{:});
                vL = feval(eventfun, tL, yL, eventargs{:});
                tR = tnew;
                yR = ynew;
                vR = vnew;
            end % if
        end % if
    end % while
end % function
