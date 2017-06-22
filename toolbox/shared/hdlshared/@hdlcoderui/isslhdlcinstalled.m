function [b, errstr, errid] = isslhdlcinstalled
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    issupportedOS = getSupportedOS4SLHDLC;
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    pid_udd_available = eq(exist('pir_udd', 'file'), 3.0);
    % 13 15
    b = license('test', 'Simulink_HDL_Coder') && not(isempty(ver('hdlcoder'))) && issupportedOS && pid_udd_available;
    % 15 20
    % 16 20
    % 17 20
    % 18 20
    if b
        errstr = '';
        errid = '';
    else
        errstr = sprintf('%s\n%s', 'Simulink HDL Coder is not available.', 'Make sure that it is installed and that a license is available.');
        % 24 26
        errid = 'noHDLCoder';
    end
end
function issupportedOS = getSupportedOS4SLHDLC
    % 29 33
    % 30 33
    % 31 33
    supportedOSList = {'PCWIN','SOL2','GLNX86','GLNXA64','SOL64'};
    % 33 37
    % 34 37
    % 35 37
    issupportedOS = any(strcmp(computer, supportedOSList));
end
