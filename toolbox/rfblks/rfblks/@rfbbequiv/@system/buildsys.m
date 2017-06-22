function h = buildsys(h, originalckts)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    rearranged_ckts = {};
    for j=1.0:length(originalckts)
        originalckt = originalckts{j};
        if isa(originalckt, 'rfckt.rfckt')
            rearranged_ckts = processckt(rearranged_ckts, originalckt);
        end % if
    end % for
    % 16 19
    % 17 19
    models = get(h, 'Models');
    nmodels = length(models);
    originalckt = get(h, 'OriginalCkt');
    if not(isa(originalckt, 'rfckt.cascade'))
        originalckt = rfckt.cascade('CopyPropertyObj', false);
        data1 = rfbbequiv.data('CopyPropertyObj', false);
        setrfdata(originalckt, data1);
        set(h, 'OriginalCkt', originalckt);
    end % if
    setflagindexes(originalckt);
    updateflag(originalckt, indexOfThePropertyIsChecked, 1.0, MaxNumberOfFlags);
    set(originalckt, 'Ckts', originalckts);
    % 30 32
    rearranged_nckts = length(rearranged_ckts);
    % 32 34
    current_index = 0.0;
    nckts = 0.0;
    ckts = {};
    % 36 38
    for j=1.0:rearranged_nckts
        ckt = rearranged_ckts{j};
        updatedata(ckt);
        if not(ckt.isnonlinear)
            if isa(ckt, 'rfckt.mixer')
                % 42 44
                [current_index, models] = addlinearrfmodel(current_index, models, ckts);
                % 44 47
                % 45 47
                [current_index, models] = addnonlinearrfmodel(current_index, models, ckt);
                % 47 49
                nckts = 0.0;
                ckts = {};
                lin_2 = getthesecond(ckt);
                set(lin_2, 'EqualToOriginal', true);
                % 52 54
                [nckts, ckts] = add(nckts, ckts, lin_2);
            else
                [nckts, ckts] = add(nckts, ckts, ckt);
            end % if
        else
            if isempty(ckt.AnalyzedResult) || isempty(ckt.AnalyzedResult.S_Parameters)
                [current_index, models] = addlinearrfmodel(current_index, models, ckts);
                % 60 63
                % 61 63
                [current_index, models] = addnonlinearrfmodel(current_index, models, ckt);
                % 63 65
                nckts = 0.0;
                ckts = {};
            else
                lin_1 = getthefirst(ckt);
                % 68 70
                [nckts, ckts] = add(nckts, ckts, lin_1);
                % 70 72
                [current_index, models] = addlinearrfmodel(current_index, models, ckts);
                % 72 74
                [current_index, models] = addnonlinearrfmodel(current_index, models, ckt);
                % 74 76
                nckts = 0.0;
                ckts = {};
                lin_2 = getthesecond(ckt);
                set(lin_2, 'EqualToOriginal', false);
                % 79 81
                [nckts, ckts] = add(nckts, ckts, lin_2);
            end % if
        end % if
    end % for
    % 84 86
    if not(isempty(ckts)) || isempty(rearranged_ckts)
        [current_index, models] = addlinearrfmodel(current_index, models, ckts);
    end % if
    % 88 91
    % 89 91
    for i=1.0:current_index
        set(models{i}, 'DeleteCkt', false, 'AllPassFilter', false);
    end % for
    for i=plus(current_index, 1.0):length(models)
        if isa(models{i}, 'rfbbequiv.nonlinear')
            set(models{i}, 'Method', 0.0, 'InputEffect', 1.0, 'OutputGain', 1.0);
        end % if
        set(models{i}, 'DeleteCkt', false, 'ImpulseResp', 1.0, 'AllPassFilter', true);
    end % for
    for i=1.0:current_index
        if isa(models{i}, 'rfbbequiv.nonlinear') && not(isnonlinear(models{i}.RFckt))
            previous = minus(i, 1.0);
            next = plus(i, 1.0);
            if ge(previous, 1.0) && le(next, current_index)
                ckts = models{previous}.RFckt.Ckts;
                nckts = length(ckts);
                ckts2 = models{next}.RFckt.Ckts;
                nckts2 = length(ckts2);
                for j=1.0:nckts2
                    [nckts, ckts] = add(nckts, ckts, ckts2{j});
                end % for
                set(models{next}.RFckt.AnalyzedResult, 'ZS', models{previous}.RFckt.AnalyzedResult.ZS);
                set(models{next}.RFckt, 'Ckts', ckts);
                set(models{previous}.RFckt.AnalyzedResult, 'ZL', 50.0, 'ZS', 50.0);
                set(models{previous}.RFckt, 'Ckts', {});
            end % if
        end % if
    end % for
    if eq(current_index, 2.0)
        if isempty(models{1.0}.RFckt.Ckts)
            set(models{1.0}, 'AllPassFilter', true);
        end % if
    end % if
    set(h, 'Models', models, 'nModels', current_index);
end % function
function [num_obj, objects] = add(num_obj, objects, new_obj)
    % 126 129
    % 127 129
    objects{plus(num_obj, 1.0)} = new_obj;
    num_obj = plus(num_obj, 1.0);
end % function
function lin_1 = getthefirst(ckt)
    % 132 134
    udata = get(ckt, 'UserData');
    if isempty(udata)
        set(ckt, 'UserData', vertcat(cellhorzcat(rfbbequiv.ampinput('CopyPropertyObj', false, 'OriginalCkt', ckt)), cellhorzcat(rfbbequiv.ampoutput('CopyPropertyObj', false, 'OriginalCkt', ckt))));
        % 136 138
        udata = get(ckt, 'UserData');
    end % if
    lin_1 = udata{1.0};
    set(lin_1, 'OriginalCkt', ckt);
