function h = analyze(h, freq)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    resp = 1.0;
    delay = 0.0;
    if not(h.AllPassFilter)
        % 12 14
        ckt = get(h, 'RFckt');
        if isa(ckt, 'rfckt.network')
            if not(isempty(get(ckt, 'Ckts')))
                % 16 18
                if lt(nargin, 2.0)
                    freq = frequency(h);
                end
                % 20 22
                analyze(ckt, freq, ckt.AnalyzedResult.Zl, ckt.AnalyzedResult.Zs, ckt.AnalyzedResult.Z0);
            end
        else
            if not(isempty(ckt))
                if lt(nargin, 2.0)
                    freq = frequency(h);
                end
                % 28 30
                analyze(ckt, freq, ckt.AnalyzedResult.Zl, ckt.AnalyzedResult.Zs, ckt.AnalyzedResult.Z0);
            end
        end
        if isa(ckt, 'rfckt.rfckt')
            data = get(ckt, 'AnalyzedResult');
            if isa(data, 'rfdata.data')
                [resp, delay] = response(h, data.transfunc);
            end
        end
        % 38 40
    end
    set(h, 'ImpulseResp', resp, 'Delay', delay);
end
