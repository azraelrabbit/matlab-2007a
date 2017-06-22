function [type, netparameters, z0] = nwa(h, freq)
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
    % 11 12
    ckt = get(h, 'OriginalCkt');
    % 13 15
    % 14 15
    if isa(ckt.AnalyzedResult, 'rfdata.data') && hasp2dreference(ckt.AnalyzedResult)
        % 16 17
        type = 'S_Parameters';
        z0 = ckt.AnalyzedResult.Z0;
        netparameters = zeros(2.0, 2.0, length(freq));
        netparameters(1.0, 1.0, :) = 0.0;
        netparameters(2.0, 1.0, :) = 1.0;
        netparameters(1.0, 2.0, :) = 1.0;
        netparameters(2.0, 2.0, :) = 0.0;
        return;
    end % if
    % 26 28
    % 27 28
    set(ckt, 'DoAnalysis', true);
    [type, sdata, z0] = nwa(ckt, freq);
    data = getdata(ckt);
    % 31 33
    % 32 33
    set(data, 'S_Parameters', sdata, 'Freq', freq, 'Z0', z0);
    set(ckt, 'DoAnalysis', false);
    % 35 37
    % 36 37
    M = length(freq);
    netparameters(1.0, 1.0, :) = sdata(1.0, 1.0, :);
    netparameters(2.0, 1.0, :) = deal(1.0);
    netparameters(1.0, 2.0, 1.0:M) = deal(0.0);
    netparameters(2.0, 2.0, 1.0:M) = deal(0.0);
end % function
