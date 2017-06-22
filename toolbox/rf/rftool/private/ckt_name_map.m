function object = ckt_name_map(ckttype)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    component_names = {'Delay Line';'Transmission Line';'Two Wire Transmission Line';'Microstrip Transmission Line';'Parallel Plate Transmission Line';'Coaxial Transmission Line';'Coplanar Waveguide Transmission Line';'Series RLC';'Shunt RLC';'LC Lowpass Pi';'LC Lowpass Tee';'LC Highpass Pi';'LC Highpass Tee';'LC Bandpass Pi';'LC Bandpass Tee';'LC Bandstop Pi';'LC Bandstop Tee';'Data File';'Passive';'Amplifier';'Mixer'};
    % 8 19
    % 9 19
    % 10 19
    % 11 19
    % 12 19
    % 13 19
    % 14 19
    % 15 19
    % 16 19
    % 17 19
    % 18 19
    rfckt_objects = {'rfckt.delay';'rfckt.txline';'rfckt.twowire';'rfckt.microstrip';'rfckt.parallelplate';'rfckt.coaxial';'rfckt.cpw';'rfckt.seriesrlc';'rfckt.shuntrlc';'rfckt.lclowpasspi';'rfckt.lclowpasstee';'rfckt.lchighpasspi';'rfckt.lchighpasstee';'rfckt.lcbandpasspi';'rfckt.lcbandpasstee';'rfckt.lcbandstoppi';'rfckt.lcbandstoptee';'rfckt.datafile';'rfckt.passive';'rfckt.amplifier';'rfckt.mixer'};
    % 20 28
    % 21 28
    % 22 28
    % 23 28
    % 24 28
    % 25 28
    % 26 28
    % 27 28
    idx = strcmp(component_names, ckttype);
    if any(idx)
        object = eval(rfckt_objects{idx});
    else
        object = [];
    end % if
    % 34 35
end % function
