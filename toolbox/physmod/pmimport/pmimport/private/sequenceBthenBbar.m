function C = sequenceBthenBbar(a, B)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    A = 1.0:a;
    A(B) = [];
    C = vertcat(B, ctranspose(A));
end % function
