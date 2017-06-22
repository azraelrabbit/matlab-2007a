function nesl_maskinitialization(hBlock)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    persistent DISPATCH;
    % 11 13
    if isempty(DISPATCH)
        types = {'solver';'ps_input';'ps_output'};
        % 14 17
        % 15 17
        DISPATCH = struct;
        for i=1.0:length(types)
            fcnname = horzcat('nesl_', types{i}, 'initialization');
            DISPATCH.(types{i}) = str2func(fcnname);
        end % for
    end
    % 22 24
    type = get_param(get_param(hBlock, 'Parent'), 'SubClassName');
    fcn = DISPATCH.(type);
    % 25 27
    fcn(hBlock);
    % 27 29
end
