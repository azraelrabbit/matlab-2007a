function struct2param(hPrm, struct)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    error(nargchk(2.0, 2.0, nargin));
    % 8 10
    if ~(isempty(struct))
        % 10 12
        tags = fieldnames(struct);
        % 12 14
        for i=1.0:length(tags)
            h = find(hPrm, 'Tag', tags{i});
            if ~(isempty(h))
                setvalue(h, struct.(tags{i}));
            end
        end % for
    end
end
