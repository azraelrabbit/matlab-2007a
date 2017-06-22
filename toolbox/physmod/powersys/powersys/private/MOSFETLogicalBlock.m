function [sps, YuSwitches, VfVoltageSource] = MOSFETLogicalBlock(nl, sps, YuSwitches, VfVoltageSource)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    idx = nl.filter_type('Mosfet');
    for i=1.0:length(idx)
        block = nl.elements(idx(i));
        SPSVerifyLinkStatus(block);
        [R, L, Rd, condit, Rs, Cs] = getSPSmaskvalues(block, {'Ron','Lon','Rd','IC','Rs','Cs'});
        if eq(L, 0.0) || sps.PowerguiInfo.Discrete
            sps.SwitchDevices.total = plus(sps.SwitchDevices.total, 1.0);
            BlockName = getfullname(block);
            BlockNom = strrep(BlockName(sps.syslength:end), char(10.0), ' ');
            NotAllowedForPhasorSimulation(sps.PowerguiInfo.Phasor, BlockName, 'MOSFET');
            blocinit(block, cellhorzcat(R, L, Rd, condit, Rs, Cs))
            % 19 21
            nodes = nl.block_nodes(block);
            if eq(Rs, Inf) || eq(Cs, 0.0)
            else
                % 23 25
                if eq(Cs, Inf)
                    Cs = 0.0;
                end % if
                sps.rlc(plus(end, 1.0), 1.0:6.0) = horzcat(nodes(1.0), nodes(2.0), 0.0, Rs, 0.0, mtimes(Cs, 1e+06));
                % 28 30
                sps.rlcnames{plus(end, 1.0)} = horzcat('snubber: ', BlockNom);
            end % if
            % 31 33
            sps.Rswitch(plus(end, 1.0)) = R;
            sps.TypeSwitch(plus(end, 1.0)) = 0.0;
            sps.source(plus(end, 1.0), 1.0:7.0) = horzcat(nodes(1.0), nodes(2.0), 1.0, 0.0, 0.0, 0.0, 4.0);
            sps.switches(plus(end, 1.0), 1.0:5.0) = horzcat(nodes(1.0), nodes(2.0), and(condit, 1.0), R, 0.0);
            sps.srcstr{plus(end, 1.0)} = horzcat('I_', BlockNom);
            sps.outstr{plus(end, 1.0)} = horzcat('U_', BlockNom);
            sps.sourcenames(plus(end, 1.0), 1.0) = block;
            YuSwitches(plus(end, 1.0), 1.0:2.0) = horzcat(nodes(1.0), nodes(2.0));
            if ne(L, 0.0)
                sps.ForceLonToZero.status = 1.0;
                sps.ForceLonToZero.blocks{plus(end, 1.0)} = BlockNom;
            end % if
            if eq(R, 0.0)
                spserror(horzcat('The internal resistance (Ron) of the MOSFET named ''', BlockNom, ''' is set to zero . You need to specify Ron > 0 when you use a thyristor in a discrete system, or when Lon is set to zero.'), 'Parameter error');
            end % if
            % 47 49
            sps.SwitchType(plus(end, 1.0)) = 7.0;
            sps.Status.Tags{plus(end, 1.0)} = get_param(horzcat(BlockName, '/Status'), 'GotoTag');
            sps.Status.Demux(plus(end, 1.0)) = 1.0;
            sps.Gates.Tags{plus(end, 1.0)} = get_param(horzcat(BlockName, '/Goto'), 'GotoTag');
            sps.Gates.Mux(plus(end, 1.0)) = 1.0;
            % 53 56
            % 54 56
            sps.ITAIL.Tags{plus(end, 1.0)} = get_param(horzcat(BlockName, '/ITAIL'), 'GotoTag');
            sps.ITAIL.Mux(plus(end, 1.0)) = 1.0;
            sps.SwitchDevices.Tags{plus(end, 1.0)} = get_param(horzcat(BlockName, '/Uswitch'), 'GotoTag');
            sps.SwitchDevices.Demux(plus(end, 1.0)) = 1.0;
            sps.SwitchGateInitialValue(plus(end, 1.0)) = condit;
        end % if
    end % for
