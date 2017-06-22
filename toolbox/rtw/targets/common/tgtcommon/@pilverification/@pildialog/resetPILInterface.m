function resetPILInterface(h)
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
    error(nargchk(1.0, 1.0, nargin, 'struct'));
    % 12 15
    % 13 15
    % 14 15
    h.setPILInterface([]);
    % 16 17
    h.status = '';
    % 18 22
    % 19 22
    % 20 22
    % 21 22
    pil_interface = pilverification.pilinterface([], []);
    pil_interface.setSystemPath(h.SystemPath);
    % 24 27
    % 25 27
    % 26 27
    if not(strcmp(h.PILConfiguration, 'Configuration not selected...'))
        % 28 33
        % 29 33
        % 30 33
        % 31 33
        % 32 33
        algorithmModel = strtok(h.SystemPath, '/');
        % 34 35
        config = pil_get_configuration(algorithmModel, h.PILConfiguration);
        % 36 37
        if isempty(config)
            error(pil_get_error_id('errorBadConfiguration'), 'PIL configuration "%s" is not available for this algorithm system path.   Please choose another configuration or sytsem path.', h.PILConfiguration);
            % 39 42
            % 40 42
            % 41 42
        end % if
        % 43 44
        interfaceClass = eval(horzcat('@', config.interface_class));
        interface = feval(interfaceClass, h.SystemPath, config.interface_class_arg{:});
        % 46 47
        pil_interface = pilverification.pilinterface(interface, config.pil_app_framework);
        % 48 50
        % 49 50
        pil_interface.setSystemPath(h.SystemPath);
        % 51 52
        h.setPILInterface(pil_interface);
        % 53 54
        h.blockSetup;
    end % if
end % function
