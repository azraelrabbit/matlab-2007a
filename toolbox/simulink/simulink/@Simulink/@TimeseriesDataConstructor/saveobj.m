function s = saveobj(h)
    % 1 3
    % 2 3
    s = struct;
    % 4 5
    if not(isempty(h.Data)) && isa(h.Data, 'embedded.fi')
        s.Constructor = cellhorzcat('fi', h.Data.Data, struct(h.Data));
    else
        s.Data = h.Data;
        s.Constructor = h.Constructor;
    end % if
end % function
