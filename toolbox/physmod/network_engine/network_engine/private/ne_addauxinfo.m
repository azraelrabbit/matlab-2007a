function ne_addauxinfo(prob)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    schema.prop(prob, 'nx', 'int32');
    schema.prop(prob, 'nz', 'int32');
    schema.prop(prob, 'colindx', 'MATLAB array');
    schema.prop(prob, 'colindz', 'int32');
end % function
