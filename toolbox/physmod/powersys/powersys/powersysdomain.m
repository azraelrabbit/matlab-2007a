function varargout = powersysdomain(arg)
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
    if eq(nargin, 0.0)
        return;
    end % if
    % 14 16
    switch class(arg)
    case 'Simulink.SlDomainInfo'
        i_RegisterPOWER(arg);
    case 'struct'
        Netlist = powersysdomain_netlist('get');
        if isempty(Netlist)
            % 21 25
            % 22 25
            % 23 25
            VerifyAppendBlocks(arg)
        end % if
        powersysdomain_netlist('compile', arg);
    case 'string'
        i_StopPOWER(arg);
    end % switch
function i_RegisterPOWER(domaininfo)
    % 31 33
    domaininfo.name = 'powersysdomain';
    domaininfo.version = '0';
    domaininfo.lineBranching = 'on';
    domaininfo.compileFcn = 'powersysdomain';
    domaininfo.stopFcn = 'powersysdomain';
    domaininfo.initFcn = 'powersysdomain_init';
    domaininfo.startFcn = 'powersysdomain_append';
    domaininfo.portHelpFcn = 'power_pmioporthelp';
    port = domaininfo.addPortType('p1');
    port.icon = domaininfo.getDomainImage('electric.bmp');
    port.setConnectivity(port);
    domaininfo.locked = 'on';
function i_StopPOWER(blockdiagram)
    % 45 47
    disp(horzcat('Stopping ', blockdiagram))
function VerifyAppendBlocks(arg)
    % 48 50
    system = getfullname(bdroot(arg.BlockHandles(1.0)));
    Neutrals = find_system(system, 'LookUnderMasks', 'on', 'FollowLinks', 'on', 'MaskType', 'Neutral');
    MMeters = find_system(system, 'LookUnderMasks', 'on', 'FollowLinks', 'on', 'MaskType', 'MultimeterPSB');
    if not(isempty(Neutrals)) || not(isempty(MMeters))
        % 53 55
        powersysdomain_netlist('Append');
    end % if