end % function
function lin_2 = getthesecond(ckt)
    udata = get(ckt, 'UserData');
    if isempty(udata)
        set(ckt, 'UserData', vertcat(cellhorzcat(rfbbequiv.ampinput('CopyPropertyObj', false, 'OriginalCkt', ckt)), cellhorzcat(rfbbequiv.ampoutput('CopyPropertyObj', false, 'OriginalCkt', ckt))));
        % 146 148
        udata = get(ckt, 'UserData');
    end % if
    lin_2 = udata{2.0};
    set(lin_2, 'OriginalCkt', ckt);
end % function
function rearranged_ckts = processckt(rearranged_ckts, ckt)
    % 153 155
    rearranged_nckts = length(rearranged_ckts);
    % 155 157
    if isa(ckt, 'rfckt.cascade') || isa(ckt, 'rfckt.ladderfilter')
        ckts = get(ckt, 'Ckts');
        nckts = length(ckts);
        if gt(nckts, 0.0)
            for j=1.0:nckts
                rearranged_ckts = processckt(rearranged_ckts, ckts{j});
            end % for
            return;
        end % if
    end % if
    rearranged_nckts = plus(rearranged_nckts, 1.0);
    rearranged_ckts{rearranged_nckts} = ckt;
end % function
function updatedata(ckt)
    % 170 172
    data = get(ckt, 'AnalyzedResult');
    if not(isa(data, 'rfbbequiv.data'))
        copiedref = [];
        netdata = [];
        powerdata = [];
        ip3data = [];
        noisedata = [];
        nfdata = [];
        mixerdata = [];
        if isa(data, 'rfdata.data') && hasreference(data)
            set(data, 'CopyPropertyObj', true);
            copieddata = copy(data);
            copiedref = getreference(copieddata);
            netdata = copiedref.NetworkData;
            powerdata = copiedref.PowerData;
            ip3data = copiedref.IP3Data;
            noisedata = copiedref.NoiseData;
            nfdata = copiedref.NFData;
            mixerdata = copiedref.MixerSpurData;
        end % if
        newdata = rfbbequiv.data('CopyPropertyObj', false);
        setreference(newdata, copiedref);
        if isa(data, 'rfdata.data')
            set(newdata, 'Freq', data.Freq, 'S_Parameters', data.S_Parameters, 'NF', data.NF, 'OIP3', data.OIP3, 'Z0', data.Z0, 'ZS', data.ZS, 'ZL', data.ZL, 'IntpType', data.IntpType);
            % 195 198
            % 196 198
        end % if
        setrfdata(ckt, newdata);
        if isa(ckt, 'rfckt.passive')
            ckt.NetworkData = netdata;
        end % if
        if isa(ckt, 'rfckt.amplifier')
            ckt.PowerData = powerdata;
            ckt.IP3Data = ip3data;
            ckt.NFData = nfdata;
            ckt.NoiseData = noisedata;
        end % if
        if isa(ckt, 'rfckt.mixer')
            ckt.MixerSpurData = mixerdata;
        end % if
    end % if
end % function
function [index, models] = addlinearrfmodel(index, models, ckts)
    % 214 216
    index = plus(index, 1.0);
    model = [];
    nmodels = length(models);
    if le(index, nmodels)
        model = models{index};
    end % if
    if not(isa(model, 'rfbbequiv.linear'))
        ckt = rfckt.cascade('CopyPropertyObj', false);
        data = rfbbequiv.data('CopyPropertyObj', false);
        setrfdata(ckt, data);
        model = rfbbequiv.linear('RFckt', ckt);
        models{index} = model;
    end % if
    ckt = get(model, 'RFckt');
    if not(isa(ckt, 'rfckt.cascade'))
        ckt = rfckt.cascade('CopyPropertyObj', false);
        data = rfbbequiv.data('CopyPropertyObj', false);
        setrfdata(ckt, data);
        ckt = get(model, 'RFckt');
    end % if
    setflagindexes(ckt);
    updateflag(ckt, indexOfNoiseOn, 0.0, MaxNumberOfFlags);
    updateflag(ckt, indexOfDoNonlinearAna, 0.0, MaxNumberOfFlags);
    updateflag(ckt, indexOfThePropertyIsChecked, 1.0, MaxNumberOfFlags);
    set(ckt, 'Ckts', ckts);
    data = get(ckt, 'AnalyzedResult');
    if not(isa(data, 'rfbbequiv.data'))
        setrfdata(ckt, rfbbequiv.data('CopyPropertyObj', false));
        data = get(ckt, 'AnalyzedResult');
    end % if
    if isempty(ckts)
        set(data, 'S_Parameters', [], 'Freq', []);
    end % if
    % 248 250
    if gt(index, 2.0)
        data.Zs = models{minus(index, 1.0)}.RFckt.AnalyzedResult.Zl;
    end % if
end % function
function [index, models] = addnonlinearrfmodel(index, models, ckt)
    index = plus(index, 1.0);
    model = [];
    nmodels = length(models);
    if le(index, nmodels)
        model = models{index};
    end % if
    if not(isa(model, 'rfbbequiv.nonlinear'))
        model = rfbbequiv.nonlinear;
        models{index} = model;
    end % if
    data = get(ckt, 'AnalyzedResult');
    if not(isa(data, 'rfbbequiv.data'))
        setrfdata(ckt, rfbbequiv.data('CopyPropertyObj', false));
    end % if
    set(data, 'Zs', data.Z0, 'Zl', data.Z0);
    models{minus(index, 1.0)}.RFckt.AnalyzedResult.Zl = data.Zs;
    set(model, 'RFckt', ckt);
end % function
