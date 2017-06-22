function spurdata = calcemixspur(h, spurdata, zl, zs, z0, cktindex, addnewspur)
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
    error(nargchk(6.0, 7.0, nargin));
    % 14 17
    % 15 17
    checkproperty(h);
    fin = spurdata.Fin;
    pin = spurdata.Pin;
    idxin = spurdata.Idxin;
    [pl, freq] = calcpout(h, pin, fin, zl, zs, z0);
    idx = find(gt(pl, minus(max(pl), 99.0)));
    if not(isempty(idx))
        freq = freq(idx);
        pl = pl(idx);
        idxin = cellhorzcat(idxin{idx});
    end % if
    k = 1.0;
    n = length(spurdata.Freq{plus(k, cktindex)});
    m = length(freq);
    spurdata.Freq{plus(k, cktindex)} = vertcat(horzcat(spurdata.Freq{plus(k, cktindex)}), freq);
    spurdata.Pout{plus(k, cktindex)} = vertcat(horzcat(spurdata.Pout{plus(k, cktindex)}), pl);
    for i=1.0:m
        spurdata.Indexes{plus(cktindex, 1.0)}{plus(n, i), 1.0} = idxin{i};
    end % for
    % 35 38
    % 36 38
    spurdata.Fin = spurdata.Freq{plus(k, 1.0)}(1.0);
    spurdata.Pin = spurdata.Pout{plus(k, 1.0)}(1.0);
    spurdata = addmixspur(h, spurdata, zl, zs, z0, cktindex);
end % function
