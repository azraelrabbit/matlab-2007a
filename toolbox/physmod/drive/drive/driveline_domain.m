function driveline_domain(domain_info)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    domain_info.name = 'driveline_domain';
    domain_info.version = '0';
    domain_info.lineBranching = 'on';
    % 10 11
    domain_info.compileFcn = 'drive_compile';
    domain_info.stopFcn = 'drive_stop';
    domain_info.initFcn = 'drive_init';
    domain_info.startFcn = 'drive_start';
    domain_info.portHelpFcn = 'drive_pmioporthelp';
    % 16 17
    port = domain_info.addPortType('p1');
    port.icon = domain_info.getDomainImage('driveport.bmp');
    % 19 22
    % 20 22
    % 21 22
    port.setConnectivity(port);
end % function
