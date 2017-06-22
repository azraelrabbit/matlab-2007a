function [A, B, C, D, statescell, x0, x0sw, rlswitch, u, x, y, freq, Asw, Bsw, Csw, Dsw, Hlin, Hswo] = power_statespace_pr(rlc, switches, source, line_dist, yout, y_type, unit, blocs, srcstr, BrancheREF, silent, fid_outfile, freq_sys, ref_node, vary_name, vary_val)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    commandLine = 1.0;
    nargs = nargin;
    debug_etat = 0.0;
    % 17 19
    switch nargs
    case 7.0
        blocs = [];
        srcstr = [];
        BrancheREF = [];
        silent = 0.0;
        freq_sys = 60.0;
        ref_node = 0.0;
        vary_name = [];
        vary_val = [];
        nvary = 0.0;
        fid_outfile = 0.0;
    case 12.0
        freq_sys = 60.0;
        ref_node = 0.0;
        vary_name = [];
        vary_val = [];
        nvary = 0.0;
    case 13.0
        ref_node = 0.0;
        vary_name = [];
        vary_val = [];
        nvary = 0.0;
    case 14.0
        vary_name = [];
        vary_val = [];
        nvary = 0.0;
    case 16.0
        nvary = size(vary_name, 1.0);
        if ne(length(vary_val), nvary)
            error(sprintf('The length of vector ''vary_val'' (%g) does not correspond to the number of variables declared in ''vary_name'' (%g).', size(vary_name), nvary));
        end
    otherwise
        error(sprintf('Number of input arguments (%g) must be 7, 12, 13, 14, or 16.', nargs));
    end
    % 53 55
    if not(isempty(blocs))
        blocs = strrep(blocs, char(10.0), ' ');
    end
    % 57 61
    % 58 61
    % 59 61
    version = '5.0';
    if gt(fid_outfile, 0.0)
        fprintf(fid_outfile, 'POWER_STATESPACE Version %s\n\n', version);
    end
    % 64 66
    if commandLine
        systemInfo.Outputs = [];
        systemInfo.outstr = yout;
        qtyOut = size(yout, 1.0);
    else
        systemInfo.Outputs = yout.Outputs;
        systemInfo.outstr = yout.outstr;
        qtyOut = size(yout.outstr, 1.0);
    end
    % 74 76
    omega = mtimes(mtimes(freq_sys, 2.0), 3.141592653589793);
    qtySrc = size(source, 1.0);
    % 77 81
    % 78 81
    % 79 81
    [rlc, liste_neu, ind_neu, ind_neusrc, ind_neusw, mat_tr, unit, rlccar] = etapar(rlc, switches, source, qtyOut, ref_node, unit, silent, fid_outfile, blocs, srcstr);
    % 81 83
    if gt(fid_outfile, 0.0)
        fprintf(fid_outfile, 'Number of outputs: %g\n\n', qtyOut);
    end
    % 85 89
    % 86 89
    % 87 89
    systemInfo.rlc = rlc;
    systemInfo.source = source;
    systemInfo.vary_name = vary_name;
    systemInfo.vary_val = vary_val;
    systemInfo.nvary = nvary;
    systemInfo.unit = unit;
    systemInfo.freq_sys = freq_sys;
    systemInfo.liste_neu = liste_neu;
    systemInfo.ytype = y_type;
    systemInfo.rlcnames = blocs;
    systemInfo.srcstr = srcstr;
    % 99 101
    [A, B, C, D, statescell, src, out, circ2ssInfo] = psb2sys(systemInfo, commandLine, silent, fid_outfile);
    % 101 103
    states = char(statescell);
    qtySvar = size(states, 1.0);
    nbvar1 = size(A, 1.0);
    % 105 109
    % 106 109
    % 107 109
    if eq(silent, 0.0)
        valp = eig(A);
        [n, i] = sort(imag(valp));
        valp = valp(i);
        disp('\nOscillatory modes and damping factors:\n');
        for i=1.0:nbvar1
            if gt(imag(valp(i)), 0.0)
                fmode = mrdivide(mrdivide(imag(valp(i)), 2.0), 3.141592653589793);
                zeta = mrdivide(uminus(real(valp(i))), abs(valp(i)));
                disp(sprintf('F=%gHz zeta=%g\n', fmode, zeta));
            end
        end % for
    end
    % 121 123
    if gt(fid_outfile, 0.0)
        fprintf(fid_outfile, '\n');
    end
    % 125 127
    if commandLine
        rlcm = circ2ssInfo.rlcm;
        rlc1 = circ2ssInfo.rlc1;
        liste_neu = circ2ssInfo.liste_neu;
        L_combi = circ2ssInfo.L_combi;
        C_combi = circ2ssInfo.C_combi;
        Il_relat = circ2ssInfo.Il_relat;
        Uc_relat = circ2ssInfo.Uc_relat;
        nb_ldep = circ2ssInfo.nb_ldep;
        nb_cdep = circ2ssInfo.nb_cdep;
        var_branche = circ2ssInfo.var_branche;
        var_nom = circ2ssInfo.var_nom;
        c_ligne = circ2ssInfo.c_ligne;
        Cvn = C;
        Dvn = D;
        C = zeros(qtyOut, nbvar1);
        D = zeros(qtyOut, qtySrc);
        vec_c0 = zeros(1.0, nbvar1);
        vec_d0 = zeros(1.0, qtySrc);
        % 145 148
        % 146 148
        if gt(fid_outfile, 0.0)
            fprintf(fid_outfile, 'Output expressions:\n');
            % 149 151
            if gt(nvary, 0.0)
                fprintf(fid_outfile, '\n');
            end
        end
        for ivary=1.0:nvary
            eval(horzcat(vary_name(ivary, :), '=vary_val(ivary);'))
            if gt(fid_outfile, 0.0)
                fprintf(fid_outfile, '%s = %g\n', vary_name(ivary, :), vary_val(ivary));
            end
        end % for
        for i_sortie=1.0:qtyOut
            chaine = yout(i_sortie, :);
            % 162 164
            if eq(y_type(i_sortie), 0.0)
                sortie = horzcat('y_u', int2str(i_sortie));
            else
                % 166 168
                if eq(y_type(i_sortie), 1.0)
                    sortie = horzcat('y_i', int2str(i_sortie));
                end
            end
            % 171 173
            if fid_outfile
                fprintf(fid_outfile, horzcat('\n', sortie, ' = ', chaine));
            end
            % 175 177
            [expr_c, expr_d, vec_c, vec_d, vec_u] = etacd(chaine, sortie, rlcm, rlc1, source, states, var_branche, nbvar1, liste_neu, L_combi, C_combi, Il_relat, Uc_relat, nb_ldep, nb_cdep, c_ligne, debug_etat);
            % 177 183
            % 178 183
            % 179 183
            % 180 183
            % 181 183
            if gt(length(expr_c), 0.0) && gt(nbvar1, 0.0)
                str = horzcat('C(', int2str(i_sortie), ',:)=', expr_c, ';');
                eval(str);
            end
            if gt(length(expr_d), 0.0)
                str = horzcat('D(', int2str(i_sortie), ',:)=', expr_d, ';');
                eval(str);
            end
        end % for
    end
    % 192 196
    % 193 196
    % 194 196
    if lt(nbvar1, qtySvar)
        for i=plus(nbvar1, 1.0):qtySvar
            statescell{i} = horzcat(statescell{i}, '*');
        end % for
    end
    % 200 204
    % 201 204
    % 202 204
    if not(isempty(switches))
        rlswitch = horzcat(switches(:, 4.0), switches(:, 5.0));
        switch unit
        case 'OMU'
            rlswitch(:, 2.0) = rdivide(rlswitch(:, 2.0), 1000.0);
        case 'OHM'
            rlswitch(:, 2.0) = rdivide(rlswitch(:, 2.0), omega);
        otherwise
            error(horzcat('Unsupported units (', unit, ') specified.'));
        end
    else
        rlswitch = [];
    end
    % 216 220
    % 217 220
    % 218 220
    psb.A = A;
    psb.B = B;
    psb.C = C;
    psb.D = D;
    % 223 225
    if isempty(psb.B)
        psb.B = zeros(nbvar1, qtySrc);
    end
    if isempty(psb.C)
        psb.C = zeros(qtyOut, nbvar1);
    end
    if isempty(psb.D)
        psb.D = zeros(qtyOut, qtySrc);
    end
    if isempty(switches)
        psb.switches = zeros(0.0, 9.0);
    else
        psb.switches = switches;
    end
    psb.source = source;
    psb.rlswitch = rlswitch;
    psb.unit = unit;
    psb.freq = freq_sys;
    psb.distline = line_dist;
    psb.PowerguiInfo.PhasorFrequency = 60.0;
    psb = etass(psb);
    u = psb.uss;
    x = psb.xss;
    y = psb.yss;
    x0 = psb.x0;
    x0sw = psb.x0switch;
    Asw = psb.Aswitch;
    Bsw = psb.Bswitch;
    Csw = psb.Cswitch;
    Dsw = psb.Dswitch;
    freq = psb.freq;
    Hlin = psb.Hlin;
    Hswo = psb.Hswo;
    % 257 259
    if eq(silent, 0.0)
        for ifreq=1.0:length(freq)
            disp(sprintf('\nSteady state outputs @ F=%g Hz :\n', freq(ifreq)));
            for i=1.0:qtyOut
                if eq(y_type(i), 1.0)
                    str = 'y_i';
                    unit = 'Amperes';
                else
                    str = 'y_u';
                    unit = 'Volts';
                end
                if gt(freq(ifreq), 0.0)
                    disp(sprintf(horzcat(str, sprintf(horzcat('%g = %.4g ', unit, ' < %.4g deg.\n'), i, abs(y(i, ifreq)), mrdivide(mtimes(angle(y(i, ifreq)), 180.0), 3.141592653589793)))));
                else
                    % 272 274
                    % 273 275
                    disp(sprintf(horzcat(str, sprintf(horzcat('%g= %.4g', unit, '\n'), i, real(y(i, ifreq))))));
                    % 275 278
                    % 276 278
                end
            end % for
        end % for
    end
    % 281 283
    if isempty(B)
        B = zeros(nbvar1, qtySrc);
    end
    if isempty(C)
        C = zeros(qtyOut, nbvar1);
    end
    if isempty(D)
        D = zeros(qtyOut, qtySrc);
    end
end
