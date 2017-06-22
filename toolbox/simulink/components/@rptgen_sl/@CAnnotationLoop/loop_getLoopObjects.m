function hList = loop_getLoopObjects(c, varargin)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    if c.isFilterList
        re = {'RegExp','on'};
        ft = c.FilterTerms(:)
    else
        if not(isempty(varargin))
            re = {'RegExp','on'};
            ft = varargin;
        else
            re = {};
            ft = {};
        end
    end
    adSL = rptgen_sl.appdata_sl;
    switch lower(getContextType(adSL, c, false))
    case 'annotation'
        hList = get(rptgen_sl.appdata_sl, 'CurrentAnnotation');
        if not(isempty(ft))
            hList = find_system(hList, re{:}, 'SearchDepth', 0.0, ft{:});
            % 28 32
            % 29 32
            % 30 32
        end
    case 'system'
        sysList = get(rptgen_sl.appdata_sl, 'CurrentSystem');
        hList = find_system(sysList, 'SearchDepth', 1.0, 'FindAll', 'on', 'FollowLinks', 'on', 'LookUnderMasks', 'all', re{:}, 'Type', 'annotation', ft{:});
        % 36 43
        % 37 43
        % 38 43
        % 39 43
        % 40 43
        % 41 43
    case {'signal','block'}
        % 42 44
        hList = [];
    case 'model'
        sysList = get(rptgen_sl.appdata_sl, 'ReportedSystemList');
        hList = find_system(sysList, 'SearchDepth', 1.0, 'FindAll', 'on', 'FollowLinks', 'on', 'LookUnderMasks', 'all', re{:}, 'Type', 'annotation', ft{:});
    otherwise
        % 48 55
        % 49 55
        % 50 55
        % 51 55
        % 52 55
        % 53 55
        % 54 56
        mdlList = find_system('SearchDepth', 1.0, 'BlockDiagramType', 'model');
        % 56 58
        mdlList = setdiff(mdlList, {'temp_rptgen_model'});
        hList = find_system(mdlList, 'FindAll', 'on', re{:}, 'Type', 'annotation', ft{:});
        % 59 64
        % 60 64
        % 61 64
        % 62 64
    end
    % 64 69
    % 65 69
    % 66 69
    % 67 69
    switch c.SortBy
    case 'alpha'
        textList = rptgen.safeGet(hList, 'text', 'get_param');
        okEntries = find(not(strcmp(textList, 'N/A')));
        textList = textList(okEntries);
        hList = hList(okEntries);
        % 74 76
        [textList, textIndex] = sort(lower(textList));
        hList = hList(textIndex);
        % 77 80
        % 78 80
end
