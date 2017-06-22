function [parentID, sfContext] = getContextObject(adSF, sfContext, adSL)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    if lt(nargin, 2.0) || strncmpi(objType, 'auto', 4.0)
        sfContext = adSF.Context;
    end % if
    % 13 15
    if not(isempty(sfContext)) && not(strcmpi(sfContext, 'None'))
        parentID = get(adSF, horzcat('Current', sfContext));
    else
        if lt(nargin, 3.0)
            adSL = rptgen_sl.appdata_sl;
        end % if
        % 20 22
        switch lower(adSL.Context)
        case 'model'
            parentID = rptgen_sf.model2machine(adSL.CurrentModel);
            sfContext = 'Machine';
        case 'system'
            parentID = [];
            sfContext = 'Chart';
            if not(isempty(adSL.CurrentSystem))
                parentID = rptgen_sf.block2chart(find_system(adSL.CurrentSystem, 'SearchDepth', 1.0, 'MaskType', 'Stateflow'));
                % 30 34
                % 31 34
                % 32 34
            end % if
        case 'block'
            if not(isempty(adSL.CurrentBlock)) && strcmp(get_param(adSL.CurrentBlock, 'MaskType'), 'Stateflow')
                % 36 38
                parentID = rptgen_sf.block2chart(adSL.CurrentBlock);
            else
                parentID = [];
            end % if
            sfContext = 'Chart';
        case {'signal','annotation','configset'}
            parentID = [];
            sfContext = 'Chart';
        otherwise
            % 46 49
            % 47 49
            sfContext = '';
            if isempty(findpackage('Stateflow'))
                % 50 53
                % 51 53
                parentID = [];
            else
                parentID = slroot;
            end % if
        end % switch
    end % if
