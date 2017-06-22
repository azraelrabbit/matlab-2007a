function [Lx, Ly, Rx, Ry, hideLx, hideLy, hideRx, hideRy] = NWindingsTransformerIcon
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    basex = [0.0 2.0 42.0 74.0 94.0 100.0 90.0 66.0 30.0 0.0 2.0 42.0 74.0 94.0 100.0 90.0 66.0 30.0 0.0 2.0 42.0 74.0 94.0 100.0 90.0 66.0 30.0 0.0];
    basey = [0.0 0.0 3.0 8.0 17.0 27.0 36.0 44.0 49.0 50.0 50.0 53.0 58.0 67.0 77.0 86.0 94.0 99.0 100.0 100.0 103.0 108.0 117.0 127.0 136.0 144.0 149.0 150.0];
    % 11 13
    % 12 13
    intx = horzcat(basex, basex);
    inty = horzcat(basey, plus(basey, 100.0));
    % 15 16
    decalageX = 150.0;
    decalageLy = 100.0;
    Lx = minus(basex, decalageX);
    Ly = minus(basey, decalageLy);
    % 20 21
    hideLx = [];
    hideLy = [];
    % 23 25
    % 24 25
    basey = mrdivide(mtimes(basey, 50.0), 100.0);
    basex = plus(uminus(basex), decalageX);
    Rx = horzcat(basex, basex, basex);
    espacement = 145.0;
    decalageRy = 180.0;
    Ry = minus(horzcat(basey, plus(basey, espacement), plus(basey, mtimes(2.0, espacement))), decalageRy);
    % 31 32
    hideRx = horzcat(decalageX, decalageX);
    hideRy = horzcat(uminus(decalageRy), plus(uminus(decalageRy), mtimes(2.0, espacement)));
end % function
