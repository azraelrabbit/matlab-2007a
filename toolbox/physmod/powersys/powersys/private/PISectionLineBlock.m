function [sps, Multimeter, NewNode] = PISectionLineBlock(nl, sps, Multimeter, NewNode)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    idx = nl.filter_type('Pi Section Line');
    for i=1.0:length(idx)
        block = nl.elements(idx(i));
        SPSVerifyLinkStatus(block);
        BlockName = getfullname(block);
        BlockNom = strrep(BlockName(sps.syslength:end), char(10.0), ' ');
        measure = get_param(block, 'Measurements');
        [F, R, L, C, long, nbr] = getSPSmaskvalues(block, {'Frequency','Resistance','Inductance','Capacitance','Length','PiSections'});
        blocinit(block, cellhorzcat(F, R, L, C, long, nbr));
        w = mtimes(6.283185307179586, F);
        j = sqrt(-1.0);
        d = mrdivide(long, nbr);
        z = plus(R, mtimes(mtimes(j, w), L));
        y = mtimes(mtimes(j, w), C);
        Zc = sqrt(mrdivide(z, y));
        gamma = sqrt(mtimes(z, y));
        Z = mtimes(Zc, sinh(mtimes(gamma, d)));
        Ysur2 = mtimes(mrdivide(1.0, Zc), tanh(mrdivide(mtimes(gamma, d), 2.0)));
        Rres = real(Z);
        if lt(Rres, 0.0)
            message = horzcat('SimPowerSystems computed a negative equivalent resistance for the ''', BlockNom, ''' block. Please review the parameters you specified for this block to make sure they are realistic values.');
            Erreur.message = message;
            Erreur.identifier = 'SimPowerSystems:BlockParameterError';
            psberror(Erreur);
        end % if
        Lres = mtimes(mrdivide(imag(Z), w), 1000.0);
        if lt(Lres, 0.0)
            message = horzcat('SimPowerSystems computed a negative equivalent inductance for the ''', BlockNom, ''' block. Please review the parameters you specified for this block to make sure they are realistic values.');
            Erreur.message = message;
            Erreur.identifier = 'SimPowerSystems:BlockParameterError';
            psberror(Erreur);
        end % if
        Cres = mtimes(mrdivide(imag(Ysur2), w), 1e+06);
        if lt(Cres, 0.0)
            message = horzcat('SimPowerSystems computed a negative equivalent shunt capacitance for the ''', BlockNom, ''' block. Please review the parameters you specified for this block to make sure they are realistic values.');
            Erreur.message = message;
            Erreur.identifier = 'SimPowerSystems:BlockParameterError';
            psberror(Erreur);
        end % if
        % 48 49
        nodes = nl.block_nodes(block);
        % 50 51
        sps.rlc(plus(end, 1.0), 1.0:6.0) = horzcat(nodes(1.0), 0.0, 0.0, 0.0, 0.0, Cres);
        debut = size(sps.rlc, 1.0);
        sps.rlc(plus(end, 1.0), 1.0:6.0) = horzcat(nodes(1.0), NewNode, 0.0, Rres, Lres, 0.0);
        sps.rlcnames{plus(end, 1.0)} = horzcat('input: ', BlockNom);
        sps.rlcnames{plus(end, 1.0)} = horzcat('section_1: ', BlockNom);
        % 56 57
        for ii=2.0:nbr
            StartNode = NewNode;
            NewNode = plus(NewNode, 1.0);
            sps.rlc(plus(end, 1.0):plus(end, 2.0), 1.0:6.0) = vertcat(horzcat(StartNode, 0.0, 0.0, 0.0, 0.0, mtimes(2.0, Cres)), horzcat(StartNode, NewNode, 0.0, Rres, Lres, 0.0));
            % 61 63
            % 62 63
            sps.rlcnames{plus(end, 1.0)} = horzcat('section_', num2str(ii), ': ', BlockNom);
            sps.rlcnames{plus(end, 1.0)} = horzcat('section_', num2str(ii), ': ', BlockNom);
        end % for
        NewNode = plus(NewNode, 1.0);
        % 67 68
        sps.rlc(end, 2.0) = nodes(2.0);
        % 69 70
        sps.rlc(plus(end, 1.0), 1.0:6.0) = horzcat(nodes(2.0), 0.0, 0.0, 0.0, 0.0, Cres);
        sps.rlcnames{plus(end, 1.0)} = horzcat('output: ', BlockNom);
        % 72 73
        x = size(sps.rlc, 1.0);
        if strcmp('Input and output voltages', measure) || strcmp('All voltages and currents', measure)
            Multimeter.Yu(plus(end, 1.0), 1.0:2.0) = sps.rlc(debut, 1.0:2.0);
            Multimeter.Yu(plus(end, 1.0), 1.0:2.0) = sps.rlc(end, 1.0:2.0);
            Multimeter.V{plus(end, 1.0)} = horzcat('Us: ', BlockNom);
            Multimeter.V{plus(end, 1.0)} = horzcat('Ur: ', BlockNom);
        end % if
        if strcmp('Input and output currents', measure) || strcmp('All voltages and currents', measure)
            Multimeter.Yi{plus(end, 1.0), 1.0} = horzcat(debut, plus(debut, 1.0));
            Multimeter.Yi{plus(end, 1.0), 1.0} = horzcat(minus(x, 1.0), uminus(x));
            Multimeter.I{plus(end, 1.0)} = horzcat('Is: ', BlockNom);
            Multimeter.I{plus(end, 1.0)} = horzcat('Ir: ', BlockNom);
        end % if
    end % for
end % function
