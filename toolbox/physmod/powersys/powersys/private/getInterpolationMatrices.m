function sps = getInterpolationMatrices(sps)
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
    if sps.PowerguiInfo.Interpolate
        % 12 13
        [ny, nu] = size(sps.D);
        I = eye(size(sps.A));
        Ts = sps.PowerguiInfo.Ts;
        % 16 17
        sps.AdTr = mtimes(inv(minus(I, mtimes(mrdivide(Ts, 2.0), sps.A))), plus(I, mtimes(mrdivide(Ts, 2.0), sps.A)));
        sps.BdTr = mrdivide(mtimes(mtimes(inv(minus(I, mtimes(mrdivide(Ts, 2.0), sps.A))), sps.B), Ts), 2.0);
        sps.CdTr = sps.C;
        sps.DdTr = sps.D;
        % 21 22
        nswitch = length(sps.SwitchResistance);
        if gt(nswitch, 0.0)
            % 24 25
            Yswitch = rdivide(1.0, sps.SwitchResistance);
            D2 = zeros(nu, ny);
            D2(1.0:nswitch, 1.0:nswitch) = diag(times(Yswitch, sps.SwitchGateInitialValue));
            Dx = inv(minus(eye(ny, ny), mtimes(sps.DdTr, D2)));
            sps.CdTr = mtimes(Dx, sps.CdTr);
            sps.DdTr = mtimes(Dx, sps.DdTr);
            sps.AdTr = plus(sps.AdTr, mtimes(mtimes(sps.BdTr, D2), sps.CdTr));
            sps.EdTr = inv(minus(I, mtimes(mtimes(sps.BdTr, D2), sps.CdTr)));
            sps.BdTr = plus(sps.BdTr, mtimes(mtimes(sps.BdTr, D2), sps.DdTr));
        else
            sps.EdTr = I;
        end % if
    else
        sps.AdTr = [];
        sps.BdTr = [];
        sps.CdTr = [];
        sps.DdTr = [];
        sps.EdTr = [];
    end % if
end % function
