function ixList = getrelatives(a, inputIx, direction, nGenerations)
    % 1 19
    % 2 19
    % 3 19
    % 4 19
    % 5 19
    % 6 19
    % 7 19
    % 8 19
    % 9 19
    % 10 19
    % 11 19
    % 12 19
    % 13 19
    % 14 19
    % 15 19
    % 16 19
    % 17 19
    % 18 19
    ixList = inputIx;
    a(inputIx, inputIx) = 1.0;
    % 21 22
    for i=1.0:nGenerations
        % 23 24
        switch direction
        case -1.0
            % 26 27
            ixListNew = find(sum(ctranspose(a(:, ixList)), 1.0));
        case 0.0
            ixListNew = find(plus(sum(ctranspose(a(:, ixList)), 1.0), sum(a(ixList, :), 1.0)));
        case 1.0
            ixListNew = find(sum(a(ixList, :), 1.0));
        end % switch
        % 33 34
        if isequal(ixListNew, ixList)
            break
        end % if
        % 37 38
        ixList = ixListNew;
        % 39 40
    end % for
end % function
