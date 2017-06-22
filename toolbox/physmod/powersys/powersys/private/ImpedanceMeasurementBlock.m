function [sps, YuImpedance] = ImpedanceMeasurementBlock(nl, sps)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    idx = nl.filter_type('Impedance Measurement');
    YuImpedance = [];
    for i=1.0:length(idx)
        block = nl.elements(idx(i));
        SPSVerifyLinkStatus(block);
        BlockName = getfullname(block);
        BlockNom = strrep(BlockName(sps.syslength:end), char(10.0), ' ');
        Factor = getSPSmaskvalues(block, {'Factor'});
        blocinit(block, cellhorzcat(Factor));
        % 18 20
        % 19 20
        nodes = nl.block_nodes(block);
        % 21 22
        sps.source(plus(end, 1.0), 1.0:7.0) = horzcat(nodes(2.0), nodes(1.0), 1.0, 0.0, 0.0, 60.0, 20.0);
        % 23 24
        YuImpedance(plus(end, 1.0), 1.0:2.0) = horzcat(nodes(1.0), nodes(2.0));
        % 25 26
        sps.srcstr{plus(end, 1.0)} = horzcat('I_', BlockNom);
        sps.outstr{plus(end, 1.0)} = horzcat('U_', BlockNom);
        % 28 29
        sps.Zblocks{plus(end, 1.0), 1.0} = getfullname(block);
        sps.Zblocks{end, 2.0} = length(sps.srcstr);
        sps.Zblocks{end, 3.0} = length(sps.outstr);
        sps.Zblocks{end, 4.0} = Factor;
        % 33 34
        xc = size(sps.modelnames{20.0}, 2.0);
        sps.modelnames{20.0}(plus(xc, 1.0)) = block;
        sps.sourcenames(plus(end, 1.0), 1.0) = block;
        % 37 38
        sps.NonlinearDevices.Tags{plus(end, 1.0)} = '';
        sps.NonlinearDevices.Demux(plus(end, 1.0)) = 1.0;
        sps.U.Tags{plus(end, 1.0)} = '';
        sps.U.Mux(plus(end, 1.0)) = 1.0;
    end % for
    sps.nbmodels(20.0) = size(sps.modelnames{20.0}, 2.0);
end % function
