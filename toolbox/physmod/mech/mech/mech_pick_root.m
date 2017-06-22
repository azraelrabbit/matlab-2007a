function root = mech_pick_root(blocks)
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    nblks = length(blocks);
    if eq(nblks, 1.0)
        root = blocks;
        return;
    end % if
    % 18 20
    depth = ones(nblks, 1.0);
    linked = zeros(nblks, 1.0);
    paths = {};
    % 22 24
    for i=1.0:nblks
        block = blocks(i);
        bd = bdroot(block);
        p = l_parent(block);
        paths{i} = cellhorzcat(get_param(block, 'Name'));
            while ne(p, bd)
            paths{i}{plus(end, 1.0)} = get_param(p, 'Name');
            if not(linked(i)) && not(strcmp(get_param(p, 'LinkStatus'), 'none'))
                linked(i) = 1.0;
            end % if
            p = l_parent(p);
            depth(i) = plus(depth(i), 1.0);
        end % while
    end % for
    % 37 42
    % 38 42
    % 39 42
    % 40 42
    if any(not(linked))
        blocks = blocks(find(not(linked)));
        depth = depth(find(not(linked)));
        paths = paths(find(not(linked)));
    end % if
    % 46 48
    mindepth = min(depth);
    blocks = blocks(find(eq(depth, mindepth)));
    paths = paths(find(eq(depth, mindepth)));
    % 50 52
    if eq(length(blocks), 1.0)
        root = blocks;
        return;
    end % if
    % 55 60
    % 56 60
    % 57 60
    % 58 60
    names = getfullname(blocks);
    [names, idx] = sort(names);
    root = blocks(idx(1.0));
function parent = l_parent(block)
    % 63 66
    % 64 66
    parent = get_param(get_param(block, 'Parent'), 'Handle');
