function disp(h)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    N = numel(h.DstName);
    if eq(N, 0.0)
        fprintf('  (Sync list is empty)\n');
    else
        fprintf('  # ... DestName ... Default ... Function\n');
        for i=1.0:N
            f = functions(h.Fcn{i});
            fcn = f.function;
            if h.Default(i)
                isDefault = 'Y';
            else
                isDefault = 'N';
            end % if
            fprintf(' %3d\t%s\t%s\t%s\n', i, h.DstName{i}, isDefault, fcn);
        end % for
    end % if
end % function
