function h = update(h, ckttype, varargin)
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
    if not(hasreference(h))
        setreference(h, rfdata.reference('CopyPropertyObj', false));
    end
    refobj = getreference(h);
    if hasreference(h)
        set(refobj, 'IP3Data', [], 'NFData', [], 'MixerSpurData', []);
    end
    % 21 24
    % 22 24
    switch upper(ckttype)
    case 'S-PARAMETERS'
        type = varargin{1.0};
        newNetData = varargin{2.0};
        newFreq = varargin{3.0};
        newZ0 = varargin{4.0};
        % 29 32
        % 30 32
        update(refobj, type, newFreq, newNetData, newZ0, [], [], [], [], [], [], [], []);
        set(refobj, 'OIP3', Inf, 'OneDBC', Inf, 'PS', Inf, 'GCS', Inf);
    case 'NETWORK PARAMETERS'
        % 34 36
        type = varargin{1.0};
        newNetData = varargin{2.0};
        newFreq = varargin{3.0};
        % 38 40
        update(refobj, type, newFreq, newNetData, 50.0, [], [], [], [], [], [], [], []);
        set(refobj, 'OIP3', Inf, 'OneDBC', Inf, 'PS', Inf, 'GCS', Inf);
    case 'PASSIVE'
        % 42 44
        dataname = '';
        newdata = varargin{1.0};
        netdata = [];
        noisedata = [];
        powerdata = [];
        oip3 = Inf;
        onedbc = Inf;
        ps = Inf;
        agcs = Inf;
        if isa(newdata, 'rfdata.data')
            newrefobj = getreference(newdata);
            if hasreference(newdata)
                netdata = get(newrefobj, 'NetworkData');
                noisedata = get(newrefobj, 'NoiseData');
                powerdata = get(newrefobj, 'PowerData');
                dataname = get(newrefobj, 'Name');
                oip3 = get(newrefobj, 'OIP3');
                onedbc = get(newrefobj, 'OneDBC');
                ps = get(newrefobj, 'PS');
                agcs = get(newrefobj, 'GCS');
            end
        else
            if isa(newdata, 'rfdata.reference')
                newrefobj = newdata;
                netdata = get(newrefobj, 'NetworkData');
                noisedata = get(newrefobj, 'NoiseData');
                powerdata = get(newrefobj, 'PowerData');
                dataname = get(newrefobj, 'Name');
                oip3 = get(newrefobj, 'OIP3');
                onedbc = get(newrefobj, 'OneDBC');
                ps = get(newrefobj, 'PS');
                agcs = get(newrefobj, 'GCS');
            else
                if isa(newdata, 'rfdata.network')
                    netdata = newdata;
                else
                    error('The input must be an RFDATA.DATA, RFDATA.REFERENCE, or RFDATA.NETWORK object.');
                end
            end
        end
        if not(isa(netdata, 'rfdata.network')) && isa(newdata, 'rfdata.data')
            if not(isempty(get(newdata, 'Freq'))) && not(isempty(get(newdata, 'S_Parameters')))
                netdata = rfdata.network('Type', 'S_PARAMETERS', 'Freq', get(newdata, 'Freq'), 'Data', get(newdata, 'S_Parameters'), 'Z0', get(newdata, 'Z0'));
            else
                if not(isempty(get(newdata, 'Freq'))) && not(isempty(get(newdata, 'Y_Parameters')))
                    netdata = rfdata.network('Type', 'Y_PARAMETERS', 'Freq', get(newdata, 'Freq'), 'Data', get(newdata, 'Y_Parameters'), 'Z0', get(newdata, 'Z0'));
                end
            end
        end
        % 92 94
        set(refobj, 'NetworkData', netdata, 'NoiseData', noisedata, 'PowerData', powerdata, 'OIP3', oip3, 'OneDBC', onedbc, 'PS', ps, 'GCS', agcs);
        % 94 96
        if not(isempty(dataname))
            setname(refobj, dataname);
        end
    case 'AMPLIFIER'
        % 99 101
        dataname = '';
        newdata = varargin{1.0};
        netdata = [];
        noisedata = [];
        nfdata = [];
        powerdata = [];
        ip3data = [];
        oip3 = Inf;
        onedbc = Inf;
        ps = Inf;
        agcs = Inf;
        if isa(newdata, 'rfdata.data')
            newrefobj = getreference(newdata);
            if hasreference(newdata)
                netdata = get(newrefobj, 'NetworkData');
                noisedata = get(newrefobj, 'NoiseData');
                nfdata = get(newrefobj, 'NFData');
                powerdata = get(newrefobj, 'PowerData');
                ip3data = get(newrefobj, 'IP3Data');
                dataname = get(newrefobj, 'Name');
                oip3 = get(newrefobj, 'OIP3');
                onedbc = get(newrefobj, 'OneDBC');
                ps = get(newrefobj, 'PS');
                agcs = get(newrefobj, 'GCS');
            end
        else
            if isa(newdata, 'rfdata.reference')
                newrefobj = newdata;
                netdata = get(newrefobj, 'NetworkData');
                noisedata = get(newrefobj, 'NoiseData');
                nfdata = get(newrefobj, 'NFData');
                powerdata = get(newrefobj, 'PowerData');
                ip3data = get(newrefobj, 'IP3Data');
                dataname = get(newrefobj, 'Name');
                oip3 = get(newrefobj, 'OIP3');
                onedbc = get(newrefobj, 'OneDBC');
                ps = get(newrefobj, 'PS');
                agcs = get(newrefobj, 'GCS');
            else
                if isa(newdata, 'rfdata.network')
                    netdata = newdata;
                else
                    if isa(newdata, 'rfdata.power')
                        powerdata = newdata;
                    else
                        error('The input must be an RFDATA.DATA, RFDATA.REFERENCE, RFDATA.NETWORK or RFDATA.POWER object.');
                    end
                end
            end
        end
        if not(isa(netdata, 'rfdata.network')) && isa(newdata, 'rfdata.data')
            if not(isempty(get(newdata, 'Freq'))) && not(isempty(get(newdata, 'S_Parameters')))
                netdata = rfdata.network('Type', 'S_PARAMETERS', 'Freq', get(newdata, 'Freq'), 'Data', get(newdata, 'S_Parameters'), 'Z0', get(newdata, 'Z0'));
            else
                if not(isempty(get(newdata, 'Freq'))) && not(isempty(get(newdata, 'Y_Parameters')))
                    netdata = rfdata.network('Type', 'Y_PARAMETERS', 'Freq', get(newdata, 'Freq'), 'Data', get(newdata, 'Y_Parameters'), 'Z0', get(newdata, 'Z0'));
                end
            end
        end
        set(refobj, 'NetworkData', netdata, 'NoiseData', noisedata, 'NFData', nfdata, 'PowerData', powerdata, 'IP3Data', ip3data, 'OIP3', oip3, 'OneDBC', onedbc, 'PS', ps, 'GCS', agcs);
        % 160 162
        if not(isempty(dataname))
            setname(refobj, dataname);
        end
    end
    restore(h);
end
