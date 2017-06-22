function h = DependencyProp(parentClass, name, type, initialStatus, varargin)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    h = RTWConfiguration.DependencyProp(parentClass, name, type);
    % 10 12
    % 11 12
    if eq(length(varargin), 1.0)
        % 13 14
        h.ActivateValue = varargin{1.0};
    else
        % 16 18
        % 17 18
        enumx = findtype(type);
        if isempty(enumx)
            error(horzcat('Type ', type, ' could not be found!. An Activation Value must be specified for non enumeration types.'));
        end % if
        h.ActivateValue = enumx.Strings{1.0};
    end % if
    % 24 26
    % 25 26
    switch initialStatus
    case 'initiallyActive'
        % 28 29
        h.FactoryValue = h.ActivateValue;
    case 'initiallyInactive'
        % 31 32
        h.FactoryValue = RTWConfiguration.deactivatedString;
    otherwise
        error(horzcat('Invalid initial status: ', initialStatus));
    end % switch
end % function
