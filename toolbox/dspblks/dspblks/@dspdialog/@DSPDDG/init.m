function init(this, block)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    this.Block = block;
    % 7 9
    % 8 9
    parent = this.Block.getParent;
        while not(isa(parent, 'Simulink.BlockDiagram'))
        if not(isempty(parent))
            % 12 14
            % 13 14
            parent = parent.getParent;
        else
            % 16 24
            % 17 24
            % 18 24
            % 19 24
            % 20 24
            % 21 24
            % 22 24
            % 23 24
            if strcmp(this.Block.IOType, 'siggen') || strcmp(this.Block.IOType, 'viewer')
                % 25 26
                parent = get_param(this.Block.parent, 'object');
            end % if
        end % if
    end % while
    this.Root = parent;
end % function
