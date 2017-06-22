function flag = isfdt(fdt)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    flag = 1.0;
    % 10 12
    if ~(isstruct(fdt))
        flag = 0.0;
        return
    end
    % 15 17
    f = fieldnames(fdt);
    % 17 19
    % 18 27
    % 19 27
    % 20 27
    % 21 27
    % 22 27
    % 23 27
    % 24 27
    % 25 27
    if ((((((((~(any(strcmp(f, 'type')))) | (~(any(strcmp(f, 'method'))))) | (~(any(strcmp(f, 'f'))))) | (~(any(strcmp(f, 'Rp'))))) | (~(any(strcmp(f, 'Rs'))))) | (~(any(strcmp(f, 'Fs'))))) | (~(any(strcmp(f, 'order'))))) | (~(any(strcmp(f, 'special'))))) | (ne(length(fdt), 1.0))
        flag = 0.0;
        return
    end
    % 30 32
    if (any(lt(fdt.f, 0.0))) | (any(diff(le(fdt.f, 0.0))))
        flag = 0.0;
    end
end
