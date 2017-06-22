function update(h, Tnew, Bodies)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    h.PositionFcn(Tnew, Bodies, h);
    % 10 13
    % 11 13
    % 12 13
    h.PrevTime = Tnew;
    % 14 15
end % function
