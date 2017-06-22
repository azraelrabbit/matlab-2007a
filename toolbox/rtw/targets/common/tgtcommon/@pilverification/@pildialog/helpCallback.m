function helpCallback(h)
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
    % 11 12
    pil_interface = h.getPILInterface;
    if isempty(pil_interface)
        % 14 27
        % 15 27
        % 16 27
        % 17 27
        % 18 27
        % 19 27
        % 20 27
        % 21 27
        % 22 27
        % 23 27
        % 24 27
        % 25 27
        % 26 27
        helpview(horzcat(docroot, '/toolbox/tasking/tasking.map'), 'PIL_block');
    else
        % 29 32
        % 30 32
        % 31 32
        pil_interface.a_helpCallback;
    end % if
end % function
