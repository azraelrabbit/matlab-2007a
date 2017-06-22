function [NominalParameters, Stator, Field, Dampers, Mechanical, InitialConditions, SimulateSaturation, Saturation] = SynchronousMachineConvert(NominalParameters, MaskParameter1, MaskParameter2, MaskParameter3, Mechanical, InitialConditions, SimulateSaturation, Saturation, choice, varargin)
    % 1 24
    % 2 24
    % 3 24
    % 4 24
    % 5 24
    % 6 24
    % 7 24
    % 8 24
    % 9 24
    % 10 24
    % 11 24
    % 12 24
    % 13 24
    % 14 24
    % 15 24
    % 16 24
    % 17 24
    % 18 24
    % 19 24
    % 20 24
    % 21 24
    % 22 24
    Bloc = gcb;
    % 24 29
    % 25 29
    % 26 29
    % 27 29
    Pn = NominalParameters(1.0);
    Vn = NominalParameters(2.0);
    fn = NominalParameters(3.0);
    PolePairs = Mechanical(3.0);
    % 32 34
    wen = mtimes(6.283185307179586, fn);
    % 34 36
    wmn = mrdivide(wen, PolePairs);
    % 36 38
    Vb = mtimes(sqrt(.6666666666666666), Vn);
    % 38 40
    Ib = mrdivide(mtimes(sqrt(.6666666666666666), Pn), Vn);
    % 40 42
    switch choice
    case '1'
        % 43 49
        % 44 49
        % 45 49
        % 46 49
        % 47 49
        Stator = MaskParameter1;
        Field = MaskParameter2;
        Dampers = MaskParameter3;
        % 51 53
        Zb = mrdivide(mtimes(Vn, Vn), Pn);
        % 53 55
        Lb = mrdivide(Zb, wen);
        % 55 57
        iopu = mrdivide(InitialConditions(3.0:5.0), Ib);
        % 57 59
        Rs = mrdivide(Stator(1.0), Zb);
        Ll = mrdivide(Stator(2.0), Lb);
        Lmd = mrdivide(Stator(3.0), Lb);
        Lmq = mrdivide(Stator(4.0), Lb);
        % 62 64
        Rf = mrdivide(Field(1.0), Zb);
        Llfd = mrdivide(Field(2.0), Lb);
        % 65 67
        Rkd = mrdivide(Dampers(1.0), Zb);
        Llkd = mrdivide(Dampers(2.0), Lb);
        Rkq1 = mrdivide(Dampers(3.0), Zb);
        Llkq1 = mrdivide(Dampers(4.0), Lb);
        Rkq2 = mrdivide(Dampers(5.0), Zb);
        Llkq2 = mrdivide(Dampers(6.0), Lb);
        % 72 74
        Mechanical = horzcat(mrdivide(mrdivide(mtimes(Mechanical(1.0), mpower(wmn, 2.0)), 2.0), Pn), mrdivide(mtimes(Mechanical(2.0), mpower(wmn, 2.0)), Pn), PolePairs);
        % 74 79
        % 75 79
        % 76 79
        % 77 79
        if lt(length(NominalParameters), 4.0) || eq(NominalParameters(4.0), 0.0)
            % 79 81
            Ifn = 0.0;
            % 81 83
            Vfns = mrdivide(mtimes(Rf, Vb), Lmd);
            % 83 85
            Vfopu = mrdivide(InitialConditions(9.0), Vfns);
            % 85 89
            % 86 89
            % 87 89
            if strcmp(SimulateSaturation, 'on')
                if not(isempty(Saturation))
                    Saturation = vertcat(mrdivide(Saturation(1.0, :), Saturation(1.0, 1.0)), mrdivide(Saturation(2.0, :), Vn));
                end % if
            end % if
        else
            % 94 98
            % 95 98
            % 96 98
            Ifn = NominalParameters(4.0);
            % 98 100
            Vfnr = mrdivide(mtimes(Rf, Pn), mtimes(Ifn, mpower(Lmd, 2.0)));
            % 100 102
            Vfopu = mrdivide(InitialConditions(9.0), Vfnr);
            if strcmp(SimulateSaturation, 'on')
                if not(isempty(Saturation))
                    Saturation = vertcat(mrdivide(Saturation(1.0, :), Ifn), mrdivide(Saturation(2.0, :), Vn));
                end % if
            end % if
            % 107 109
        end % if
        % 109 111
        switch length(InitialConditions)
        case 9.0
            InitialConditions = horzcat(InitialConditions(1.0:2.0), iopu, InitialConditions(6.0:8.0), Vfopu);
        case 10.0
            InitialConditions = horzcat(InitialConditions(1.0:2.0), iopu, InitialConditions(6.0:8.0), Vfopu, InitialConditions(10.0));
        end % switch
        % 116 118
        if strcmp(SimulateSaturation, 'on') && eq(Ifn, 0.0)
            if isequal('initializing', get_param(bdroot(Bloc), 'SimulationStatus'))
                message = horzcat('Field current value (Ifn parameter) must be different from zero when the Simulate saturation parameter is checked in block:', char(10.0), char(10.0), strrep(Bloc, char(10.0), char(32.0)));
                % 120 122
                Erreur.message = message;
                Erreur.identifier = 'SimPowerSystems:BlockParameterError';
                psberror(Erreur)
            end % if
        end % if
    case '3'
        % 127 133
        % 128 133
        % 129 133
        % 130 133
        % 131 133
        X = MaskParameter1;
        tau = MaskParameter2;
        ra = MaskParameter3;
        % 135 137
        xd = X(1.0);
        xpd = X(2.0);
        xsd = X(3.0);
        xq = X(4.0);
        % 140 153
        % 141 153
        % 142 153
        % 143 153
        % 144 153
        % 145 153
        % 146 153
        % 147 153
        % 148 153
        % 149 153
        % 150 153
        % 151 153
        sit = varargin{1.0};
        switch sit
        case {[0.0],[1.0],[2.0],[3.0]}
            % 155 157
            Tpdo = tau(1.0);
            Tsdo = tau(2.0);
            So = plus(Tpdo, Tsdo);
            Po = mtimes(Tpdo, Tsdo);
            A = horzcat(mtimes(mtimes(xd, xd), xsd), mtimes(mtimes(mtimes(uminus(So), xd), xpd), xsd), minus(mtimes(mtimes(mtimes(xpd, xsd), Po), plus(xd, xsd)), mtimes(mtimes(mtimes(xd, xsd), xsd), Po)));
            TD = sort(roots(A));
            Tpd = TD(2.0);
            Tsd = mrdivide(mtimes(Po, xsd), mtimes(xd, Tpd));
        case {[4.0],[5.0],[6.0],[7.0]}
            % 165 168
            % 166 168
            Tpd = tau(1.0);
            Tsd = tau(2.0);
            Ato = plus(mrdivide(mtimes(xd, Tpd), xpd), mtimes(plus(minus(mrdivide(xd, xsd), mrdivide(xd, xpd)), 1.0), Tsd));
            Bto = mrdivide(mtimes(mtimes(xd, Tpd), Tsd), xsd);
            TDO = sort(abs(roots(horzcat(1.0, Ato, Bto))));
            Tpdo = TDO(2.0);
            Tsdo = TDO(1.0);
        end % switch
        switch sit
        case {[0.0],[4.0]}
            % 177 179
            xsq = X(5.0);
            xa = X(6.0);
            Tsqo = tau(3.0);
            Tsq = mrdivide(mtimes(xsq, Tsqo), xq);
        case {[2.0],[6.0]}
            % 183 186
            % 184 186
            xsq = X(5.0);
            xa = X(6.0);
            Tsq = tau(3.0);
            Tsqo = mrdivide(mtimes(xq, Tsq), xsq);
        case {[1.0],[5.0]}
            % 190 193
            % 191 193
            xpq = X(5.0);
            xsq = X(6.0);
            xa = X(7.0);
            Tpqo = tau(3.0);
            Tsqo = tau(4.0);
            So = plus(Tpqo, Tsqo);
            Po = mtimes(Tpqo, Tsqo);
            A = horzcat(mtimes(mtimes(xq, xq), xsq), mtimes(mtimes(mtimes(uminus(So), xq), xpq), xsq), minus(mtimes(mtimes(mtimes(xpq, xsq), Po), plus(xq, xsq)), mtimes(mtimes(mtimes(xq, xsq), xsq), Po)));
            TQ = sort(roots(A));
            % 201 203
            if ne(imag(TQ(2.0)), 0.0)
                % 203 206
                % 204 206
                Tpq = mrdivide(mtimes(Tpqo, xpq), xq);
                blockName = strrep(char(varargin{2.0}), char(10.0), ' ');
                mess = horzcat(blockName, ':', char(10.0), char(10.0), 'The data supplied for the q axis (reactances and time ', 'constants) are inconsistent. Fundamental parameters are ', 'computed using approximations.');
                % 208 212
                % 209 212
                % 210 212
                warndlg(mess);
            else
                % 213 215
                % 214 216
                Tpq = TQ(2.0);
            end % if
            Tsq = mrdivide(mtimes(Po, xsq), mtimes(xq, Tpq));
        case {[3.0],[7.0]}
            % 219 222
            % 220 222
            xpq = X(5.0);
            xsq = X(6.0);
            xa = X(7.0);
            Tpq = tau(3.0);
            Tsq = tau(4.0);
            Ato = plus(mrdivide(mtimes(xq, Tpq), xpq), mtimes(plus(minus(mrdivide(xq, xsq), mrdivide(xq, xpq)), 1.0), Tsq));
            Bto = mrdivide(mtimes(mtimes(xq, Tpq), Tsq), xsq);
            TQO = sort(abs(roots(horzcat(1.0, Ato, Bto))));
            Tpqo = TQO(2.0);
            Tsqo = TQO(1.0);
        end % switch
        % 232 235
        % 233 235
        xmd = minus(xd, xa);
        % 235 238
        % 236 238
        a = mrdivide(minus(xpd, xa), minus(xd, xpd));
        b = mrdivide(mtimes(mtimes(a, xmd), minus(xsd, xa)), minus(plus(mtimes(a, xd), mtimes(xa, xmd)), mtimes(plus(a, xmd), xsd)));
        c = mrdivide(plus(b, mrdivide(mtimes(mtimes(a, xmd), xa), plus(mtimes(xa, xmd), mtimes(a, xd)))), Tsd);
        Tkd = mrdivide(b, c);
        % 241 244
        % 242 244
        Pd = mtimes(Tpd, Tsd);
        Sd = plus(Tpd, Tsd);
        Pdo = mtimes(Tpdo, Tsdo);
        Sdo = plus(Tpdo, Tsdo);
        k1 = minus(mtimes(minus(Sdo, Sd), minus(mtimes(Pdo, Sd), mtimes(Pd, Sdo))), mpower(minus(Pdo, Pd), 2.0));
        k2 = plus(minus(mtimes(Pdo, Sd), mtimes(Pd, Sdo)), mtimes(Tkd, minus(mtimes(Tkd, minus(Sdo, Sd)), mtimes(2.0, minus(Pdo, Pd)))));
        k3 = minus(Pdo, mtimes(Tkd, minus(Sdo, Tkd)));
        k4 = minus(minus(Pdo, Pd), mtimes(Tkd, minus(Sdo, Sd)));
        k5 = minus(minus(mtimes(Pdo, Sd), mtimes(Pd, Sdo)), mtimes(Tkd, minus(Pdo, Pd)));
        % 252 255
        % 253 255
        xmd = mrdivide(mtimes(xd, k4), k3);
        Rf = mrdivide(mtimes(mrdivide(mpower(xmd, 2.0), xd), k2), k1);
        xc = minus(xd, xmd);
        % 257 259
        Rkd = mrdivide(mtimes(Rf, k1), mpower(k4, 2.0));
        xf = mrdivide(mtimes(Rf, k5), k4);
        xkd = mtimes(Tkd, Rkd);
        Rf = mrdivide(Rf, wen);
        Rkd = mrdivide(Rkd, wen);
        % 263 267
        % 264 267
        % 265 267
        xmq = minus(xq, xc);
        % 267 269
        switch sit
        case {[0.0],[2.0],[4.0],[6.0]}
            % 270 272
            xmqx = mrdivide(mtimes(xmq, xc), xq);
            xkq1 = mrdivide(minus(mtimes(xmq, Tsq), mtimes(xmqx, Tsqo)), minus(Tsqo, Tsq));
            Rkq1 = mrdivide(plus(xkq1, xmq), mtimes(wen, Tsqo));
            xkq2 = Inf;
            Rkq2 = 0.0;
        case {[1.0],[3.0],[5.0],[7.0]}
            % 277 284
            % 278 284
            % 279 284
            % 280 284
            % 281 284
            % 282 284
            D = conv(horzcat(Tpqo, 1.0), horzcat(Tsqo, 1.0));
            N = conv(horzcat(Tpq, 1.0), horzcat(Tsq, 1.0));
            Nz = conv(minus(N, mrdivide(mtimes(D, xc), xq)), horzcat(mrdivide(xmq, wen), 0.0));
            Dz = minus(D, N);
            Nz = Nz(1.0:3.0);
            Dz = Dz(1.0:2.0);
            Req = mrdivide(Nz(3.0), Dz(2.0));
            Nz = mrdivide(Nz, Nz(3.0));
            Dz = mrdivide(Dz, Dz(2.0));
            Tab = sort(abs(roots(Nz)));
            Tab = rdivide(1.0, Tab);
            Tm = sort(abs(roots(Dz)));
            Tm = mrdivide(1.0, Tm(1.0));
            x = mrdivide(mldivide(vertcat([1.0 1.0], horzcat(Tab(1.0), Tab(2.0))), vertcat(1.0, Tm)), Req);
            Rkq1 = mrdivide(1.0, x(1.0));
            Rkq2 = mrdivide(1.0, x(2.0));
            xkq1 = mtimes(mtimes(Rkq1, Tab(2.0)), wen);
            xkq2 = mtimes(mtimes(Rkq2, Tab(1.0)), wen);
            % 301 303
        end % switch
        % 303 307
        % 304 307
        % 305 307
        Rs = ra;
        Ll = xc;
        Llfd = xf;
        Llkd = xkd;
        Llkq1 = xkq1;
        Llkq2 = xkq2;
        Lmd = xmd;
        Lmq = xmq;
    end % switch
    % 315 320
    % 316 320
    % 317 320
    % 318 320
    Stator = horzcat(Rs, Ll, Lmd, Lmq);
    Field = horzcat(Rf, Llfd);
    Dampers = horzcat(Rkd, Llkd, Rkq1, Llkq1, Rkq2, Llkq2);
    % 322 326
    % 323 326
    % 324 326
    if strcmp(SimulateSaturation, 'on') && le(size(Saturation, 2.0), 5.0)
        if isequal('initializing', get_param(bdroot(Bloc), 'SimulationStatus'))
            message = horzcat('Saturation characteristic of the following block  must contains a minimum of 6 pairs of points:', char(10.0), char(10.0), strrep(Bloc, char(10.0), char(32.0)));
            % 328 330
            Erreur.message = message;
            Erreur.identifier = 'SimPowerSystems:BlockParameterError';
            psberror(Erreur.message, Erreur.identifier);
        end % if
    end % if
    % 334 336
    if strcmp(SimulateSaturation, 'off')
        Saturation = 0.0;
    end % if
