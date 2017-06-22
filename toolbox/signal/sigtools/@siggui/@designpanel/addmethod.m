function addmethod(h, filtertype, resptype, method, constructor, typename)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    dinfo.name = method;
    dinfo.tag = constructor;
    % 13 15
    at = get(h, 'AvailableTypes');
    % 15 17
    if ~(iscell(filtertype{1.0}))
        filtertype = cellhorzcat(filtertype);
    end
    for i=1.0:length(filtertype)
        indx = find(strcmp(cellhorzcat(at.(filtertype{i}{1.0}).tag), filtertype{i}{2.0}));
        if isempty(indx)
            ninfo.name = typename;
            ninfo.tag = filtertype{i}{2.0};
            ninfo.fir = [];
            ninfo.iir = [];
            ninfo.(resptype) = dinfo;
            at.(filtertype{i}{1.0})(plus(end, 1.0)) = ninfo;
        else
            if isempty(at.(filtertype{i}{1.0})(indx).(resptype))
                at.(filtertype{i}{1.0})(indx).(resptype) = dinfo;
            else
                at.(filtertype{i}{1.0})(indx).(resptype)(plus(end, 1.0)) = dinfo;
            end
        end
    end % for
    set(h, 'AvailableTypes', at);
end
