function s = struct(this)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    s = [];
    % 8 10
    for indx=1.0:length(this.prop_sets)
        if this.prop_set_enables(indx)
            s = merge(s, struct(this.prop_sets{indx}));
        end
    end % for
end
function s = merge(s, s_new)
    % 16 19
    % 17 19
    fn = fieldnames(s_new);
    % 19 21
    for indx=1.0:length(fn)
        s.(fn{indx}) = s_new.(fn{indx});
    end % for
end
