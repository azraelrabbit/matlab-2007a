function h = analyze(h, freq)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    method = 0.0;
    inputeffect = 1.0;
    outputGain = 1.0;
    lineargain = 1.0;
    abslineargain = 1.0;
    x = [];
    amam = [];
    ampm = [];
    pnresp = [];
    poly5c1 = 1.0;
    poly5c3 = 0.0;
    poly5c5 = 0.0;
    asatin = Inf;
    asatout = Inf;
    p2dtf = complex(ones(2.0, 2.0), zeros(2.0, 2.0));
    p2dam = [0.0 1.0];
    p2difftlength = 2.0;
    % 25 27
    ckt = h.RFckt;
    fc = get(h, 'Fc');
    % 28 30
    if isnonlinear(ckt)
        % 30 32
        data = getdata(h);
        z0 = data.Z0;
        [type, netparameters, own_z0] = nwa(data, fc);
        if strncmpi(type, 'S', 1.0)
            smatrix = s2s(netparameters, own_z0, z0);
        else
            smatrix = convertmatrix(data, netparameters, type, 'S_PARAMETERS', z0);
        end
        lineargain = smatrix(2.0, 1.0);
        abslineargain = abs(lineargain);
        phaselineargain = mrdivide(mtimes(unwrap(angle(lineargain)), 180.0), 3.141592653589793);
        if le(abslineargain, 2.220446049250313e-16)
            lineargain = 2.220446049250313e-16;
            abslineargain = 2.220446049250313e-16;
            phaselineargain = 0.0;
        end
        % 47 50
        % 48 50
        refobj = getreference(data);
        if not(hasreference(data))
            refobj = rfdata.reference('CopyPropertyObj', false);
            setreference(data, refobj);
        end
        pdata = get(refobj, 'PowerData');
        p1db = refobj.OneDBC;
        psat = refobj.PS;
        pout = {};
        if isa(pdata, 'rfdata.power')
            pout = get(pdata, 'Pout');
        end
        if not(isempty(pout))
            % 62 64
            [x_t, amam_t, ampm_t] = calcampm(data, fc);
            delta_P = abs(plus(minus(mtimes(20.0, log10(abslineargain)), mtimes(20.0, log10(amam_t(1.0)))), mtimes(20.0, log10(x_t(1.0)))));
            if ne(abslineargain, 1.0) && gt(amam_t(1.0), 2.220446049250313e-16) && gt(delta_P, .4)
                id = 'rfblks:rfbbequiv:nonlinear:PoutNotConsistentWithNetworkData';
                if isempty(h.RFckt.Block)
                    if not(hasreference(h.RFckt.AnalyzedResult))
                        warning(id, '%s: Lowest power Pin-Pout data at frequency f = %d (Hz) is inconsistent with S21(f) by an amount delta_P(f) = %d (dB) = S21(f) - Pout(f, lowest) + Pin(f, lowest). Please check data for accuracy and consistency. \n\nIn an attempt to reconcile the conflicting data, delta_P(f) will be added to all elements of Pout(f,lowest:highest).', h.Name, fc, delta_P);
                    else
                        % 71 73
                        warning(id, '%s: Lowest power Pin-Pout data at frequency f = %d (Hz) is inconsistent with S21(f) by an amount delta_P(f) = %d (dB) = S21(f) - Pout(f, lowest) + Pin(f, lowest). Please check data in ''%s'' for accuracy and consistency. \n\nIn an attempt to reconcile the conflicting data, delta_P(f) will be added to all elements of Pout(f,lowest:highest).', h.Name, fc, delta_P, h.RFckt.AnalyzedResult.Reference.Name);
                        % 73 75
                    end
                else
                    if not(hasreference(h.RFckt.AnalyzedResult))
                        warning(id, '%s: Lowest power Pin-Pout data at frequency f = %d (Hz) is inconsistent with S21(f) by an amount delta_P(f) = %d (dB) = S21(f) - Pout(f, lowest) + Pin(f, lowest). Please check data for accuracy and consistency. \n\nIn an attempt to reconcile the conflicting data, delta_P(f) will be added to all elements of Pout(f,lowest:highest).', h.RFckt.Block, fc, delta_P);
                    else
                        % 79 81
                        warning(id, '%s: Lowest power Pin-Pout data at frequency f = %d (Hz) is inconsistent with S21(f) by an amount delta_P(f) = %d (dB) = S21(f) - Pout(f, lowest) + Pin(f, lowest). Please check data in ''%s'' for accuracy and consistency. \n\nIn an attempt to reconcile the conflicting data, delta_P(f) will be added to all elements of Pout(f,lowest:highest).', h.RFckt.Block, fc, delta_P, h.RFckt.AnalyzedResult.Reference.Name);
                        % 81 83
                    end
                end
            end
            if not(isempty(amam_t)) && not(eq(amam_t(1.0), 0.0))
                amam_t = mrdivide(mtimes(mtimes(amam_t, abslineargain), x_t(1.0)), amam_t(1.0));
            end
            if not(isempty(ampm_t)) && not(eq(ampm_t(1.0), 0.0))
                ampm_t = mrdivide(mtimes(mtimes(ampm_t, phaselineargain), x_t(1.0)), ampm_t(1.0));
            end
            lenth = length(x_t);
            if gt(lenth, 0.0) && ne(x_t(1.0), 0.0) && eq(lenth, length(amam_t)) && eq(lenth, length(ampm_t))
                x(1.0) = 0.0;
                lenth = plus(lenth, 1.0);
                x(2.0:lenth) = x_t(1.0:end);
                amam(1.0) = 0.0;
                amam(2.0:lenth) = amam_t(1.0:end);
                ampm(1.0) = ampm_t(1.0);
                ampm(2.0:lenth) = ampm_t(1.0:end);
            else
                x = x_t;
                amam = amam_t;
                ampm = ampm_t;
            end
            if isempty(amam) || all(eq(amam, 0.0))
                method = 0.0;
                outputGain = 1.0;
            else
                if all(eq(ampm, 0.0))
                    method = 1.0;
                    outputGain = mrdivide(1.0, abslineargain);
                else
                    method = 2.0;
                    outputGain = mrdivide(1.0, lineargain);
                end
            end
        else
            if hasp2dreference(data)
                [p2dtf, p2dam, tempfreq, asatout] = processp2d(data, frequency(h));
                p2difftlength = mpower(2.0, nextpow2(length(tempfreq)));
                method = 5.0;
            else
                ip3 = oip3(data, fc);
                % 124 126
                if eq(ip3, Inf)
                    ip3 = dbm2w(get(h.RFckt, 'OIP3'));
                end
                if eq(ip3, Inf)
                    iip3 = dbm2w(get(h.RFckt, 'IIP3'));
                else
                    iip3 = Inf;
                end
                if eq(ip3, Inf) && isfinite(iip3)
                    ip3 = mtimes(iip3, mpower(abslineargain, 2.0));
                    checkip3andp1db(ip3, p1db)
                end
                % 137 139
                if eq(ip3, Inf)
                    if not(isempty(p1db)) && isfinite(p1db)
                        ip3 = p1db2oip3(p1db);
                    else
                        if not(isempty(psat)) && isfinite(psat)
                            ip3 = psat2oip3(psat);
                        end
                    end
                end
                if isfinite(ip3) && not(isempty(p1db)) && isfinite(p1db)
                    [method, poly5c1, poly5c3, poly5c5, asatin, asatout, inputeffect, outputGain] = genpoly5(data, lineargain, ip3);
                else
                    % 150 152
                    if isfinite(ip3)
                        [method, am2pm, inputeffect, outputGain] = genpoly3(data, abslineargain, iip3, ip3);
                        % 153 156
                        % 154 156
                    end
                end
            end
        end
    end
    if strcmpi(get(h, 'NoiseFlag'), 'on')
        if isa(ckt, 'rfckt.mixer')
            data = getdata(h);
            % 163 167
            % 164 167
            % 165 167
            temp = sort(ckt.FreqOffset);
            smallest_offset = min(vertcat(min(temp), min(diff(temp))));
            fs = mrdivide(1.0, h.Ts);
            max_len = mrdivide(mtimes(2.0, fs), smallest_offset);
            max_len = max(horzcat(mpower(2.0, nextpow2(max_len)), 128.0));
            max_len = min(horzcat(max_len, 32768.0));
            saved_len = h.MaxLength;
            h.MaxLength = max_len;
            phasenoise_freq = frequency(h);
            freqoffset = minus(phasenoise_freq, fc);
            idx = mrdivide(length(freqoffset), 2.0);
            pnoise = phasenoise(data, uminus(freqoffset(idx:-1.0:1.0)));
            phasenoiselevel = pnoise(horzcat(idx:-1.0:1.0, 1.0, 1.0:minus(idx, 1.0)));
            if not(isempty(phasenoiselevel))
                pntransf = mrdivide(power(10.0, mrdivide(phasenoiselevel, 20.0)), sqrt(h.Ts));
                % 181 183
                pnresp = response(h, pntransf);
                pnresp = pnresp(1.0:mrdivide(max_len, 2.0));
            end
            h.MaxLength = saved_len;
        end
    end
    % 188 191
    % 189 191
    set(h, 'Method', method, 'InputEffect', inputeffect, 'OutputGain', outputGain, 'XData', x, 'AMAMData', amam, 'AMPMData', ampm, 'PhaseNoiseResp', pnresp, 'Poly5C1', poly5c1, 'Poly5C3', poly5c3, 'Poly5C5', poly5c5, 'ASatIn', asatin, 'ASatOut', asatout, 'P2DTF', p2dtf, 'P2DAM', p2dam, 'P2DIFFTLength', p2difftlength);
    % 191 195
    % 192 195
    % 193 195
end
function oip3 = psat2oip3(psat)
    % 196 199
    % 197 199
    oip3 = mrdivide(mtimes(psat, 27.0), 4.0);
end
function oip3 = p1db2oip3(p1db)
    oip3_db = plus(w2dbm(p1db), 10.6);
    oip3 = dbm2w(oip3_db);
end
function y = w2dbm(x)
    y = mtimes(10.0, log10(mtimes(1000.0, x)));
end
function y = dbm2w(x)
    y = mtimes(.001, power(10.0, mrdivide(x, 10.0)));
end
function checkip3andp1db(oip3, p1db)
    if isempty(oip3) || isempty(p1db) || isinf(oip3) || isinf(p1db)
        return
    end
    if lt(oip3, plus(p1db, 10.6))
        id = 'rfblks:rfbbequiv:nonlinear:UncommonOIP3P1dBRelation';
        warning('off', id)
        warning(id, 'For typical semiconductor amplifier, OIP3 > P1dB + 10.6dB.\nBut current OIP3 is %4.1f dBm while P1dB is %4.1f dBm.', w2dbm(oip3), w2dbm(p1db));
        % 218 221
        % 219 221
    end
end
