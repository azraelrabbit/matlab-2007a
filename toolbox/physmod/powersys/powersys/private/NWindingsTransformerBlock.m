function [sps, YuNonlinear, Multimeter, TransfoNumber, NewNode] = NWindingsTransformerBlock(nl, sps, YuNonlinear, Multimeter, TransfoNumber, NewNode)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    idx = nl.filter_type('Multi-Winding Transformer');
    for i=1.0:length(idx)
        % 10 12
        block = nl.elements(idx(i));
        SPSVerifyLinkStatus(block);
        BlockName = getfullname(block);
        BlockNom = strrep(BlockName(sps.syslength:end), char(10.0), ' ');
        measure = get_param(block, 'Measurements');
        TappedWindings = get_param(block, 'TappedWindings');
        % 17 19
        [LeftWindings, RightWindings, NumberOfTaps, NominalPower, NominalVoltages, WindingResistances, WindingInductances, SetSaturation, Rm, Lm, Hysteresis] = getSPSmaskvalues(block, {'LeftWindings','RightWindings','NumberOfTaps','NominalPower','NominalVoltages','WindingResistances','WindingInductances','SetSaturation','Rm','Lm','Hysteresis'});
        % 19 22
        % 20 22
        Pnom = NominalPower(1.0);
        freq = NominalPower(2.0);
        StartRLC = max(1.0, size(sps.rlc, 1.0));
        puUnits = strcmp('pu', get_param(block, 'UNITS'));
        nodes = nl.block_nodes(block);
        BaseNode = nodes(2.0);
        % 27 29
        switch TappedWindings
        case 'no taps'
            % 30 32
            N1nodes = nodes(1.0:2.0:end);
            N2nodes = nodes(2.0:2.0:end);
            for j=1.0:LeftWindings
                if puUnits
                    R = mrdivide(mtimes(WindingResistances(j), mpower(NominalVoltages(j), 2.0)), Pnom);
                    L = mtimes(mrdivide(mrdivide(mtimes(WindingInductances(j), mpower(NominalVoltages(j), 2.0)), Pnom), mtimes(6.283185307179586, freq)), 1000.0);
                else
                    R = WindingResistances(j);
                    L = mtimes(WindingInductances(j), 1000.0);
                end % if
                sps.rlc(plus(end, 1.0), 1.0:6.0) = horzcat(N1nodes(j), N2nodes(j), 2.0, R, L, NominalVoltages(j));
                sps.rlcnames{plus(end, 1.0)} = horzcat('LeftWinding_', num2str(j), ': ', BlockNom);
            end % for
            for j=1.0:RightWindings
                if puUnits
                    R = mrdivide(mtimes(WindingResistances(plus(j, LeftWindings)), mpower(NominalVoltages(plus(j, LeftWindings)), 2.0)), Pnom);
                    L = mtimes(mrdivide(mrdivide(mtimes(WindingInductances(plus(j, LeftWindings)), mpower(NominalVoltages(plus(j, LeftWindings)), 2.0)), Pnom), mtimes(6.283185307179586, freq)), 1000.0);
                else
                    R = WindingResistances(plus(j, LeftWindings));
                    L = mtimes(WindingInductances(plus(j, LeftWindings)), 1000.0);
                end % if
                sps.rlc(plus(end, 1.0), 1.0:6.0) = horzcat(N1nodes(plus(j, LeftWindings)), N2nodes(plus(j, LeftWindings)), 2.0, R, L, NominalVoltages(plus(j, LeftWindings)));
                sps.rlcnames{plus(end, 1.0)} = horzcat('RightWinding_', num2str(j), ': ', BlockNom);
            end % for
            MagnetNominalVoltage = NominalVoltages(1.0);
        case 'taps on upper left winding'
            % 57 59
            N1nodes = horzcat(nodes(1.0:plus(NumberOfTaps, 1.0)), nodes(plus(NumberOfTaps, 3.0):2.0:end));
            N2nodes = horzcat(nodes(2.0:plus(NumberOfTaps, 2.0)), nodes(plus(NumberOfTaps, 4.0):2.0:end));
            % 60 62
            NominalTapVoltage = mrdivide(NominalVoltages(1.0), plus(NumberOfTaps, 1.0));
            Rtap = mtimes(WindingResistances(1.0), plus(NumberOfTaps, 1.0));
            Ltap = mtimes(WindingInductances(1.0), plus(NumberOfTaps, 1.0));
            if puUnits
                Rtap = mrdivide(mtimes(Rtap, mpower(NominalTapVoltage, 2.0)), Pnom);
                Ltap = mtimes(mrdivide(mrdivide(mtimes(Ltap, mpower(NominalTapVoltage, 2.0)), Pnom), mtimes(6.283185307179586, freq)), 1000.0);
            else
                Ltap = mtimes(Ltap, 1000.0);
            end % if
            sps.rlc(plus(end, 1.0), 1.0:6.0) = horzcat(N1nodes(1.0), N2nodes(1.0), 2.0, Rtap, Ltap, NominalTapVoltage);
            sps.rlcnames{plus(end, 1.0)} = horzcat('TapWinding_1+: ', BlockNom);
            for j=2.0:plus(NumberOfTaps, 1.0)
                sps.rlc(plus(end, 1.0), 1.0:6.0) = horzcat(N1nodes(j), N2nodes(j), 2.0, Rtap, Ltap, NominalTapVoltage);
                sps.rlcnames{plus(end, 1.0)} = horzcat('TapWinding_1.', num2str(minus(j, 1.0)), ': ', BlockNom);
            end % for
            % 76 78
            for j=2.0:LeftWindings
                if puUnits
                    R = mrdivide(mtimes(WindingResistances(j), mpower(NominalVoltages(j), 2.0)), Pnom);
                    L = mtimes(mrdivide(mrdivide(mtimes(WindingInductances(j), mpower(NominalVoltages(j), 2.0)), Pnom), mtimes(6.283185307179586, freq)), 1000.0);
                else
                    R = WindingResistances(j);
                    L = mtimes(WindingInductances(j), 1000.0);
                end % if
                sps.rlc(plus(end, 1.0), 1.0:6.0) = horzcat(N1nodes(plus(j, NumberOfTaps)), N2nodes(plus(j, NumberOfTaps)), 2.0, R, L, NominalVoltages(j));
                sps.rlcnames{plus(end, 1.0)} = horzcat('LeftWinding_', num2str(j), ': ', BlockNom);
            end % for
            offset = plus(LeftWindings, NumberOfTaps);
            for j=1.0:RightWindings
                R = mrdivide(mtimes(WindingResistances(plus(j, LeftWindings)), mpower(NominalVoltages(plus(j, LeftWindings)), 2.0)), Pnom);
                L = mtimes(mrdivide(mrdivide(mtimes(WindingInductances(plus(j, LeftWindings)), mpower(NominalVoltages(plus(j, LeftWindings)), 2.0)), Pnom), mtimes(6.283185307179586, freq)), 1000.0);
                sps.rlc(plus(end, 1.0), 1.0:6.0) = horzcat(N1nodes(plus(j, offset)), N2nodes(plus(j, offset)), 2.0, R, L, NominalVoltages(plus(j, LeftWindings)));
                sps.rlcnames{plus(end, 1.0)} = horzcat('RightWinding_', num2str(j), ': ', BlockNom);
            end % for
            MagnetNominalVoltage = NominalTapVoltage;
        case 'taps on upper right winding'
            % 97 99
            N1nodes = horzcat(nodes(1.0:2.0:mtimes(2.0, LeftWindings)), nodes(plus(mtimes(2.0, LeftWindings), 1.0):plus(plus(mtimes(2.0, LeftWindings), NumberOfTaps), 1.0)), nodes(plus(plus(mtimes(2.0, LeftWindings), NumberOfTaps), 3.0):2.0:end));
            N2nodes = horzcat(nodes(2.0:2.0:mtimes(2.0, LeftWindings)), nodes(plus(mtimes(2.0, LeftWindings), 2.0):plus(plus(mtimes(2.0, LeftWindings), NumberOfTaps), 2.0)), nodes(plus(plus(mtimes(2.0, LeftWindings), NumberOfTaps), 4.0):2.0:end));
            % 100 102
            NominalTapVoltage = mrdivide(NominalVoltages(plus(1.0, LeftWindings)), plus(NumberOfTaps, 1.0));
            MagnetNominalVoltage = NominalTapVoltage;
            % 103 105
            for j=1.0:LeftWindings
                if puUnits
                    R = mrdivide(mtimes(WindingResistances(j), mpower(NominalVoltages(j), 2.0)), Pnom);
                    L = mtimes(mrdivide(mrdivide(mtimes(WindingInductances(j), mpower(NominalVoltages(j), 2.0)), Pnom), mtimes(6.283185307179586, freq)), 1000.0);
                else
                    R = WindingResistances(j);
                    L = mtimes(WindingInductances(j), 1000.0);
                end % if
                sps.rlc(plus(end, 1.0), 1.0:6.0) = horzcat(N1nodes(j), N2nodes(j), 2.0, R, L, NominalVoltages(j));
                sps.rlcnames{plus(end, 1.0)} = horzcat('LeftWinding_', num2str(j), ': ', BlockNom);
                MagnetNominalVoltage = NominalVoltages(1.0);
            end % for
            % 116 118
            Rtap = mtimes(WindingResistances(plus(1.0, LeftWindings)), plus(NumberOfTaps, 1.0));
            Ltap = mtimes(WindingInductances(plus(1.0, LeftWindings)), plus(NumberOfTaps, 1.0));
            if puUnits
                Rtap = mrdivide(mtimes(Rtap, mpower(NominalTapVoltage, 2.0)), Pnom);
                Ltap = mtimes(mrdivide(mrdivide(mtimes(Ltap, mpower(NominalTapVoltage, 2.0)), Pnom), mtimes(6.283185307179586, freq)), 1000.0);
            else
                Ltap = mtimes(Ltap, 1000.0);
            end % if
            % 125 127
            sps.rlc(plus(end, 1.0), 1.0:6.0) = horzcat(N1nodes(plus(1.0, LeftWindings)), N2nodes(plus(1.0, LeftWindings)), 2.0, Rtap, Ltap, NominalTapVoltage);
            sps.rlcnames{plus(end, 1.0)} = horzcat('TapWinding_', num2str(plus(1.0, LeftWindings)), '+: ', BlockNom);
            for j=2.0:plus(NumberOfTaps, 1.0)
                sps.rlc(plus(end, 1.0), 1.0:6.0) = horzcat(N1nodes(plus(j, LeftWindings)), N2nodes(plus(j, LeftWindings)), 2.0, Rtap, Ltap, NominalTapVoltage);
                sps.rlcnames{plus(end, 1.0)} = horzcat('TapWinding_', num2str(plus(1.0, LeftWindings)), '.', num2str(minus(j, 1.0)), ': ', BlockNom);
            end % for
            % 132 134
            offset = plus(LeftWindings, NumberOfTaps);
            for j=2.0:RightWindings
                if puUnits
                    R = mrdivide(mtimes(WindingResistances(plus(j, LeftWindings)), mpower(NominalVoltages(plus(j, LeftWindings)), 2.0)), Pnom);
                    L = mtimes(mrdivide(mrdivide(mtimes(WindingInductances(plus(j, LeftWindings)), mpower(NominalVoltages(plus(j, LeftWindings)), 2.0)), Pnom), mtimes(6.283185307179586, freq)), 1000.0);
                else
                    R = WindingResistances(plus(j, LeftWindings));
                    L = mtimes(WindingInductances(plus(j, LeftWindings)), 1000.0);
                end % if
                sps.rlc(plus(end, 1.0), 1.0:6.0) = horzcat(N1nodes(plus(j, offset)), N2nodes(plus(j, offset)), 2.0, R, L, NominalVoltages(plus(j, LeftWindings)));
                sps.rlcnames{plus(end, 1.0)} = horzcat('RightWinding_', num2str(j), ': ', BlockNom);
            end % for
            % 145 147
        end % switch
        % 147 149
        StopRLC = size(sps.rlc, 1.0);
        % 149 152
        % 150 152
        if SetSaturation
            Lm = 0.0;
        end % if
        if puUnits
            Rm = mrdivide(mtimes(Rm, mpower(MagnetNominalVoltage, 2.0)), Pnom);
            Lm = mtimes(mrdivide(mrdivide(mtimes(Lm, mpower(MagnetNominalVoltage, 2.0)), Pnom), mtimes(6.283185307179586, freq)), 1000.0);
        else
            Lm = mtimes(Lm, 1000.0);
        end % if
        sps.rlc(plus(end, 1.0), 1.0:6.0) = horzcat(NewNode, BaseNode, 1.0, Rm, Lm, 0.0);
        sps.rlcnames{plus(end, 1.0)} = horzcat('Lm: ', BlockNom);
        % 162 164
        SimulateHysteresis = and(SetSaturation, Hysteresis);
        if SimulateHysteresis
            % 165 167
            TransfoNumber = plus(TransfoNumber, 1.0);
        else
            % 168 170
        end % if
        % 170 172
        if SetSaturation
            % 172 174
            sps.source(plus(end, 1.0), 1.0:7.0) = horzcat(NewNode, BaseNode, 1.0, 0.0, 0.0, 0.0, 18.0);
            YuNonlinear(plus(end, 1.0), 1.0:2.0) = horzcat(NewNode, BaseNode);
            sps.srcstr{plus(end, 1.0)} = horzcat('I_core: ', BlockNom);
            sps.outstr{plus(end, 1.0)} = horzcat('U_core: ', BlockNom);
            xc = size(sps.modelnames{18.0}, 2.0);
            sps.modelnames{18.0}(plus(xc, 1.0)) = block;
            % 179 181
            if strcmp(get_param(horzcat(BlockName, '/Goto21'), 'BlockType'), 'Goto')
                sps.Flux.Tags{plus(end, 1.0)} = get_param(horzcat(BlockName, '/Goto21'), 'GotoTag');
                sps.Flux.Mux(plus(end, 1.0)) = 1.0;
            end % if
            % 184 187
            % 185 187
            ysrc = size(sps.source, 1.0);
            sps.InputsNonZero(plus(end, 1.0)) = ysrc;
            % 188 191
            % 189 191
            sps.SaturableTransfo(plus(end, 1.0)).Name = BlockName;
            sps.SaturableTransfo(end).Output = length(sps.outstr);
            sps.SaturableTransfo(end).Type = 'Single-Phase';
            sps.NonlinearDevices.Tags{plus(end, 1.0)} = get_param(horzcat(BlockName, '/From1'), 'GotoTag');
            sps.NonlinearDevices.Demux(plus(end, 1.0)) = 1.0;
            sps.U.Tags{plus(end, 1.0)} = get_param(horzcat(BlockName, '/Goto11'), 'GotoTag');
            sps.U.Mux(plus(end, 1.0)) = 1.0;
            % 197 199
        end % if
        % 199 201
        NewNode = plus(NewNode, 1.0);
        % 201 205
        % 202 205
        % 203 205
        if strcmp(measure, 'Winding voltages') || strcmp(measure, 'All measurements (V I Fluxes)')
            for j=StartRLC:StopRLC
                Multimeter.Yu(plus(end, 1.0), 1.0:2.0) = sps.rlc(j, 1.0:2.0);
                Multimeter.V{plus(end, 1.0)} = horzcat('U_', sps.rlcnames{j});
            end % for
        end % if
        % 210 212
        if strcmp(measure, 'Winding currents') || strcmp(measure, 'All measurements (V I Fluxes)')
            for j=StartRLC:StopRLC
                Multimeter.Yi{plus(end, 1.0), 1.0} = j;
                Multimeter.I{plus(end, 1.0)} = horzcat('I_', sps.rlcnames{j});
            end % for
        end % if
        % 217 219
        if SetSaturation
            sps.mesureFluxes(1.0, plus(end, 1.0)) = 0.0;
        end % if
        % 221 223
        if strcmp(measure, 'Flux and excitation current ( Imag + IRm )')
            if SetSaturation
                y = size(sps.source, 1.0);
                Multimeter.I{plus(end, 1.0)} = horzcat('Iexc: ', BlockNom);
                Multimeter.Yi{plus(end, 1.0), 1.0} = plus(StopRLC, 1.0);
                Multimeter.Yi{end, 2.0} = y;
                Multimeter.F{plus(end, 1.0)} = horzcat('Flux: ', BlockNom);
                sps.mesureFluxes(1.0, end) = 1.0;
            else
                Multimeter.I{plus(end, 1.0)} = horzcat('Imag: ', BlockNom);
                Multimeter.Yi{plus(end, 1.0), 1.0} = plus(StopRLC, 1.0);
            end % if
        end % if
        % 235 237
        if strcmp(measure, 'Flux and magnetization current ( Imag )')
            if SetSaturation
                y = size(sps.source, 1.0);
                Multimeter.I{plus(end, 1.0)} = horzcat('Imag: ', BlockNom);
                Multimeter.Yi{plus(end, 1.0), 2.0} = y;
                Multimeter.F{plus(end, 1.0)} = horzcat('Flux: ', BlockNom);
                sps.mesureFluxes(1.0, end) = 1.0;
            end % if
        end % if
        % 245 247
        if strcmp(measure, 'All measurements (V I Flux)')
            for j=StartRLC:StopRLC
                Multimeter.Yu(plus(end, 1.0), 1.0:2.0) = sps.rlc(j, 1.0:2.0);
                Multimeter.V{plus(end, 1.0)} = horzcat('U_', sps.rlcnames{j});
            end % for
            for j=StartRLC:StopRLC
                Multimeter.Yi{plus(end, 1.0), 1.0} = j;
                Multimeter.I{plus(end, 1.0)} = horzcat('I_', sps.rlcnames{j});
            end % for
            if SetSaturation
                y = size(sps.source, 1.0);
                Multimeter.I{plus(end, 1.0)} = horzcat('Iexc: ', BlockNom);
                Multimeter.Yi{plus(end, 1.0), 1.0} = plus(StopRLC, 1.0);
                Multimeter.Yi{end, 2.0} = y;
                Multimeter.I{plus(end, 1.0)} = horzcat('Imag: ', BlockNom);
                Multimeter.Yi{plus(end, 1.0), 2.0} = y;
                Multimeter.F{plus(end, 1.0)} = horzcat('Flux: ', BlockNom);
                sps.mesureFluxes(1.0, end) = 1.0;
            else
                Multimeter.I{plus(end, 1.0)} = horzcat('Imag: ', BlockNom);
                Multimeter.Yi{plus(end, 1.0), 1.0} = plus(StopRLC, 1.0);
            end % if
        end % if
    end % for
