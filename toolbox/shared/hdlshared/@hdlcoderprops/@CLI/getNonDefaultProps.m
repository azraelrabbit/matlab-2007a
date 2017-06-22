function nonDefaultProps = getNonDefaultProps(this)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    f = fieldnames(this);
    nonDefaultProps = {};
    % 9 11
    for indx=1.0:length(f)
        p = findprop(this, f{indx});
        if ~(isequal(this.(f{indx}), p.FactoryValue))
            nonDefaultProps{plus(end, 1.0)} = f{indx};
        end
    end % for
end
