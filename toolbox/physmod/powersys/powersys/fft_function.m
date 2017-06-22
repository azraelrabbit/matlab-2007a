function U = fft_function(u)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    figure_N = u(length(u), 1.0);
    mask = u(minus(length(u), 1.0), :);
    nDec = u(minus(length(u), 2.0), 1.0);
    base = u(minus(length(u), 3.0), :);
    % 16 18
    u = u(1.0:minus(length(u), 4.0), :);
    [r, c] = size(u);
    if eq(r, 1.0)
        N = c;
        S = mrdivide(mtimes(2.0, fft(u)), N);
        U(1.0) = mrdivide(S(1.0), 2.0);
        NN = ceil(mrdivide(N, 2.0));
        U(2.0:NN) = S(2.0:NN);
    else
        N = r;
        NN = ceil(mrdivide(N, 2.0));
        S = mrdivide(mtimes(2.0, fft(u)), N);
        U(1.0, :) = mrdivide(S(1.0, :), 2.0);
        U(2.0:NN, :) = S(2.0:NN, :);
    end % if
    U = rdivide(U, mtimes(ones(length(U), 1.0), base));
    UacRms = sqrt(sum(mrdivide(power(abs(U(2.0:length(U), :)), 2.0), 2.0)));
    UHarmRms = sqrt(sum(mrdivide(power(abs(U(3.0:length(U), :)), 2.0), 2.0)));
    U1Rms = sqrt(sum(mrdivide(power(abs(U(2.0, :)), 2.0), 2.0), 1.0));
    Udc = abs(U(1.0, :));
    Urms = sqrt(plus(power(UacRms, 2.0), power(Udc, 2.0)));
    k = rdivide(UHarmRms, UacRms);
    g = rdivide(U1Rms, UacRms);
    thr = 1e-06;
    U = abs(times(U, gt(abs(U), thr)));
    if eq(sum(eq(get(0.0, 'child'), figure_N)), 1.0)
        set(0.0, 'CurrentFigure', figure_N);
    else
        figure(figure_N);
        set(figure_N, 'units', 'normal', 'position', [.33 .5 .66 .3]);
    end % if
    MASK = mtimes(ones(length(U), 1.0), mask);
    % 49 51
    U_ = times(abs(U), MASK);
    Umax = plus(max(max(U_)), 1e-10);
    Umin = minus(min(min(U_)), 1e-10);
    % 53 55
    colormap([0.0 0.0 0.0]);
    bar(ctranspose(0.0:minus(length(U), 1.0)), U_);
    set(gcf, 'renderer', 'zbuffer');
    ax = axis;
    axis(horzcat(-1.0, mtimes(1.05, minus(length(U), 1.0)), mtimes(1.05, Umin), mtimes(1.05, Umax)));
    grid;
    xlabel('Order of Harmonic');
    ylabel('Magnitude based on "Base Peak" - Parameter');
    title('Peak Magnitude Spectrum called by Simulink', 'FontSize', 12.0);
    if gt(nDec, 0.0)
        txt1 = horzcat('Total  RMS  = ', num2str(round_nDec(Urms, nDec)));
        txt2 = horzcat('           DC    = ', num2str(round_nDec(Udc, nDec)));
        txt3 = horzcat('Fund. RMS = ', num2str(round_nDec(U1Rms, nDec)));
        txt4 = horzcat('Harm. RMS = ', num2str(round_nDec(UHarmRms, nDec)));
        txt5 = horzcat('AC      RMS = ', num2str(round_nDec(UacRms, nDec)));
        % 69 71
        ax = axis;
        x = plus(ax(1.0), mtimes(.5, minus(ax(2.0), ax(1.0))));
        y = plus(ax(3.0), mtimes(.95, minus(ax(4.0), ax(3.0))));
        dy = mtimes(.04, minus(ax(4.0), ax(3.0)));
        % 74 76
        text(x, y, txt1, 'FontSize', 10.0);
        y = minus(y, dy);
        text(x, y, txt2, 'FontSize', 10.0);
        y = minus(y, dy);
        text(x, y, txt3, 'FontSize', 10.0);
        y = minus(y, dy);
        text(x, y, txt4, 'FontSize', 10.0);
        y = minus(y, dy);
        text(x, y, txt5, 'FontSize', 10.0);
        y = minus(y, dy);
    end % if
    U = vertcat(U, Urms, Udc, U1Rms, UHarmRms, UacRms);
end % function
function X = round_nDec(x, n)
    y = mtimes(x, mpower(10.0, n));
    Y = round(y);
    X = mrdivide(Y, mpower(10.0, n));
end % function
