function spurdata = calcemixspur(h, spurdata, zl, zs, z0, cktindex, addnewspur)
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
    error(nargchk(6.0, 7.0, nargin));
    if eq(nargin, 6.0)
        addnewspur = true;
    end % if
    ckts = get(h, 'Ckts');
    nckts = length(ckts);
    if eq(nckts, 0.0)
        return;
    end % if
    checkproperty(h);
    temp_ckt1 = rfckt.cascade;
    temp_ckt2 = rfckt.cascade;
    simdata = rfdata.network;
    fin = spurdata.Fin;
    pin = spurdata.Pin;
    for k=1.0:nckts
        idxin = spurdata.Idxin;
        ckts1 = {};
        ckts2 = {};
        for k1=1.0:k
            ckts1{k1} = ckts{k1};
        end % for
        set(temp_ckt1, 'Ckts', ckts1);
        for k2=1.0:minus(nckts, k)
            ckts2{k2} = ckts{plus(k, k2)};
        end % for
        set(temp_ckt2, 'Ckts', ckts2);
        if not(isempty(ckts2))
            Zl(1.0:length(fin), 1.0) = z0;
            idx = find(ge(convertfreq(h, fin, false), 0.0));
            [ckt_type2, ckt_params2, ckt_z02] = nwa(temp_ckt2, convertfreq(temp_ckt1, fin(idx)));
            sparams2 = convertmatrix(simdata, ckt_params2, ckt_type2, 'S_Parameters', ckt_z02, z0);
            Zl(idx) = gamma2z(gammain(sparams2, z0, zl), z0);
        else
            Zl = 50.0;
        end % if
        [pl, freq] = calcpout(temp_ckt1, pin, fin, Zl, zs, z0);
        idx = find(gt(pl, minus(max(pl), 99.0)));
        if not(isempty(idx))
            freq = freq(idx);
            pl = pl(idx);
            idxin = cellhorzcat(idxin{idx});
        end % if
        n = length(spurdata.Freq{plus(k, cktindex)});
        spurdata.Freq{plus(k, cktindex)} = vertcat(horzcat(spurdata.Freq{plus(k, cktindex)}), freq);
        spurdata.Pout{plus(k, cktindex)} = vertcat(horzcat(spurdata.Pout{plus(k, cktindex)}), pl);
        for i=1.0:length(freq)
            spurdata.Indexes{plus(k, cktindex)}{plus(n, i), 1.0} = idxin{i};
        end % for
    end % for
    % 64 66
    if addnewspur
        for k=1.0:nckts
            ckts2 = {};
            if isa(ckts{k}, 'rfckt.mixer') && isa(ckts{k}.MixerSpurData, 'rfdata.mixerspur')
                for k2=1.0:minus(nckts, k)
                    ckts2{k2} = ckts{plus(k, k2)};
                end % for
                set(temp_ckt2, 'Ckts', ckts2);
                if not(isempty(ckts2))
                    [ckt_type2, ckt_params2, ckt_z02] = nwa(temp_ckt2, spurdata.Freq{plus(k, 1.0)}(1.0));
                    sparams2 = convertmatrix(simdata, ckt_params2, ckt_type2, 'S_Parameters', ckt_z02, z0);
                    Zl = gamma2z(gammain(sparams2, z0, zl), z0);
                else
                    Zl = z0;
                end % if
                spurdata.NMixers = plus(spurdata.NMixers, 1.0);
                spurdata.Fin = spurdata.Freq{plus(k, 1.0)}(1.0);
                spurdata.Pin = spurdata.Pout{plus(k, 1.0)}(1.0);
                spurdata = addmixspur(ckts{k}, spurdata, Zl, zs, z0, k);
                spurdata = calcemixspur(temp_ckt2, spurdata, zl, zs, z0, plus(k, 1.0), false);
            end % if
        end % for
    end % if
end % function
