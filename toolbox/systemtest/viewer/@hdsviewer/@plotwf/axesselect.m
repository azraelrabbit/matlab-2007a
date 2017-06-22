function axesselect(h, hFiltering, es, ed)
    % 1 5
    % 2 5
    % 3 5
    if eq(length(h.Waves), 0.0) || strcmp(h.Locked, 'on') || h.Waves(1.0).Data.Exception
        return
    end
    % 7 10
    % 8 10
    ax = handle(es);
    pos = get(ax, 'CurrentPoint');
    c1 = pos(1.0, :);
    c2 = pos(2.0, :);
    % 13 16
    % 14 16
    patches = h.Waves(1.0).View.Patches;
    if gt(numel(patches), 1.0)
        patches = patches(cellfun(@(x)x==es, ancestor(patches, {'axes'})));
    else
        if eq(numel(patches), 1.0) && ne(ancestor(patches, {'axes'}), es)
            return
        end
    end
    xvec = get(patches, {'xdata'});
    yvec = get(patches, {'ydata'});
    zvec = get(patches, {'zdata'});
    for k=1.0:length(yvec)
        y = yvec{k};
        if ~(isempty(y))
            ypos(k) = y(1.0);
        else
            ypos(k) = NaN;
        end
    end % for
    if lt(minus(c1(2.0), c2(2.0)), 0.0)
        [ypos, I] = sort(ypos);
    else
        [ypos, I] = sort(uminus(ypos));
        ypos = uminus(ypos);
    end
    xvec = xvec(I);
    zvec = zvec(I);
    for k=1.0:length(zvec)
        lambda = mrdivide(minus(ypos(k), c1(2.0)), minus(c2(2.0), c1(2.0)));
        x = plus(c1(1.0), mtimes(minus(c2(1.0), c1(1.0)), lambda));
        z = plus(c1(3.0), mtimes(minus(c2(3.0), c1(3.0)), lambda));
        slicexvec = xvec{k};
        slicezvec = zvec{k};
        floorlevel = slicezvec(1.0);
        if ge(x, slicexvec(1.0)) && le(x, slicexvec(end))
            ind = find(gt(slicexvec, x));
            mu = mrdivide(minus(x, slicexvec(minus(ind(1.0), 1.0))), minus(slicexvec(ind(1.0)), slicexvec(minus(ind(1.0), 1.0))));
            slicez = plus(mtimes(mu, minus(slicezvec(ind(1.0)), slicezvec(minus(ind(1.0), 1.0)))), slicezvec(minus(ind(1.0), 1.0)));
            if lt(z, slicez) && gt(z, floorlevel)
                iter = get(patches(I(k)), 'UserData');
                % 55 58
                % 56 58
                eventData = handle.EventData(h.Waves(1.0).View, 'Selection');
                schema.prop(eventData, 'GridPoint', 'MATLAB array');
                eventData.GridPoint = iter;
                % 60 63
                % 61 63
                h.Waves(1.0).View.setselect(eventData.GridPoint);
                drawnow
                % 64 67
                % 65 67
                h.Waves(1.0).View.send('Selection', eventData);
                return
            end
        end
    end % for
    set(hFiltering, 'Selectedgridpoint', NaN)
end
