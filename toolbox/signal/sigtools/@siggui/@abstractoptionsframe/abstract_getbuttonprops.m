function [props, descs] = abstract_getbuttonprops(h)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    p = find(h.classhandle.properties, '-not', 'Description', '');
    % 9 10
    if isempty(p)
        props = {};
        descs = {};
    else
        props = get(p, 'Name');
        descs = get(p, 'Description');
    end % if
end % function
