function out = bdehandler(action, varargin)
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
    out = {};
    % 13 15
    accepted = callgraphviz('SimBiology', 'GetLicenseAcceptedStatus');
    if eq(accepted, false)
        licenseText = sprintf(callgraphviz('SimBiology', 'GetLicense'));
        if not(isequal('Accept', questdlg(licenseText, 'GRAPHVIZ LICENSE', 'Accept', 'Decline', 'Decline')))
            out = 'GRAPHVIZ license was not accepted, cannot display graph.';
            return;
        end % if
        callgraphviz('SimBiology', 'SetLicenseAcceptedStatus', true)
    end % if
    % 23 25
    switch action
    case 'init'
        % 26 28
        data = varargin{1.0};
        bdehandler('display', data);
        % 29 31
        a = data.getAdjacencyMatrix;
        connCount = plus(sum(a), sum(ctranspose(a)));
        data.setConnectionCount(full(connCount));
    case {'display','changeLabel'}
        data = varargin{1.0};
        % 35 38
        % 36 38
        model = handle(data.getModel);
        [a, names, speciesMask] = getadjacencymatrix(model);
        % 39 42
        % 40 42
        if isempty(a)
            data.resetAdjacencyMatrix;
        else
            data.setAdjacencyMatrix(a);
        end % if
        data.setNames(names);
        data.setSpeciesMask(speciesMask);
        localDefineTooltips(data, model);
        % 49 52
        % 50 52
        rxns = find(not(speciesMask));
        data.setReactions(rxns);
        % 53 56
        % 54 56
        for n=1.0:length(rxns)
            names{rxns(n)} = 'r';
        end % for
        % 58 61
        % 59 61
        a2 = a;
        names2 = names;
        tags2 = localGetTags(data, model);
        data.setTags(tags2);
        indexlist = 1.0:size(a2, 1.0);
        % 65 68
        % 66 68
        if eq(data.getSpanReactions, true)
            spanlist = rxns;
            [a2, indexlist] = spannodes(a2, spanlist, indexlist);
        else
            data.setSpanList([]);
        end % if
        % 73 75
        aPostSpan = a2;
        % 75 77
        if isempty(aPostSpan)
            data.resetAdjacencyMatrixPostSpan;
        else
            data.setAdjacencyMatrixPostSpan(aPostSpan);
        end % if
        % 81 83
        [a2, indexlist] = hidenodes(a2, data.getHideList, indexlist);
        [a2, indexlist] = splitnodes(a2, data.getSplitList, indexlist);
        % 84 86
        names2 = names2(indexlist);
        tags2 = tags2(indexlist);
        % 87 89
        plotgraphsbd(a2, data.getLayout, data);
        % 89 92
        % 90 92
        if isempty(a2)
            data.resetLatestAdjacencyMatrix;
        else
            data.setLatestAdjacencyMatrix(a2);
        end % if
        % 96 98
        data.setLatestNames(names2);
        data.setLatestTags(tags2);
        data.setIndexList(indexlist);
    case 'highlight'
        data = varargin{1.0};
        selectionlist = data.getOriginalHighlightList;
        indexlist = data.getIndexList;
        amatrix2 = data.getLatestAdjacencyMatrix;
        direction = data.getDirection;
        ngens = data.getNumberOfGenerations;
        % 107 109
        if eq(data.getRevealHidden, true)
            % 109 113
            % 110 113
            % 111 113
            aPostSpan = data.getAdjacencyMatrixPostSpan;
            highlightlist = getrelatives(aPostSpan, selectionlist, direction, ngens);
            data.setHighlightList(highlightlist);
            % 115 119
            % 116 119
            % 117 119
            hidelist = data.getHideList;
            hiddenblocks = intersect(hidelist, highlightlist);
            % 120 122
            if not(isempty(hiddenblocks))
                hidelist = setdiff(hidelist, hiddenblocks);
                data.setHideList(hidelist);
                bdehandler('display', data);
            end % if
        else
            % 127 129
            [mask, loc] = ismember(selectionlist, indexlist);
            list = getrelatives(amatrix2, loc, direction, ngens);
            data.setHighlightList(indexlist(list));
        end % if
    end % switch
function plotgraphsbd(a, layout, data)
    % 134 139
    % 135 139
    % 136 139
    % 137 139
    len = size(a, 1.0);
    % 139 141
    [xy, links] = getgraphdata(a, layout);
    % 141 143
    x = xy(:, 1.0);
    y = xy(:, 2.0);
    % 144 146
    maxDisplayLen = 20.0;
    % 146 152
    % 147 152
    % 148 152
    % 149 152
    % 150 152
    x = mtimes(mrdivide(x, max(x)), 700.0);
    y = mtimes(mrdivide(y, max(y)), 700.0);
    % 153 155
    data.setX(x);
    data.setY(y)
    data.setLinksI(links(:, 1.0));
    data.setLinksJ(links(:, 2.0));
function out = localGetTags(data, model)
    % 159 163
    % 160 163
    % 161 163
    species = find(model, 'Type', 'species');
    reactions = find(model, 'Type', 'reaction');
    % 164 166
    stags = get(species, {'Tag'});
    rtags = get(reactions, {'Tag'});
    % 167 170
    % 168 170
    index = cellfun('isempty', stags);
    for i=1.0:length(stags)
        if isempty(stags{i})
            stags(i) = cellhorzcat(horzcat('s', num2str(i)));
        end % if
    end % for
    % 175 177
    index = cellfun('isempty', rtags);
    rtags(index) = {'r'};
    % 178 180
    if ne(plus(length(stags), length(rtags)), length(data.getNames))
        out = ctranspose(cellhorzcat(stags{:}, 'null', rtags{:}));
    else
        out = ctranspose(cellhorzcat(stags{:}, rtags{:}));
    end % if
function localDefineTooltips(data, model)
    % 185 189
    % 186 189
    % 187 189
    species = find(model, 'Type', 'species');
    names = get(species, {'Name'});
    % 190 193
    % 191 193
    for i=1.0:length(species)
        tag = get(species(i), 'Tag');
        if not(isempty(tag))
            names{i} = horzcat(names{i}, ' - ', tag);
        end % if
    end % for
    % 198 200
    reactions = find(model, 'Type', 'reaction');
    values = get(reactions, {'Reaction'});
    % 201 203
    if ne(plus(length(names), length(values)), length(data.getNames))
        out = cellhorzcat(names{:}, 'null', values{:});
    else
        out = cellhorzcat(names{:}, values{:});
    end % if
    % 207 209
    data.setTooltips(out);
