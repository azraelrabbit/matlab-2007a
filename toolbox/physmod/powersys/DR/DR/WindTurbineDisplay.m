function WindTurbineDisplay(block)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    block = getfullname(block);
    DisplayTurbChar = get_param(block, 'DisplayTurbChar');
    if strcmp(DisplayTurbChar, 'on')
        [power_A, power_B, power_C, power_D, wind_point_C] = getSPSmaskvalues(block, {'power_A','power_B','power_C','power_D','wind_point_C'});
        [speed_A, speed_B, speed_C, speed_D] = getSPSmaskvalues(block, {'speed_A','speed_B','speed_C','speed_D'});
        lambda_nom = str2num(get_param(horzcat(block, '/Wind Turbine'), 'lambda_nom'));
        cp_nom = str2num(get_param(horzcat(block, '/Wind Turbine'), 'cp_nom'));
        % 17 31
        % 18 31
        % 19 31
        % 20 31
        % 21 31
        % 22 31
        % 23 31
        % 24 31
        % 25 31
        % 26 31
        % 27 31
        % 28 31
        % 29 31
        c1_c6 = str2num(get_param(horzcat(block, '/Wind Turbine'), 'c1_c6'));
        c1 = c1_c6(1.0);
        c2 = c1_c6(2.0);
        c3 = c1_c6(3.0);
        c4 = c1_c6(4.0);
        c5 = c1_c6(5.0);
        c6 = c1_c6(6.0);
        beta = 0.0;
        fig_num = figure;
        clf(fig_num);
        wr_elec_pu = 1e-09:mrdivide(minus(plus(speed_D, .1), 1e-09), 100.0):plus(speed_D, .1);
        wr_mec_pu = mrdivide(wr_elec_pu, speed_C);
        wind_max = ceil(mtimes(mpower(mrdivide(1.2, power_C), .3333333333333333), wind_point_C));
        wind_min = round(mtimes(mpower(mrdivide(mrdivide(power_B, 3.0), power_C), .3333333333333333), wind_point_C));
        delta_wind1 = mrdivide(minus(wind_point_C, wind_min), 5.0);
        delta_wind2 = mrdivide(minus(wind_max, wind_point_C), 3.0);
        wind1 = wind_min:mrdivide(minus(wind_point_C, wind_min), 5.0):wind_point_C;
        wind2 = plus(wind_point_C, mrdivide(minus(wind_point_C, wind_min), 5.0)):mrdivide(minus(wind_point_C, wind_min), 5.0):plus(wind_max, mrdivide(minus(wind_point_C, wind_min), 5.0));
        wind_pu = mrdivide(horzcat(wind1, wind2), wind_point_C);
        for k=1.0:length(wind_pu)
            for i=1.0:length(wr_mec_pu)
                lambda_pu = mrdivide(wr_mec_pu(i), wind_pu(k));
                lambda = mtimes(lambda_pu, lambda_nom);
                lambda_i = mrdivide(1.0, minus(mrdivide(1.0, plus(lambda, mtimes(.08, beta))), mrdivide(.035, plus(mpower(beta, 3.0), 1.0))));
                cp = plus(mtimes(mtimes(c1, minus(minus(mrdivide(c2, lambda_i), mtimes(c3, beta)), c4)), exp(mrdivide(uminus(c5), lambda_i))), mtimes(c6, lambda));
                cp_pu = mrdivide(cp, cp_nom);
                Pwind_pu(k, i) = mtimes(mtimes(mpower(wind_pu(k), 3.0), cp_pu), power_C);
            end % for
        end % for
        for k=1.0:length(wind_pu)
            plot(wr_elec_pu, Pwind_pu(k, :))
            hold('on')
        end % for
        speed_B_C = mrdivide(speed_B, speed_C):mrdivide(mrdivide(minus(speed_C, speed_B), speed_C), 100.0):mrdivide(speed_C, speed_C);
        plot(horzcat(0.0, max(wr_elec_pu)), [0.0 0.0], '--')
        plot(horzcat(0.0, speed_A), horzcat(0.0, power_A), 'LineWidth', 2.0, 'Color', [1.0 0.0 0.0])
        text(plus(max(0.0, minus(speed_A, .1)), .01), plus(max(Pwind_pu(1.0, :)), .01), sprintf('%0.4g m/s', wind_min))
        hold('on')
        plot(horzcat(speed_A, speed_B), horzcat(power_A, power_B), 'LineWidth', 2.0, 'Color', [1.0 0.0 0.0])
        text(speed_A, minus(power_A, .02), 'A')
        hold('on')
        plot(mtimes(speed_B_C, speed_C), mtimes(power(speed_B_C, 3.0), power_C), 'LineWidth', 2.0, 'Color', [1.0 0.0 0.0])
        text(minus(speed_B, .02), power_B, 'B')
        hold('on')
        plot(horzcat(speed_C, speed_D), horzcat(power_C, power_D), 'LineWidth', 2.0, 'Color', [1.0 0.0 0.0])
        text(plus(speed_C, .01), minus(power_C, .03), 'C')
        text(minus(speed_C, .1), plus(power_C, .02), sprintf('%0.4g m/s', wind_point_C))
        hold('on')
        plot(horzcat(speed_D, max(wr_elec_pu)), horzcat(power_D, power_D), 'LineWidth', 2.0, 'Color', [1.0 0.0 0.0])
        text(speed_D, plus(power_D, .03), 'D')
        text(minus(max(wr_elec_pu), .1), max(Pwind_pu(length(wind_pu), :)), sprintf('%0.4g m/s', mtimes(max(wind_pu), wind_point_C)))
        plot(horzcat(speed_C, speed_C, 0.0), horzcat(0.0, power_C, power_C), '--')
        axis(horzcat(max(0.0, minus(speed_A, .1)), plus(speed_D, .1), -.1, plus(max(Pwind_pu(length(wind_pu), :)), .05)))
        % 83 85
        xlabel('Turbine speed (pu of generator synchronous speed)')
        ylabel('Turbine output power (pu of nominal mechanical power)')
        title('Turbine Power Characteristics (Pitch angle beta = 0 deg)')
        set_param(block, 'DisplayTurbChar', 'off')
    end % if
end % function
