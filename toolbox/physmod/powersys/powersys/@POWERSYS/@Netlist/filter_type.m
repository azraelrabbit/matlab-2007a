function idx = filter_type(nl, type)
    % 1 3
    % 2 3
    mask_types = get_param(nl.elements, 'MaskType');
    idx = find(strcmp(mask_types, type));
end % function
