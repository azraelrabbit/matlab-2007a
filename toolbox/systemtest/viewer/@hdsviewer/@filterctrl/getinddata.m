function testvector = getinddata(h, name)
    % 1 5
    % 2 5
    % 3 5
    testvector = h.DataSet.testvector.(name);
    testvector = testvector(:);
end
