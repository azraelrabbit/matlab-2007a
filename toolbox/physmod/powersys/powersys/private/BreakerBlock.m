function [BlockCount, sps, YuSwitches, Multimeter] = BreakerBlock(nl, sps, YuSwitches, Multimeter)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    idx = nl.filter_type('Breaker');
    sps.SwitchDevices.qty = plus(sps.SwitchDevices.qty, length(idx));
    BlockCount = length(idx);
    for i=1.0:BlockCount
        block = nl.elements(idx(i));
        SPSVerifyLinkStatus(block);
        BlockName = getfullname(block);
        BlockNom = strrep(BlockName(sps.syslength:end), char(10.0), ' ');
        measure = get_param(block, 'Measurements');
        [R, condit, Rs, Cs, comext, NoBreakLoop] = getSPSmaskvalues(block, {'BreakerResistance','InitialState','SnubberResistance','SnubberCapacitance','External','NoBreakLoop'});
        blocinit(block, cellhorzcat(R, condit, Rs, Cs, comext, 0.0, 'on'));
        % 19 21
        nodes = nl.block_nodes(block);
        if eq(Rs, Inf) || eq(Cs, 0.0)
        else
            % 23 25
            if eq(Cs, Inf)
                Cs = 0.0;
            end % if
            if ne(nodes(1.0), nodes(2.0))
                sps.rlc(plus(end, 1.0), 1.0:6.0) = horzcat(nodes(1.0), nodes(2.0), 0.0, Rs, 0.0, mtimes(Cs, 1e+06));
                sps.rlcnames{plus(end, 1.0)} = horzcat('snubber: ', BlockNom);
            end % if
        end % if
        sps.Rswitch(plus(end, 1.0)) = R;
        sps.sourcenames(plus(end, 1.0), 1.0) = block;
        sps.source(plus(end, 1.0), 1.0:7.0) = horzcat(nodes(1.0), nodes(2.0), 1.0, 0.0, 0.0, 0.0, 2.0);
        sps.switches(plus(end, 1.0), 1.0:5.0) = horzcat(nodes(1.0), nodes(2.0), and(condit, 1.0), R, 0.0);
        sps.srcstr{plus(end, 1.0)} = horzcat('I_', BlockNom);
        sps.outstr{plus(end, 1.0)} = horzcat('U_', BlockNom);
        YuSwitches(plus(end, 1.0), 1.0:2.0) = horzcat(nodes(1.0), nodes(2.0));
        x = size(sps.source, 1.0);
        if strcmp('Branch voltage', measure) || strcmp('Branch voltage and current', measure)
            Multimeter.Yu(plus(end, 1.0), 1.0:2.0) = sps.source(end, 1.0:2.0);
            Multimeter.V{plus(end, 1.0)} = horzcat('Ub: ', BlockNom);
        end % if
        if strcmp('Branch current', measure) || strcmp('Branch voltage and current', measure)
            Multimeter.I{plus(end, 1.0)} = horzcat('Ib: ', BlockNom);
            Multimeter.Yi{plus(end, 1.0), 2.0} = x;
        end % if
        sps.modelnames{2.0}(plus(end, 1.0)) = block;
        sps.SwitchType(plus(end, 1.0)) = 2.0;
        if eq(sps.PowerguiInfo.Phasor, 0.0)
            sps.Status.Tags{plus(end, 1.0)} = get_param(horzcat(BlockName, '/Status'), 'GotoTag');
            sps.Status.Demux(plus(end, 1.0)) = 1.0;
        end % if
        sps.Gates.Tags{plus(end, 1.0)} = get_param(horzcat(BlockName, '/Goto'), 'GotoTag');
        sps.Gates.Mux(plus(end, 1.0)) = 1.0;
        sps.SwitchDevices.Tags{plus(end, 1.0)} = get_param(horzcat(BlockName, '/Uswitch'), 'GotoTag');
        sps.SwitchDevices.Demux(plus(end, 1.0)) = 1.0;
        sps.SwitchGateInitialValue(plus(end, 1.0)) = condit;
    end % for
