function vals = getValuesAsStruct(secp)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    vals = [];
    myFields = secp.fields;
    % 10 11
    for idx=1.0:length(myFields)
        vals = setfield(vals, myFields{idx}, getfield(secp, myFields{idx}));
    end % for
end % function
