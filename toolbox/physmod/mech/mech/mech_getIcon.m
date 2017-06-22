function img = mech_getIcon(name, domain)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    persistent REGISTRY;
    % 11 13
    if isempty(REGISTRY)
        REGISTRY = struct('names', {{}}, 'images', {{}});
        % 14 16
    end
    % 16 18
    idxs = find(strcmp(REGISTRY.names, name));
    % 18 20
    if isempty(idxs)
        img = mech_iconLoad(name);
        REGISTRY.names{plus(end, 1.0)} = name;
        REGISTRY.images{plus(end, 1.0)} = img;
        idxs = length(REGISTRY.names);
    else
        img = REGISTRY.images{idxs};
    end
end
