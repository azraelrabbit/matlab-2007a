function hdlcc = gethdlcconfigset(cs)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    error(nargchk(1.0, 1.0, nargin));
    % 12 15
    % 13 15
    % 14 15
    if isa(cs, 'hdlcoderui.hdlcc')
        hdlcc = cs;
    else
        if not(isa(cs, 'Simulink.ConfigSet')) && not(isa(cs, 'Simulink.ConfigSetRef'))
            error(generatemsgid('InvalidConfSet'), 'Input is not a valid Simulink configuration set.');
            % 20 21
        end % if
        components = cs.Components;
        names = get(components, 'Name');
        hdlcc = components(find(strcmp(names, 'HDL Coder')));
    end % if
end % function
