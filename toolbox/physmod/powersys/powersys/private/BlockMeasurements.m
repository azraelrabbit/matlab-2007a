function Multimeter = BlockMeasurements(block, rlc, Multimeter)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    BlockFullName = getfullname(block);
    syslength = plus(length(bdroot(BlockFullName)), 2.0);
    BlockName = strrep(BlockFullName(syslength:end), setstr(10.0), ' ');
    % 12 13
    x = size(rlc, 1.0);
    mesurerequest = get_param(block, 'Measurements');
    % 15 16
    switch mesurerequest
    case 'Branch voltage'
        % 18 20
        % 19 20
        Multimeter.Yu(plus(end, 1.0), 1.0:2.0) = rlc(x, 1.0:2.0);
        Multimeter.V{plus(end, 1.0)} = horzcat('Ub: ', BlockName);
    case 'Branch voltages'
        % 23 25
        % 24 25
        Multimeter.Yu(plus(end, 1.0), 1.0:2.0) = rlc(minus(x, 2.0), 1.0:2.0);
        Multimeter.Yu(plus(end, 1.0), 1.0:2.0) = rlc(minus(x, 1.0), 1.0:2.0);
        Multimeter.Yu(plus(end, 1.0), 1.0:2.0) = rlc(x, 1.0:2.0);
        Multimeter.V{plus(end, 1.0)} = horzcat('Ub1: ', BlockName);
        Multimeter.V{plus(end, 1.0)} = horzcat('Ub2: ', BlockName);
        Multimeter.V{plus(end, 1.0)} = horzcat('Ub3: ', BlockName);
    case 'Branch current'
        % 32 34
        % 33 34
        Multimeter.I{plus(end, 1.0)} = horzcat('Ib: ', BlockName);
        Multimeter.Yi{plus(end, 1.0), 1.0} = x;
    case 'Branch currents'
        % 37 39
        % 38 39
        Multimeter.I{plus(end, 1.0)} = horzcat('Ib1: ', BlockName);
        Multimeter.I{plus(end, 1.0)} = horzcat('Ib2: ', BlockName);
        Multimeter.I{plus(end, 1.0)} = horzcat('Ib3: ', BlockName);
        Multimeter.Yi{plus(end, 1.0), 1.0} = minus(x, 2.0);
        Multimeter.Yi{plus(end, 1.0), 1.0} = minus(x, 1.0);
        Multimeter.Yi{plus(end, 1.0), 1.0} = x;
    case 'Branch voltage and current'
        % 46 48
        % 47 48
        Multimeter.Yu(plus(end, 1.0), 1.0:2.0) = rlc(x, 1.0:2.0);
        Multimeter.V{plus(end, 1.0)} = horzcat('Ub: ', BlockName);
        Multimeter.I{plus(end, 1.0)} = horzcat('Ib: ', BlockName);
        Multimeter.Yi{plus(end, 1.0), 1.0} = x;
    case 'Branch voltages and currents'
        % 53 55
        % 54 55
        Multimeter.Yu(plus(end, 1.0), 1.0:2.0) = rlc(minus(x, 2.0), 1.0:2.0);
        Multimeter.Yu(plus(end, 1.0), 1.0:2.0) = rlc(minus(x, 1.0), 1.0:2.0);
        Multimeter.Yu(plus(end, 1.0), 1.0:2.0) = rlc(x, 1.0:2.0);
        Multimeter.Yi{plus(end, 1.0), 1.0} = minus(x, 2.0);
        Multimeter.Yi{plus(end, 1.0), 1.0} = minus(x, 1.0);
        Multimeter.Yi{plus(end, 1.0), 1.0} = x;
        Multimeter.V{plus(end, 1.0)} = horzcat('Ub1: ', BlockName);
        Multimeter.V{plus(end, 1.0)} = horzcat('Ub2: ', BlockName);
        Multimeter.V{plus(end, 1.0)} = horzcat('Ub3: ', BlockName);
        Multimeter.I{plus(end, 1.0)} = horzcat('Ib1: ', BlockName);
        Multimeter.I{plus(end, 1.0)} = horzcat('Ib2: ', BlockName);
        Multimeter.I{plus(end, 1.0)} = horzcat('Ib3: ', BlockName);
    case 'Winding voltages'
        % 68 70
        % 69 70
        Multimeter.Yu(plus(end, 1.0), 1.0:2.0) = rlc(minus(x, 1.0), 1.0:2.0);
        Multimeter.V{plus(end, 1.0)} = horzcat('Uw1: ', BlockName);
        Multimeter.Yu(plus(end, 1.0), 1.0:2.0) = rlc(x, 1.0:2.0);
        Multimeter.V{plus(end, 1.0)} = horzcat('Uw2: ', BlockName);
    case 'Winding currents'
        % 75 77
        % 76 77
        Multimeter.I{plus(end, 1.0)} = horzcat('Iw1: ', BlockName);
        Multimeter.Yi{plus(end, 1.0), 1.0} = minus(x, 1.0);
        Multimeter.I{plus(end, 1.0)} = horzcat('Iw2: ', BlockName);
        Multimeter.Yi{plus(end, 1.0), 1.0} = x;
    case {'Winding voltages and currents','All voltages and currents','All measurements (V I Flux)'}
        % 82 84
        % 83 84
        Multimeter.Yu(plus(end, 1.0), 1.0:2.0) = rlc(minus(x, 1.0), 1.0:2.0);
        Multimeter.V{plus(end, 1.0)} = horzcat('Uw1: ', BlockName);
        Multimeter.Yu(plus(end, 1.0), 1.0:2.0) = rlc(x, 1.0:2.0);
        Multimeter.V{plus(end, 1.0)} = horzcat('Uw2: ', BlockName);
        Multimeter.I{plus(end, 1.0)} = horzcat('Iw1: ', BlockName);
        Multimeter.Yi{plus(end, 1.0), 1.0} = minus(x, 1.0);
        Multimeter.I{plus(end, 1.0)} = horzcat('Iw2: ', BlockName);
        Multimeter.Yi{plus(end, 1.0), 1.0} = x;
        % 92 93
    end % switch
end % function
