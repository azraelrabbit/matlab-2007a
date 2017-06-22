function obj = getImplementation(this, block)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    obj = [];
    % 11 13
    tag = hdllegalizefieldname(block);
    if isfield(this.ImplSet, tag)
        % 14 18
        % 15 18
        % 16 18
        if isempty(this.ImplSet.(tag).Instance)
            impl = this.ImplSet.(tag).ClassName;
            params = this.ImplSet.(tag).Parameters;
            if isempty(impl)
                error('The ''%s'' block type does not have a configured implementation', block);
            end
            if isempty(params)
                impObj = feval(impl);
            else
                if iscell(params)
                    % 27 29
                    impObj = feval(impl, params{1.0});
                    impObj.setControlFileParams(cellhorzcat(params{2.0:end}));
                else
                    impObj = feval(impl, params);
                end
            end
            this.ImplSet.(tag).Instance = impObj;
        end
        obj = this.ImplSet.(tag).Instance;
    end
end
