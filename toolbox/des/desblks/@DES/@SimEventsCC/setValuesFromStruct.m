function setValuesFromStruct(secp, vals)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    myFields = fieldnames(vals);
    % 10 11
    for idx=1.0:length(myFields)
        setfield(secp, myFields{idx}, getfield(vals, myFields{idx}));
    end % for
end % function
