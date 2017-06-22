function out = resizeImage(varargin)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    in = varargin{2.0};
    scale = varargin{3.0};
    % 12 14
    % 13 14
    out_size = round(mtimes(scale, horzcat(size(in, 1.0), size(in, 2.0))));
    % 15 17
    % 16 17
    if islogical(in)
        out = false(horzcat(out_size, 3.0));
    else
        out = zeros(horzcat(out_size, 3.0), class(in));
    end % if
    % 22 24
    % 23 24
    in = double(in);
    % 25 27
    % 26 27
    temp = zeros(out_size(1.0), size(in, 2.0), 3.0);
    % 28 30
    % 29 30
    for k=1.0:3.0
        temp(:, :, k) = resize_columns(in(:, :, k), out_size(1.0));
    end % for
    % 33 36
    % 34 36
    % 35 36
    if islogical(out)
        for k=1.0:3.0
            % 38 39
            out(:, :, k) = ge(ctranspose(resize_columns(ctranspose(temp(:, :, k)), out_size(2.0))), .5);
        end % for
    else
        for k=1.0:3.0
            out(:, :, k) = ctranspose(resize_columns(ctranspose(temp(:, :, k)), out_size(2.0)));
        end % for
    end % if
end % function
function out = resize_columns(in, Mout)
    % 48 55
    % 49 55
    % 50 55
    % 51 55
    % 52 55
    % 53 55
    % 54 55
    scale = mrdivide(Mout, size(in, 1.0));
    % 56 58
    % 57 58
    if lt(scale, 1.0)
        filter_length = 11.0;
        b = ctranspose(design_filter(11.0, scale));
        % 61 66
        % 62 66
        % 63 66
        % 64 66
        % 65 66
        pad_length = floor(mrdivide(filter_length, 2.0));
        in = vertcat(in(ones(pad_length, 1.0), :), in, in(mtimes(end, ones(pad_length, 1.0)), :));
        % 68 70
        % 69 70
        in = conv2(in, b, 'valid');
    end % if
    % 72 74
    % 73 74
    yi = ctranspose(linspace(1.0, size(in, 1.0), Mout));
    out = interp1(in, yi);
end % function
function b = design_filter(N, Wn)
    % 78 82
    % 79 82
    % 80 82
    % 81 82
    odd = rem(N, 2.0);
    vec = 1.0:floor(mrdivide(N, 2.0));
    vec2 = mtimes(3.141592653589793, minus(vec, mrdivide(minus(1.0, odd), 2.0)));
    % 85 86
    wind = minus(.54, mtimes(.46, cos(mrdivide(mtimes(6.283185307179586, minus(vec, 1.0)), minus(N, 1.0)))));
    b = horzcat(times(fliplr(rdivide(sin(mtimes(Wn, vec2)), vec2)), wind), Wn);
    b = b(horzcat(vec, plus(floor(mrdivide(N, 2.0)), 1.0:odd), fliplr(vec)));
    b = mrdivide(b, abs(polyval(b, 1.0)));
end % function
