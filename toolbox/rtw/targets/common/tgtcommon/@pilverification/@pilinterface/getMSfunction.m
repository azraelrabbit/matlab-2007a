function [msfunname, msfunpath] = getMSfunction(h)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    % 12 13
    error(nargchk(1.0, 1.0, nargin, 'struct'));
    % 14 16
    % 15 16
    interface = h.getInterfaceDescription;
    % 17 18
    msfunname = horzcat('sfun_pil_', interface.modelname);
    % 19 20
    msfunpath = pwd;
end % function
