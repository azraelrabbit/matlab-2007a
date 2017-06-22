function h = createMaskProperty(h, mask)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    p = schema.prop(h, 'Mask', 'double_vector');
    p.SetFunction = @setMask;
    p.GetFunction = @getMask;
    h.Mask = mask;
end % function
function mask = getMask(h, mask)
    % 13 15
    % 14 15
    mask = getmask(h);
end % function
