function [argName, cat, qualifier] = getPortDefaultConf(hSrc, portH)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    argName = get_param(portH, 'Name');
    argName = regexprep(argName, '[\s\\\/,\(\)\[\]\{\}]', '_');
    argName = sprintf('arg_%s', argName);
    cat = 'Pointer';
    qualifier = 'none';
    dimensions = get_param(portH, 'CompiledPortDimensions');
    portType = get_param(portH, 'BlockType');
    if strcmpi(portType, 'Inport')
        if not(isempty(dimensions))
            dOutport = dimensions.Outport;
            cat = 'Value';
            for index=2.0:length(dOutport)
                if gt(dOutport(index), 1.0)
                    cat = 'Pointer';
                    break
                end % if
            end % for
        end % if
        useBusObject = get_param(portH, 'UseBusObject');
        if strcmp(useBusObject, 'on')
            cat = 'Pointer';
        end % if
    end % if
end % function
