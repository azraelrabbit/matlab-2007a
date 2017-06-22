function y = findProp(h, varargin)
    % 1 30
    % 2 30
    % 3 30
    % 4 30
    % 5 30
    % 6 30
    % 7 30
    % 8 30
    % 9 30
    % 10 30
    % 11 30
    % 12 30
    % 13 30
    % 14 30
    % 15 30
    % 16 30
    % 17 30
    % 18 30
    % 19 30
    % 20 30
    % 21 30
    % 22 30
    % 23 30
    % 24 30
    % 25 30
    % 26 30
    % 27 30
    % 28 30
    % 29 30
    prop = varargin{1.0};
    if gt(nargin, 2.0)
        isAll = strcmpi(varargin{2.0}, '-all');
        if not(isAll)
            error('Unknown command option.')
        end % if
    else
        isAll = false;
    end % if
    y = {};
    for i=1.0:numel(h.prop_sets)
        % 41 47
        % 42 47
        % 43 47
        % 44 47
        % 45 47
        % 46 47
        hi = h.prop_sets{i};
        % 48 49
        allMatches = strcmpi(prop, fieldnames(hi));
        numMatches = sum(allMatches);
        if gt(numMatches, 0.0)
            % 52 53
            ytop = h.prop_set_names(i);
            z = {};
            if isa(hi, 'hdlcoderprops.PropSetAbstract')
                z = findProp(hi, varargin{:});
            else
                % 58 60
                % 59 60
                z = repmat(cellhorzcat(prop), 1.0, numMatches);
                % 61 64
                % 62 64
                % 63 64
            end % if
            if isAll
                % 66 67
                for j=1.0:numMatches
                    y(plus(end, 1.0), :) = cellhorzcat(horzcat(ytop, z{j}));
                end % for
            else
                % 71 72
                y = horzcat(ytop, z);
                return;
            end % if
        end % if
    end % for
end % function
