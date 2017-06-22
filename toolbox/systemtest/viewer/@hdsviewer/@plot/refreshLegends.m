function refreshLegends(this)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    ax = this.AxesGrid.getaxes('2d');
    % 8 10
    ax = ax(ishandle(ax));
    % 10 12
    warn = warning('off');
    lwarn = lastwarn;
    for ct=1.0:length(ax)
        if strcmpi(get(ax(ct), 'visible'), 'off')
            leg = legend(double(ax(ct)), 'off');
        else
            leg = legend(double(ax(ct)));
            if not(isempty(leg))
                set(leg, 'Interpreter', 'none')
                pos = get(leg, 'position');
                legend(double(ax(ct)), 'off');
                newleg = legend(double(ax(ct)), 'show');
                if not(isempty(newleg))
                    newlegpos = get(newleg, 'position');
                    set(newleg, 'position', horzcat(pos(1.0), minus(plus(pos(2.0), pos(4.0)), newlegpos(4.0)), newlegpos(3.0), newlegpos(4.0)));
                    set(newleg, 'Interpreter', 'none')
                end % if
            end % if
        end % if
    end % for
    warning(warn);
    lastwarn(lwarn);
end % function
