function [sps, YuNonlinear, Multimeter] = DistributedParameterLineBlock(nl, sps, YuNonlinear, Multimeter)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    idx = nl.filter_type('Distributed Parameters Line');
    sps.DistributedParameterLine = length(idx);
    % 10 12
    for i=1.0:sps.DistributedParameterLine
        % 12 14
        block = nl.elements(idx(i));
        SPSVerifyLinkStatus(block);
        BlockName = getfullname(block);
        BlockNom = strrep(BlockName(sps.syslength:end), char(10.0), ' ');
        measure = get_param(block, 'Measurements');
        [nphase, freq, Rmat, Lmat, Cmat, long] = getSPSmaskvalues(block, {'Phases','Frequency','Resistance','Inductance','Capacitance','Length'});
        blocinit(block, cellhorzcat(nphase, freq, Rmat, Lmat, Cmat, long));
        % 20 28
        % 21 28
        % 22 28
        % 23 28
        % 24 28
        % 25 28
        % 26 28
        nodes = nl.block_nodes(block);
        % 28 31
        % 29 31
        x = plus(size(sps.source, 1.0), 1.0);
        % 31 34
        % 32 34
        [Zm, Rm, Smode, Ti] = blmodlin(nphase, freq, Rmat, Lmat, Cmat);
        if sps.PowerguiInfo.Discrete
            % 35 37
            Vmax = max(Smode);
            Ts_min = mrdivide(long, Vmax);
            if gt(sps.PowerguiInfo.Ts, Ts_min)
                % 39 42
                % 40 42
                message = horzcat('The Distributed Parameters Line block ''', BlockNom, ''' has at least one mode having a propagation time', char(10.0), 'which is smaller than the sample time you specify in the Powergui block.', char(10.0), 'In order to simulate this model, you must use a time step lower than ', num2str(Ts_min), ' sec.', char(10.0), 'For short lines you may also use a PI Section Line model.');
                % 42 49
                % 43 49
                % 44 49
                % 45 49
                % 46 49
                % 47 49
                Erreur.message = message;
                Erreur.identifier = 'SimPowerSystems:BlockParameterError';
                psberror(Erreur);
            end
        end
        to = rdivide(long, Smode);
        Zimp = zeros(nphase, nphase);
        for iphase=1.0:nphase
            Zimp(iphase, iphase) = plus(Zm(iphase), mtimes(mtimes(.25, Rm(iphase)), long));
        end % for
        Yphase = mtimes(Ti, inv(Zimp)) * Ti';
        % 59 62
        % 60 62
        distlinex = horzcat(nphase, x, plus(length(sps.outstr), 1.0), long, Zm, Rm, Smode, reshape(Ti, 1.0, mpower(nphase, 2.0)));
        sps.distline(plus(size(sps.distline, 1.0), 1.0), 1.0:length(distlinex)) = distlinex;
        % 63 67
        % 64 67
        % 65 67
        for jj=1.0:nphase
            % 67 69
            sps.rlc(plus(end, 1.0), 1.0:6.0) = horzcat(nodes(jj), 0.0, 0.0, mrdivide(1.0, sum(Yphase(jj, :))), 0.0, 0.0);
            sps.rlcnames{plus(end, 1.0)} = horzcat('r_', num2str(jj), '_in: ', BlockNom);
            % 70 72
            sps.source(plus(end, 1.0), 1.0:7.0) = horzcat(0.0, nodes(jj), 1.0, 0.0, 0.0, 0.0, 19.0);
            % 72 74
            YuNonlinear(plus(end, 1.0), 1.0:2.0) = horzcat(nodes(jj), 0.0);
            % 74 77
            % 75 77
            sps.srcstr{plus(end, 1.0)} = horzcat('I_in_phase_', num2str(jj), ': ', BlockNom);
            sps.outstr{plus(end, 1.0)} = horzcat('U_in_phase_', num2str(jj), ': ', BlockNom);
            % 78 80
            sps.sourcenames(plus(end, 1.0), 1.0) = block;
            % 80 82
            switch measure
            case {'Phase-to-ground voltages','All voltages and currents'}
                Multimeter.Yu(plus(end, 1.0), 1.0:2.0) = sps.rlc(end, 1.0:2.0);
                Multimeter.V{plus(end, 1.0)} = horzcat('Us_ph', num2str(jj), '_gnd: ', BlockNom);
                % 85 87
            end
        end % for
        for jj=1.0:nphase
            for k=plus(jj, 1.0):nphase
                sps.rlc(plus(end, 1.0), 1.0:6.0) = horzcat(nodes(jj), nodes(k), 0.0, mrdivide(-1.0, Yphase(jj, k)), 0.0, 0.0);
                sps.rlcnames{plus(end, 1.0)} = horzcat('r_', num2str(jj), '_', num2str(k), '_in: ', BlockNom);
            end % for
        end % for
        % 94 96
        for jj=1.0:nphase
            for k=plus(jj, 1.0):nphase
                sps.rlc(plus(end, 1.0), 1.0:6.0) = horzcat(nodes(plus(nphase, jj)), nodes(plus(nphase, k)), 0.0, mrdivide(-1.0, Yphase(jj, k)), 0.0, 0.0);
                sps.rlcnames{plus(end, 1.0)} = horzcat('r_', num2str(jj), '_', num2str(k), '_out: ', BlockNom);
            end % for
        end % for
        % 101 103
        for jj=1.0:nphase
            sps.rlc(plus(end, 1.0), 1.0:6.0) = horzcat(nodes(plus(nphase, jj)), 0.0, 0.0, mrdivide(1.0, sum(Yphase(jj, :))), 0.0, 0.0);
            sps.rlcnames{plus(end, 1.0)} = horzcat('r_', num2str(jj), '_out: ', BlockNom);
            % 105 107
            sps.source(plus(end, 1.0), 1.0:7.0) = horzcat(0.0, nodes(plus(nphase, jj)), 1.0, 0.0, 0.0, 0.0, 19.0);
            % 107 110
            % 108 110
            YuNonlinear(plus(end, 1.0), 1.0:2.0) = horzcat(nodes(plus(nphase, jj)), 0.0);
            % 110 112
            sps.srcstr{plus(end, 1.0)} = horzcat('I_out_phase_', num2str(jj), ': ', BlockNom);
            sps.outstr{plus(end, 1.0)} = horzcat('U_out_phase_', num2str(jj), ': ', BlockNom);
            % 113 115
            sps.sourcenames(plus(end, 1.0), 1.0) = block;
            % 115 117
            switch measure
            case {'Phase-to-ground voltages','All voltages and currents'}
                Multimeter.Yu(plus(end, 1.0), 1.0:2.0) = sps.rlc(end, 1.0:2.0);
                Multimeter.V{plus(end, 1.0)} = horzcat('Ur_ph', num2str(jj), '_gnd: ', BlockNom);
                % 120 122
            end
        end % for
        % 123 126
        % 124 126
        xc = size(sps.modelnames{19.0}, 2.0);
        sps.modelnames{19.0}(plus(xc, 1.0)) = block;
        % 127 130
        % 128 130
        sps.NonlinearDevices.Tags{plus(end, 1.0)} = get_param(horzcat(BlockName, '/From'), 'GotoTag');
        sps.NonlinearDevices.Demux(plus(end, 1.0)) = mtimes(2.0, nphase);
        sps.U.Tags{plus(end, 1.0)} = get_param(horzcat(BlockName, '/Goto'), 'GotoTag');
        sps.U.Mux(plus(end, 1.0)) = mtimes(2.0, nphase);
    end % for
end
