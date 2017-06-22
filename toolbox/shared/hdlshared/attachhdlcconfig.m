function attachhdlcconfig(model)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    % 11 12
    error(nargchk(1.0, 1.0, nargin));
    % 13 17
    % 14 17
    % 15 17
    % 16 17
    mdlObj = bdroot(get_param(model, 'Handle'));
    if strcmp(get_param(mdlObj, 'BlockDiagramType'), 'library')
        error(generatemsgid('InvalidMDLObj'), 'Simulink model must be a block diagram.');
        % 20 21
    end % if
    % 22 28
    % 23 28
    % 24 28
    % 25 28
    % 26 28
    % 27 28
    sobj = get_param(model, 'Object');
    configSet = sobj.getActiveConfigSet;
    hdlcc = gethdlcconfigset(configSet);
    % 31 33
    % 32 33
    if strcmp(get_param(model, 'SimulationStatus'), 'stopped')
        if not(isa(hdlcc, 'hdlcoderui.hdlcc'))
            % 35 36
            hdlcexist = which('makehdl');
            if isempty(hdlcexist)
                warning('Simulink HDL coder is not installed. Cannot attach HDL Configurations.');
            else
                if hdlcoderui.isslhdlcinstalled
                    hdlcc = hdlcoderui.hdlcc;
                    attachComponent(configSet, hdlcc);
                end % if
            end % if
        end % if
    end % if
end % function
