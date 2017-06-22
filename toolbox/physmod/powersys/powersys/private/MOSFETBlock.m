function [sps, YuNonlinear] = MOSFETBlock(nl, sps, YuNonlinear)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    idx = nl.filter_type('Mosfet');
    for i=1.0:length(idx)
        block = nl.elements(idx(i));
        SPSVerifyLinkStatus(block);
        BlockName = getfullname(block);
        BlockNom = strrep(BlockName(sps.syslength:end), char(10.0), ' ');
        NotAllowedForPhasorSimulation(sps.PowerguiInfo.Phasor, BlockName, 'MOSFET');
        [R, L, Rd, condit, Rs, Cs] = getSPSmaskvalues(block, {'Ron','Lon','Rd','IC','Rs','Cs'});
        blocinit(block, cellhorzcat(R, L, Rd, condit, Rs, Cs));
        if eq(L, 0.0) || sps.PowerguiInfo.Discrete
            return;
        end % if
        % 21 22
        nodes = nl.block_nodes(block);
        if eq(Rs, Inf) || eq(Cs, 0.0)
        else
            % 25 26
            if eq(Cs, Inf)
                Cs = 0.0;
            end % if
            sps.rlc(plus(end, 1.0), 1.0:6.0) = horzcat(nodes(1.0), nodes(2.0), 0.0, Rs, 0.0, mtimes(Cs, 1e+06));
            sps.rlcnames{plus(end, 1.0)} = horzcat('snubber: ', BlockNom);
        end % if
        sps.switches(plus(end, 1.0), 1.0:5.0) = horzcat(nodes(1.0), nodes(2.0), and(condit, 1.0), R, mtimes(L, 1000.0));
        sps.source(plus(end, 1.0), 1.0:7.0) = horzcat(nodes(1.0), nodes(2.0), 1.0, 0.0, 0.0, 0.0, 11.0);
        sps.srcstr{plus(end, 1.0)} = horzcat('I_', BlockNom);
        sps.outstr{plus(end, 1.0)} = horzcat('U_', BlockNom);
        sps.sourcenames(plus(end, 1.0), 1.0) = block;
        YuNonlinear(plus(end, 1.0), 1.0:2.0) = horzcat(nodes(1.0), nodes(2.0));
        sps.NonlinearDevices.Tags{plus(end, 1.0)} = get_param(horzcat(BlockName, '/Uswitch'), 'GotoTag');
        sps.NonlinearDevices.Demux(plus(end, 1.0)) = 1.0;
        sps.U.Tags{plus(end, 1.0)} = get_param(horzcat(BlockName, '/ISWITCH'), 'GotoTag');
        sps.U.Mux(plus(end, 1.0)) = 1.0;
    end % for
end % function
