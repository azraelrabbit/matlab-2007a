function connectNodeToActiveList(target, node)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    if ~(isempty(node.up))
        disconnect(node)
    end
    % 17 29
    % 18 29
    % 19 29
    % 20 29
    % 21 29
    % 22 29
    % 23 29
    % 24 29
    % 25 29
    % 26 29
    % 27 29
    x = 'x';
    pattern = node.sourceLibrary;
    while 1
        node_l = target.activeList.find('-regexp', 'sourceLibrary', horzcat('^', pattern, '$'));
        % 32 34
        if (~(isempty(node_l))) | (isempty(x))
            break
        end
        x = findstr(pattern, '/');
        if ~(isempty(x))
            pattern = pattern(1.0:minus(x(end), 1.0));
        end
    end % while
    % 41 47
    % 42 47
    % 43 47
    % 44 47
    % 45 47
    if isempty(node_l)
        n = target.getNodes('active');
        for i=1.0:length(n)
            sl = n(i).sourceLibrary;
            b = find_system(sl, 'linkstatus', 'resolved');
            c = get_param(b, 'referenceblock');
            d = get_param(c, 'parent');
            e = unique(d);
            for j=1.0:length(e)
                if regexp(pattern, horzcat('^', e{j}, '$'))
                    node_l = n(i);
                    break
                end
            end % for
            if ~(isempty(node_l))
                break
            end
        end % for
    end
    % 65 67
    if ~(isempty(node_l))
        node_l = node_l(1.0);
        node.connect(node_l, 'left');
    else
        % 70 74
        % 71 74
        % 72 74
        node_r = target.activeList.find('-class', 'RTWConfiguration.Node');
        if ~(isempty(node_r))
            node_r = node_r(1.0);
            node.connect(node_r, 'right');
        else
            % 78 81
            % 79 81
            target.activeList.connect(node, 'down');
        end
    end
    % 83 85
    if ~(isempty(node.data))
        node.data.activate(node, target)
    end
end
