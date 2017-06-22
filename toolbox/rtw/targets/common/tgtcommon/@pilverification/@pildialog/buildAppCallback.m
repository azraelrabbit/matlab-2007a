function buildAppCallback(h)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    error(nargchk(1.0, 1.0, nargin, 'struct'));
    % 11 13
    % 12 13
    h.resetPILInterface;
    % 14 16
    % 15 16
    pil_interface = h.getPILInterface;
    if isempty(pil_interface)
        % 18 20
        % 19 20
        error('Please select a valid "Simulink system path" and "Configuration" before attempting to build.');
        % 21 22
    end % if
    % 23 24
    pil_interface.buildApplication;
    % 25 27
    % 26 27
    pil_interface.getApplicationExecutable;
    % 28 30
    % 29 30
    h.blockSetup;
    % 31 32
    h.status = 'Build complete. Download required.';
end % function
