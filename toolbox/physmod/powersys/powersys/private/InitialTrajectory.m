function HT = InitialTrajectory(HT, fluxinit, initialslope)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    npuis = HT.npuis;
    sgn = 1.0;
    lim = mrdivide(mpower(2.0, npuis), 2.0);
    dx = mrdivide(HT.Is, lim);
    % 15 17
    HT.Jmax = plus(mpower(2.0, npuis), 1.0);
    % 17 20
    % 18 20
    HT.delFj = mrdivide(mtimes(2.0, HT.Fs), minus(HT.Jmax, 1.0));
    % 20 22
    for J=1.0:HT.Jmax
        HT.Fj(J) = plus(uminus(HT.Fs), mtimes(minus(J, 1.0), HT.delFj));
        % 23 40
        % 24 40
        % 25 40
        % 26 40
        % 27 40
        % 28 40
        % 29 40
        % 30 40
        % 31 40
        % 32 40
        % 33 40
        % 34 40
        % 35 40
        % 36 40
        % 37 40
        % 38 40
        NA = uminus(lim);
        NB = lim;
        % 41 43
        FNA = 1.0;
        % 43 45
        for L=1.0:npuis
            NN = mrdivide(plus(NA, NB), 2.0);
            COUR = mtimes(NN, dx);
            FNN = plus(HT.Fj(J), mtimes(sgn, plus(minus(mtimes(HT.a, atan(plus(mtimes(mtimes(HT.b, uminus(sgn)), COUR), HT.c))), mtimes(mtimes(sgn, HT.alpha), COUR)), HT.e)));
            if gt(mtimes(FNA, FNN), 0.0)
                NA = NN;
                FNA = FNN;
            else
                if lt(mtimes(FNA, FNN), 0.0)
                    NB = NN;
                    FNB = FNN;
                else
                    break
                end
            end
        end % for
        % 60 62
        IA = mtimes(NA, dx);
        IB = plus(IA, dx);
        FA = plus(HT.Fj(J), mtimes(sgn, plus(minus(mtimes(HT.a, atan(plus(mtimes(mtimes(HT.b, uminus(sgn)), IA), HT.c))), mtimes(mtimes(sgn, HT.alpha), IA)), HT.e)));
        FB = plus(HT.Fj(J), mtimes(sgn, plus(minus(mtimes(HT.a, atan(plus(mtimes(mtimes(HT.b, uminus(sgn)), IB), HT.c))), mtimes(mtimes(sgn, HT.alpha), IB)), HT.e)));
        Ij(J) = minus(IA, mrdivide(mtimes(FA, dx), minus(FB, FA)));
        % 66 69
        % 67 69
        DLIMj(J) = plus(mtimes(HT.a, plus(atan(plus(mtimes(HT.b, Ij(J)), HT.c)), atan(minus(HT.c, mtimes(HT.b, Ij(J)))))), mtimes(2.0, HT.e));
        % 69 71
    end % for
    % 71 77
    % 72 77
    % 73 77
    % 74 77
    % 75 77
    JmaxM1 = minus(HT.Jmax, 1.0);
    for J=1.0:JmaxM1
        HT.Mj(J) = mrdivide(minus(Ij(plus(J, 1.0)), Ij(J)), HT.delFj);
        HT.Bj(J) = minus(Ij(J), mtimes(HT.Mj(J), HT.Fj(J)));
    end % for
    % 81 84
    % 82 84
    HT.Mj(HT.Jmax) = 0.0;
    HT.Bj(HT.Jmax) = 0.0;
    % 85 87
    HT.Fr_ini = fluxinit;
    HT.sgn_ini = initialslope;
    % 88 91
    % 89 91
    NPUIS = 14.0;
    % 91 93
    sgn = HT.sgn_ini;
    % 93 95
    HT.Tr_ini = 2.0;
    % 95 97
    if ge(HT.Fr_ini, HT.Fr) && eq(sgn, -1.0)
        HT.Fr_ini = HT.Fr;
        HT.Tr_ini = 1.0;
    else
        if le(HT.Fr_ini, uminus(HT.Fr)) && eq(sgn, 1.0)
            HT.Fr_ini = uminus(HT.Fr);
            HT.Tr_ini = 1.0;
        else
            if gt(abs(HT.Fr_ini), HT.Fr)
                HT.Fr_ini = mtimes(HT.Fr, sgn);
                % 106 108
            end
        end
    end
    HT.Db = mrdivide(mtimes(HT.Fs, plus(mtimes(HT.Fr_ini, sgn), HT.Fr)), minus(mtimes(HT.Fs, sgn), HT.Fr_ini));
    HT.Dk = mrdivide(mtimes(uminus(HT.Db), sgn), HT.Fs);
    LIM = mrdivide(mpower(2.0, NPUIS), 2.0);
    NA = uminus(LIM);
    NB = LIM;
    DX = mrdivide(HT.Is, LIM);
    % 116 118
    FNA = minus(mtimes(sgn, plus(plus(mtimes(HT.a, atan(plus(mtimes(mtimes(HT.b, sgn), uminus(HT.Is)), HT.c))), mtimes(mtimes(sgn, HT.alpha), uminus(HT.Is))), HT.e)), mrdivide(plus(mtimes(uminus(sgn), plus(plus(mtimes(HT.a, atan(plus(mtimes(mtimes(HT.b, sgn), HT.Is), HT.c))), mtimes(mtimes(sgn, HT.alpha), HT.Is)), HT.e)), HT.Db), minus(1.0, HT.Dk)));
    % 118 122
    % 119 122
    % 120 122
    for L=1.0:NPUIS
        NN = mrdivide(plus(NA, NB), 2.0);
        COUR = mtimes(NN, DX);
        FNN = minus(mtimes(sgn, plus(plus(mtimes(HT.a, atan(plus(mtimes(mtimes(HT.b, sgn), COUR), HT.c))), mtimes(mtimes(sgn, HT.alpha), COUR)), HT.e)), mrdivide(plus(mtimes(uminus(sgn), plus(plus(mtimes(HT.a, atan(plus(mtimes(mtimes(HT.b, sgn), uminus(COUR)), HT.c))), mtimes(mtimes(sgn, HT.alpha), uminus(COUR))), HT.e)), HT.Db), minus(1.0, HT.Dk)));
        % 125 129
        % 126 129
        % 127 129
        if gt(mtimes(FNA, FNN), 0.0)
            NA = NN;
            FNA = FNN;
        else
            if lt(mtimes(FNA, FNN), 0.0)
                NB = NN;
                FNB = FNN;
            else
                break
            end
        end
    end % for
    % 140 142
    IA = mtimes(NA, DX);
    IB = plus(IA, DX);
    % 143 145
    FA = minus(mtimes(sgn, plus(plus(mtimes(HT.a, atan(plus(mtimes(mtimes(HT.b, sgn), IA), HT.c))), mtimes(mtimes(sgn, HT.alpha), IA)), HT.e)), mrdivide(plus(mtimes(uminus(sgn), plus(plus(mtimes(HT.a, atan(plus(mtimes(mtimes(HT.b, sgn), uminus(IA)), HT.c))), mtimes(mtimes(sgn, HT.alpha), uminus(IA))), HT.e)), HT.Db), minus(1.0, HT.Dk)));
    % 145 149
    % 146 149
    % 147 149
    FB = minus(mtimes(sgn, plus(plus(mtimes(HT.a, atan(plus(mtimes(mtimes(HT.b, sgn), IB), HT.c))), mtimes(mtimes(sgn, HT.alpha), IB)), HT.e)), mrdivide(plus(mtimes(uminus(sgn), plus(plus(mtimes(HT.a, atan(plus(mtimes(mtimes(HT.b, sgn), uminus(IB)), HT.c))), mtimes(mtimes(sgn, HT.alpha), uminus(IB))), HT.e)), HT.Db), minus(1.0, HT.Dk)));
    % 149 153
    % 150 153
    % 151 153
    HT.I_inv_ini = minus(IA, mrdivide(mtimes(FA, DX), minus(FB, FA)));
    % 153 157
    % 154 157
    % 155 157
    HT.F_inv_ini = mtimes(sgn, plus(plus(mtimes(HT.a, atan(plus(mtimes(mtimes(HT.b, sgn), HT.I_inv_ini), HT.c))), mtimes(mtimes(sgn, HT.alpha), HT.I_inv_ini)), HT.e));
    % 157 161
    % 158 161
    % 159 161
    HT.dmax_ini = plus(mtimes(HT.Dk, HT.F_inv_ini), HT.Db);
    % 161 165
    % 162 165
    % 163 165
    HT.Dk_ini = HT.Dk;
    % 165 169
    % 166 169
    % 167 169
    HT.Db_ini = HT.Db;
    % 169 172
    % 170 172
    HT.dmin_ini = 0.0;
    HT.I_old_ini = 0.0;
    HT.F_old_ini = 0.0;
end
