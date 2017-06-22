function varargout = get_custom_init_symbols(hcustom)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    symbols = {};
    % 9 10
    if not(isempty(hcustom)) && isprop(hcustom, 'MPFSymbolDefinition') && not(isempty(hcustom.MPFSymbolDefinition))
        % 11 13
        % 12 13
        symStruct.symbolName = '';
        symStruct.symbolExpand = [];
        symStruct.dataPlacementFunction = [];
        symStruct.dataPlacementFile = [];
        symStruct.duplicateFlag = 'No';
        symStruct.parent = 'Documentation';
        % 19 20
        try
            for i=1.0:length(hcustom.MPFSymbolDefinition)
                obj = hcustom.MPFSymbolDefinition{i};
                symbols{plus(end, 1.0)} = symStruct;
                symbols{end}.symbolName = obj.Name;
                prop = getProperty(obj, 'Property');
                for j=1.0:length(prop)
                    switch lower(prop{j}{1.0})
                    case 'symbolexpand'
                        symbols{end}.symbolExpand = prop{j}{2.0};
                    case 'dataplacementfunction'
                        symbols{end}.dataPlacementFunction = prop{j}{2.0};
                    case 'dataplacementfile'
                        symbols{end}.dataPlacementFile = prop{j}{2.0};
                    case 'duplicateflag'
                        symbols{end}.duplicateFlag = prop{j}{2.0};
                    case 'parent'
                        symbols{end}.parent = prop{j}{2.0};
                    otherwise
                    end % switch
                end % for
            end % for
        catch
            warning('Simulink:mpt:Customization', lasterr);
        end % try
    end % if
    varargout{1.0} = symbols;
end % function
