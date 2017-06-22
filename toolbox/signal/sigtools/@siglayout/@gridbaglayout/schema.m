function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    pk = findpackage('siglayout');
    c = schema.class(pk, 'gridbaglayout', pk.findclass('gridlayout'));
    % 9 11
    p = schema.prop(c, 'HorizontalWeights', 'double_vector');
    set(p, 'GetFunction', @get_horizontalweights, 'SetFunction', @set_weights);
    % 12 14
    p = schema.prop(c, 'VerticalWeights', 'double_vector');
    set(p, 'GetFunction', @get_verticalweights, 'SetFunction', @set_weights);
end % function
function hw = get_horizontalweights(this, hw)
    % 17 20
    % 18 20
    nw = size(this.Grid, 2.0);
    % 20 23
    % 21 23
    hw = horzcat(hw, zeros(1.0, minus(nw, length(hw))));
    hw = hw(1.0:nw);
    % 24 26
    hw = ctranspose(hw(:));
end % function
function vw = get_verticalweights(this, vw)
    % 28 31
    % 29 31
    nh = size(this.Grid, 1.0);
    % 31 34
    % 32 34
    vw = horzcat(vw, zeros(1.0, minus(nh, length(vw))));
    vw = vw(1.0:nh);
    % 35 37
    vw = vw(:);
end % function
function w = set_weights(this, w)
    % 39 42
    % 40 42
    if any(lt(w, 0.0))
        error('Weights cannot be negative.');
    end % if
end % function
