function out = manifestlist(action, in1, in2)
    % 1 17
    % 2 17
    % 3 17
    % 4 17
    % 5 17
    % 6 17
    % 7 17
    % 8 17
    % 9 17
    % 10 17
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    persistent names;
    persistent manifests;
    % 18 20
    if isnumeric(manifests)
        names = {};
        manifests = {};
    end
    % 23 25
    switch action
    case 'get'
        dependencies.assert(ischar(in1), 'Second input must be a string');
        [stored, ind] = ismember(in1, names);
        if stored
            out = manifests{ind};
            if not(exist(out, 'file'))
                out = '';
            end
        else
            out = '';
        end
    case 'set'
        dependencies.assert(ischar(in1), 'Second input must be a string');
        dependencies.assert(ischar(in2), 'Third input must be a string');
        [stored, ind] = ismember(in1, names);
        if stored
            manifests{ind} = in2;
        else
            names{plus(end, 1.0)} = in1;
            manifests{plus(end, 1.0)} = in2;
        end
    otherwise
        error('Unexpected manifestlist action: %s', action);
    end
end
