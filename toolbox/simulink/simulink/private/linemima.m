function [x_min, x_max, y_min, y_max, to_do, n_be, n_en] = linemima(layout, blklocs)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    [n_l, m_l] = size(layout);
    % 9 10
    block_n = [];
    to_do = [];
    for i=minus(n_l, 1.0):-1.0:1.0
        [tmpx, tmpy] = blkxchk(layout(i:plus(i, 1.0), :), blklocs);
        if not(isempty(tmpx))
            to_do = horzcat(i, to_do);
            cros_inf = tmpx;
            block_n = tmpy;
        end % if
    end % for
    n_be = min(to_do);
    n_en = max(to_do);
    % 22 25
    % 23 25
    % 24 25
    if isempty(block_n)
        x_min = max(blklocs(:, 3.0));
        x_max = min(blklocs(:, 1.0));
        y_min = max(blklocs(:, 4.0));
        y_max = min(blklocs(:, 2.0));
    else
        x_min = min(find(eq(blklocs(block_n, 1.0), min(blklocs(block_n, 1.0)))));
        x_max = max(find(eq(blklocs(block_n, 3.0), max(blklocs(block_n, 3.0)))));
        y_min = min(find(eq(blklocs(block_n, 2.0), min(blklocs(block_n, 2.0)))));
        y_max = max(find(eq(blklocs(block_n, 4.0), max(blklocs(block_n, 4.0)))));
        x_min = blklocs(block_n(x_min), 1.0);
        x_max = blklocs(block_n(x_max), 3.0);
        y_min = blklocs(block_n(y_min), 2.0);
        y_max = blklocs(block_n(y_max), 4.0);
    end % if
end % function
